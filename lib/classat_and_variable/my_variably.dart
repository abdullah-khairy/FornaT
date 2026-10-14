 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
  TextStyle textStyle1 = const TextStyle(color: Colors.white24,fontSize: 32 ,fontWeight: FontWeight.w300 ,);
    TextStyle textStyle3 = const TextStyle(color: Colors.white,fontSize: 20 ,fontWeight: FontWeight.bold ,);
    TextStyle textStyle4 =const  TextStyle(color: Colors.blue,fontSize: 16 ,fontWeight: FontWeight.bold ,);
    TextStyle textStyle5 =const TextStyle(color: Colors.white38);
    TextStyle textStyle6 =const TextStyle(color: Colors.white);
    TextStyle textStyle7 =const TextStyle(color: Colors.red);
            //كونتينر الوان الخلفيه 
Container mybackGrawendCOntaner= Container(
              decoration: containerBaackgroungDecoration,
            );

BoxDecoration containerTextFeildDecoration =  BoxDecoration(
                                            border: Border.all(
                                              color: Colors.blue,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color:const Color(0xff272556));


BoxDecoration containerBaackgroungDecoration = const  BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [ Color.fromARGB(255, 19, 35, 106), Color(0xff151515)]));


BoxDecoration mydecoration =   BoxDecoration(
  
                       border: Border.all(
                         color: Colors.white,
                       ),
                       borderRadius: BorderRadius.circular(15),
                       color: Colors.black45);

BoxDecoration buttonDecoration =  BoxDecoration(
              // boxShadow: [BoxShadow(color: Colors.white, blurRadius: 10)],
              color: Colors.black54,
              border: Border.all(
                color: Colors.blue,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(15),
            );


InputDecoration sineInInputDecoration(hint,icons) => InputDecoration(
  prefixIcon: Icon(icons,color: Colors.white38,)
  ,filled: true,fillColor: const Color(0xff272556)
          ,hintText: hint,
          hintStyle: textStyle5,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(width: 1,color:  Colors.blue,)));




          bool isValidEmail(Email) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(Email );
  }    
     bool isValidPassword(Password) {
    return RegExp(
            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
        .hasMatch(Password );
  }

  var dateTimeNow=DateTime.now();
var madateTimaeStyle='${dateTimeNow.day}/${dateTimeNow.month}/${dateTimeNow.year}';
   var MonthTimaeStyle =
    '${dateTimeNow.month}/${dateTimeNow.year}';
myTimestyle(Timestamp date) {
  return'${date.toDate().day}/${date.toDate().month}/${date.toDate().year} - ${date.toDate().hour}:${date.toDate().minute}';
}

 GlobalKey <FormState> formstate=new GlobalKey<FormState>();


 Row userNoleg(key, value) {
    return Row(
      children: [
        Text(
          '$key:',
          style: textStyle3,
        ),
        const SizedBox(
          width: 30,
        ),
        Text(
          overflow: TextOverflow.ellipsis,
          '$value',
          style: textStyle6,
        ),
      ],
    );
  }