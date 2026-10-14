import 'package:flutter/material.dart';
import 'package:fornate/auth/log_in_email.dart';
import 'package:fornate/classat_and_variable/firebase_auth.dart';
import 'package:fornate/classat_and_variable/my_variably.dart';

 class SineUpEmail extends StatefulWidget {
  const SineUpEmail({super.key});

  @override
  State<SineUpEmail> createState() => _SineUpEmailState();
}

class _SineUpEmailState extends State<SineUpEmail> {
var username,email,password,passwordgen; 

  @override
  Widget build(BuildContext context) {  
    return  Scaffold(body: Stack(
      children: [
            //كونتينر الوان الخلفيه 
           mybackGrawendCOntaner,
           //body
        ListView(children: [ 
          Center(
            child: Image.asset('images/Artboard 2fornalogo.png',width: 200,),),
          Container(padding:const EdgeInsets.all(20),
          child: Form(
            key: formstate,
            child: Column(children: [
              //اسم المستخدم
            TextFormField(
              decoration:sineInInputDecoration('اسم المستخدم',Icons.person),
              onSaved: (newValue) => username=newValue,
               style: textStyle6,
              validator: (value) {
                if (value!.length>100) {
                  return 'اسم المستخدم لايكون اكثر من 100 حرف ';
                }  if (value.length<2) {
                  return 'اسم المستخدم لايكون اقل من حرفين';
                }return null;
              },
            ),
          const  SizedBox(height: 8,),
          //الايميل
            TextFormField(
                                        keyboardType: TextInputType.emailAddress,

              decoration:sineInInputDecoration('الايميل',Icons.email),
                        onSaved: (newValue) => email=newValue,
               style: textStyle6,
               validator: (value) {
                  if (!isValidEmail(value)) {
                  return 'error email';
                } 
                if (value!.length>100) {
                  return ' الايميل لايكون اكثر من 100 حرف ';
                }  if (value.length<2) {
                  return ' الايميل لايكون اقل من حرفين';
                }return null;
              },
            ),
             const  SizedBox(height: 8,),
             //الباسورد
            TextFormField(
                                        keyboardType: TextInputType.visiblePassword,

              decoration:sineInInputDecoration('كلمه السر ',Icons.password),  
               obscureText: true,
               onSaved: (newValue) => password=newValue,
                     style: textStyle6,
               validator: (value) {
                //  if (!isValidPassword(value)) {
                //   return 'error password';
                // }
               if (value!.length>100) {
                  return 'كلمه السر لاتكون اكثر من 100 حرف ';
                }  if (value.length<2) {
                  return 'كلمه السر لاتكون اقل من حرفين';
                }return null;
              },
            ),
             const  SizedBox(height: 8,),
             //لو عندو اكونت 
            Container(margin:const EdgeInsets.all(10),child: Row(children: [
              Text('اذا كان لديك حساب  ',style: textStyle6,),
              TextButton(onPressed: (){            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LogInEmail(),));
}, child:const Text('سجل الدخول'))
            ]),),
            //انشاء حساب
             Container(
                      height: 45,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: const Color(0xff272556),
                        border: Border.all(
                          color: Colors.cyan,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: MaterialButton(
                    onPressed: ()async{
              await signUp(context, username, email, password);
            
              },
                        child: Text('انشاء الحساب',
                            style: textStyle3),
                      ),
                    ),
                  
          ],)),)
        ],),
      ],
    ),);
  }
}