import 'package:flutter/material.dart';
import 'package:fornate/classat_and_variable/cloude_firestore.dart';
import 'package:fornate/classat_and_variable/my_variably.dart';



class AddNewAccount extends StatelessWidget {
 
  TextEditingController _name=TextEditingController();
  TextEditingController _child=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formstate,
      child: Column(
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
      Center(
        child: Text(
        madateTimaeStyle,
          style: textStyle3,
        ),
      ),
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
            addUsers(_name.text, int.parse(_child.text)).whenComplete(() => Navigator.pop(context) );
    
       
       }
    
      },
    child: Text('حفظ',
        style: textStyle3),
            ),
          )
        
 
                           ],
                        ),
    );
  }
}