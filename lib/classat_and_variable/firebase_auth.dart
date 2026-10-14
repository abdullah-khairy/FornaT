import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fornate/classat_and_variable/my_variably.dart';
import 'package:fornate/screens/homePage.dart';
import 'package:google_sign_in/google_sign_in.dart';
var auth =FirebaseAuth.instance;


  myAccount()async=> await FirebaseAuth.instance
  .authStateChanges()
  .listen((User? user) =>user);

final user = FirebaseAuth.instance.currentUser;

//sign In
signIn(context,email,password)async{
  
    try {
   await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email,
    password: password
  ).then((ValueKey) =>  ValueKey.user!=null   ?    Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MyHomePage(),
                                  )):null);
} on FirebaseAuthException catch (e) {
         showDialog(context: context, builder:(context) => 
          Dialog(child: Container(
            padding: const EdgeInsets.all(23),
            decoration: containerTextFeildDecoration,child:
           ListView(
            shrinkWrap: true,
            children: [
            const Icon(Icons.warning_amber,size: 50,color: Colors.amber,),
            Text(e.code.toString(),style: textStyle3,textAlign: TextAlign.center,)
           ],),),));
}
}

signUp(context,username, email,password)async{
   var formData=formstate.currentState;
   if (formData!.validate() ) {
      formData.save();
     try {
 await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email,
    password: password,
  ).then((ValueKey) =>  ValueKey.user!=null   ?    Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MyHomePage(),
                                  )):null)
  ;
} on FirebaseAuthException catch (e) {
  showDialog(context: context, builder:(context) => 
          Dialog(child: Container(
            padding: const EdgeInsets.all(23),
            decoration: containerTextFeildDecoration,child:
           ListView(
            shrinkWrap: true,
            children: [
            const Icon(Icons.warning_amber,size: 50,color: Colors.amber,),
            Text(e.code.toString(),style: textStyle3,textAlign: TextAlign.center,)
           ],),),));
} 
   }else {print('not valed');}
}


signUpGoogle(context)async{
       try {
  await signInWithGoogle().whenComplete(() =>  user!=null   ?    Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MyHomePage(),
                                  )):null);
} on FirebaseAuthException catch (e) {
  showDialog(context: context, builder:(context) => 
          Dialog(child: Container(
            padding: const EdgeInsets.all(23),
            decoration: containerTextFeildDecoration,child:
           ListView(
            shrinkWrap: true,
            children: [
            const Icon(Icons.warning_amber,size: 50,color: Colors.amber,),
            Text(e.code.toString(),style: textStyle3,textAlign: TextAlign.center,)
           ],),),));
} 
}



Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}

