import 'package:flutter/material.dart';
import 'package:fornate/classat_and_variable/my_variably.dart';

class Loding extends StatelessWidget {
  const Loding({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
      children:  [
        const CircularProgressIndicator(),
        Text("Loading............",style:textStyle1,),
      ],
    ));
  }
}
