import 'package:flutter/material.dart';
import 'package:fornate/classat_and_variable/my_variably.dart';

import '../../classat_and_variable/cloude_firestore.dart';
import '../../widget/loding.dart';


class EditClints extends StatefulWidget {
   EditClints({super.key, required this.uid});
String uid;

  @override
  State<EditClints> createState() => _EditClintsState();
}

class _EditClintsState extends State<EditClints> {
  TextEditingController _name=TextEditingController();
  TextEditingController _child=TextEditingController();
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            //back ground
            Container(
              decoration:containerBaackgroungDecoration
            ),
            //body
            FutureBuilder(
              future: cardUsers.doc(widget.uid).get(),
              builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
          return const Loding();
        }
           _name.text= snapshot.data!.get('name');
            _child.text= snapshot.data!.get('child').toString();
             
              return Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   const Text('Receive a card',
                        style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  const  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Divider(
                        color: Color(0xff272556),
                        height: 0.1,
                      ),
                    ),
                    // القائمه
                    Expanded(
                        child: Form(
                          key: formstate,
                          child: ListView(
                          shrinkWrap: true,
                          children: [
                          //User Name
                        
                          Padding(
                            padding: const EdgeInsets.all(8.0), 
                            child: TextFormField(
                               validator: (value) {
                                            if (value!.length>100) {
                        return 'لايكون الاسم اكثر من 100 حرف';
                         }  if (value.length<6) {
                        return 'لايكون الاسم اقل من 6 احرف';
                      }return null;
                                        },
          decoration:sineInInputDecoration('الاسم',Icons.person),
                          
                              controller: _name,
                              style: textStyle6,
                            
                             
                            ),
                          ),
                           //User Child
                         
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                               validator: (value) {
                                           if (value!.length>6) {
                        return 'لا يمكن ان يزيد عن 6 ارقام';
                      }  if (value.length<1) {
                        return 'لا يمكن ان يقل عن رقم';
                      }return null;
                                        },
          decoration:sineInInputDecoration('عدد الافراد',Icons.person),
                          
                              controller: _child,
                              style: textStyle6,
                            
                             
                            ),
                          ),
                          
                                               ],
                                            ),
                        )),
                    const Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Divider(
                        color: Color(0xff272556),
                        height: 0.1,
                      ),
                    ),
                   const SizedBox(
                      height: 16,
                    ),
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
                        onPressed: () async {
                           var formData=formstate.currentState;
   if (formData!.validate() ) {
      formData.save();
      snapshot.data!.reference.update({
         'name':_name.text,
        'child':int.parse(_child.text),
      }).whenComplete(() =>Navigator.pop(context) );
                                // addUsers(_name.text, int.parse(_child.text)).whenComplete(() => Navigator.pop(context) );

      
      }
                        
                          },
                        child: Text('حفظ التعديل ',
                            style: textStyle3),
                      ),
                    )
                  ]),
            );
         
            },)
             ],
        ),
      ),
    );
 }
}