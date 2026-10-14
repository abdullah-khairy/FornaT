import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fornate/classat_and_variable/firebase_auth.dart';
import 'package:fornate/classat_and_variable/my_variably.dart';

import '../screens/homePage.dart';

CollectionReference cardUsers =
    FirebaseFirestore.instance.collection('cardUsers');
CollectionReference fornaUsers =
    FirebaseFirestore.instance.collection('fornaUsers');
//اضافه عميل  جديد
Future addUsers(
  name,
  child,
) async {
  List add = [];
  await cardUsers.doc(user!.uid).set({
    'name': name,
    'child': child,
    'fornaId': user!.uid,
    'userId': '',
    'history': add,
    'ags': add,
    'tackcard': false
  });
}

//اضافه يوم  جديد
Future addNewImport() async {
  List NewValue = [
    {
      'date': dateTimeNow,
      'import': 0,
      'value': 0,
      'mony': '0',
    }
  ];
  await cardUsers
      .doc(user!.uid)
      .update({'history': FieldValue.arrayUnion(NewValue)});
}

void prices() async {
  String? fornaId;
  await cardUsers
      .doc(user!.uid)
      .get()
      .then((value) => fornaId = value.get('fornaId'));
  print('//////////////////////////////////////////////////////');
  print(fornaId);
print('//////////////////////////////////////////////////////');
  await fornaUsers.doc(fornaId).get().then((value) async {
    agsPrice = await value.get('agsPrice');
    bridPrice = await value.get('price');
  });
    print('//////////////////////////////////////////////////////');
  print(agsPrice);
  print(bridPrice);
print('//////////////////////////////////////////////////////');
}
