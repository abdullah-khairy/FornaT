import 'package:flutter/material.dart';
import 'package:fornate/classat_and_variable/my_variably.dart';


class TamwenData extends StatefulWidget {
  const TamwenData({super.key});

  @override
  State<TamwenData> createState() => _TamwenDataState();
}

class _TamwenDataState extends State<TamwenData> {

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration:containerBaackgroungDecoration
            ),
            Container(
              padding:const EdgeInsets.all(16),
              margin:const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children:const [
                    Text('التموين مع  فارق الخبز',
                        style: TextStyle(
                            fontSize: 23,   
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                 
                   ]),
            ),
          ],
        ),
      ),
    );
  }
}