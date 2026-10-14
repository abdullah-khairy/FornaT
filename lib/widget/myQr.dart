import 'package:flutter/material.dart';
import 'package:fornate/classat_and_variable/firebase_auth.dart';
import 'package:qr_flutter/qr_flutter.dart';


void QrViewID({
  required context,
 
}) {
  showDialog(
      context: context,
      builder: (context) => Dialog(
          insetPadding: EdgeInsets.all(70),
          backgroundColor: Colors.black54,
          child: QrDesine(
           
          )));
}

class QrDesine extends StatelessWidget {
 
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
      child: QrImage(
        foregroundColor:Colors.white,
  data: user!.uid,
  version: QrVersions.auto,
  size: 200.0,
), );
  }
}
