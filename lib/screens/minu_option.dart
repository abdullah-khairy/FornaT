import 'package:flutter/material.dart';
import 'package:fornate/auth/log_in_email.dart';
import 'package:fornate/classat_and_variable/firebase_auth.dart';
import 'package:fornate/classat_and_variable/my_variably.dart';
import 'package:fornate/screens/clints/edit_clints.dart';

import '../widget/myQr.dart';


void menuOption({
  required context,
 
}) {
  showDialog(
      context: context,
      builder: (context) => Dialog(
          insetPadding: EdgeInsets.all(70),
          backgroundColor: Colors.black54,
          child: PayType(
           
          )));
}

class PayType extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
  
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.blue,
          ),
          borderRadius: BorderRadius.circular(15),
          color: Colors.black54),
      child: ListView(
        shrinkWrap: true,
        children: [
          //edit
         ListTile(
          leading:const Icon(Icons.edit,color: Colors.white,),
          title: Text('تعديل الحسب',style: textStyle6,),
          onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => EditClints(uid:user!.uid,),));
          },
        ),  
          //qr
         ListTile(
          leading:const Icon(Icons.qr_code,color: Colors.white,),
          title: Text('Qr حسابي',style: textStyle6,),
          onTap: () {
            Navigator.pop(context);
                     QrViewID(context: context);
          },
        ), 
        const SizedBox(
                      height: 32,
                    ),
            const Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Divider(
                        color: Colors.blue,
                        height:3,
                      ),
                    ),
                  
        //sign out
        ListTile(
          leading:const Icon(Icons.logout_rounded,color: Colors.red,),
          title:const Text('تسجيل الخروج',style: TextStyle(color: Colors.red),),
          onTap: () {
            auth.signOut().whenComplete(() => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LogInEmail(),)));
          },
        ),
        ],
      ),
    );
  }
}
