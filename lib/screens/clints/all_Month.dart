import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fornate/classat_and_variable/cloude_firestore.dart';
import 'package:fornate/classat_and_variable/my_variably.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../../widget/bunner_ads.dart';
import '../../widget/loding.dart';
import '../homePage.dart';

class AllMonth extends StatefulWidget {
  AllMonth({super.key, required this.uid});
  String uid;
  @override
  State<AllMonth> createState() => _AllMonthState();
}

class _AllMonthState extends State<AllMonth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(decoration: containerBaackgroungDecoration),

            // القائمه
            StreamBuilder(
                stream: cardUsers.doc(widget.uid).snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Loding();
                  }
                  List history = snapshot.data!.get('history');
                  List ags = snapshot.data!.get('ags');
                  var child = snapshot.data!.get('child');
                  var myLastMonth = snapshot.data!.get('LastMonth');
                  var myLastTowMonth = snapshot.data!.get('LastTowMonth');
                  dynamic total = child! * 5 * 30;

                  //........................................................................................
                  List currntMonth = []; //الشهر الحالي
                  history.forEach((element) {
                    Timestamp date = element['date'];
                    var dateStyle =
                        '${date.toDate().month}/${date.toDate().year}';
                    bool day = dateStyle == MonthTimaeStyle;
                    day
                        ? currntMonth.add({
                            'value': 'رغيف : ${element['value']}',
                            'date': element['date']
                          })
                        : null;
                  });
                  ags.forEach((element) {
                    Timestamp date = element['date'];
                    var dateStyle =
                        '${date.toDate().month}/${date.toDate().year}';
                    bool day = dateStyle == MonthTimaeStyle;
                    day
                        ? currntMonth.add({
                            'value': 'بيضه : ${element['value']}',
                            'date': element['date']
                          })
                        : null;
                  });
                  //...........................................................................................................                  //........................................................................................
                  List LastMonth = []; //الشهر السابق
                  List LastBrid = [];
                  List LastAgs = [];
                  history.forEach((element) {
                    Timestamp date = element['date'];
                    var dateStyle =
                        '${date.toDate().month}/${date.toDate().year}';
                    var month = dateTimeNow.month < 1
                        ? ((dateTimeNow.month) + 12)
                        : ((dateTimeNow.month) - 1);
                    bool day = dateStyle == '$month/${dateTimeNow.year}';
                    day
                        ? {
                            LastMonth.add({
                              'value': 'رغيف : ${element['value']}',
                              'date': element['date']
                            }),
                            LastBrid.add(element['value']),
                          }
                        : null;
                  });
                  ags.forEach((element) {
                    Timestamp date = element['date'];
                    var dateStyle =
                        '${date.toDate().month}/${date.toDate().year}';
                    var month = dateTimeNow.month < 1
                        ? ((dateTimeNow.month) + 12)
                        : ((dateTimeNow.month) - 1);
                    bool day = dateStyle == '$month/${dateTimeNow.year}';
                    day
                        ? {
                            LastMonth.add({
                              'value': 'بيضه : ${element['value']}',
                              'date': element['date']
                            }),
                            LastAgs.add(element['value']),
                          }
                        : null;
                  });
                  var importLastBrid = LastBrid.isEmpty
                      ? 0
                      : LastBrid.reduce((value, element) => value + element);
                  var importLastAgs = LastAgs.isEmpty
                      ? 0
                      : LastAgs.reduce((value, element) => value + element);
                  var ageEx =
                      20 * (importLastAgs * agsPrice); //المستهلك من البض
                  var LastallEx = importLastBrid + ageEx;
                  var Lasthave = total - LastallEx;
                  var Lastmony = Lasthave * bridPrice;
                  //...........................................................................................................
                  List LastTowMonth = []; //الشهر اللي قبل السابق
                  List LastTowBrid = [];
                  List LastTowAgs = [];
                  history.forEach((element) {
                    Timestamp date = element['date'];
                    var dateStyle =
                        '${date.toDate().month}/${date.toDate().year}';
                    var month = dateTimeNow.month < 2
                        ? ((dateTimeNow.month) + 12)
                        : ((dateTimeNow.month) - 2);
                    bool day = dateStyle == '$month/${dateTimeNow.year}';
                    day
                        ? {
                            LastTowMonth.add({
                              'value': 'رغيف : ${element['value']}',
                              'date': element['date']
                            }),
                            LastTowBrid.add(element['value']),
                          }
                        : null;
                  });
                  ags.forEach((element) {
                    Timestamp date = element['date'];
                    var dateStyle =
                        '${date.toDate().month}/${date.toDate().year}';
                    var month = dateTimeNow.month < 2
                        ? ((dateTimeNow.month) + 12)
                        : ((dateTimeNow.month) - 2);
                    bool day = dateStyle == '$month/${dateTimeNow.year}';
                    day
                        ? {
                            LastTowMonth.add({
                              'value': 'بيضه : ${element['value']}',
                              'date': element['date']
                            }),
                            LastTowAgs.add(element['value']),
                          }
                        : null;
                  });
                  var importLastToBrid = LastTowBrid.isEmpty
                      ? 0
                      : LastTowBrid.reduce((value, element) => value + element);
                  var importLastToAgs = LastTowAgs.isEmpty
                      ? 0
                      : LastTowAgs.reduce((value, element) => value + element);
                  var LastTowageEx =
                      20 * (importLastToAgs * agsPrice); //المستهلك من البض
                  var LastTowallEx = importLastToBrid + LastTowageEx;
                  var LastTowhave = total - LastTowallEx;
                  var LastTowmony = LastTowhave * bridPrice;
                  //...........................................................................................................
                  //جزف باقي الشهور
                  history.forEach((element) {
                    Timestamp date = element['date'];
                    var dateStyle = date.toDate().month;
                    var month = dateTimeNow.month < 3
                        ? ((dateTimeNow.month) + 12)
                        : ((dateTimeNow.month) - 3);
                    bool day = dateStyle == month;
                    day
                        ? snapshot.data!.reference.update({
                            'history': FieldValue.arrayRemove([element])
                          })
                        : null;
                  });
                  ags.forEach((element) {
                    Timestamp date = element['date'];
                    var dateStyle = date.toDate().month;
                    var month = dateTimeNow.month < 3
                        ? ((dateTimeNow.month) + 12)
                        : ((dateTimeNow.month) - 3);
                    bool day = dateStyle == month;
                    day
                        ? snapshot.data!.reference.update({
                            'ags': FieldValue.arrayRemove([element])
                          })
                        : null;
                  });
                  //...........................................................................................................
                  return Container(
                    padding: EdgeInsets.all(16),
                    margin: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(children: [
                      const Text('التواريخ',
                          style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
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
                      Flexible(
                        child: ListView(
                          children: [
                            MyBunnerAds(),
                            Text('الشهر الحالي', style: textStyle4),
                            Column(
                                //الشهر الحالي
                                children: currntMonth
                                    .map(
                                      (e) => Text(
                                        '${e['value'].toString()}   ${myTimestyle(e['date'])}',
                                        style: textStyle3,
                                      ),
                                    )
                                    .toList()),
                            MyBunnerAds(),
                            Text('الشهر السابق', style: textStyle4),
                            ListTile(
                              leading: Icon(
                                Icons.check_circle_sharp,
                                color:
                                    myLastMonth ? Colors.green : Colors.white,
                              ),
                              title: Text(
                                'تم تصفيه حساب هاذا الشهر',
                                style: textStyle7,
                              ),
                            
                            ),
                            userNoleg('سحب الخبز', '$importLastBrid رغيف'),
                            userNoleg('سحب البيض', '$importLastAgs بيضة'),
                            userNoleg('المستهلك', '$LastallEx رغيف'),
                            userNoleg('المتبقي', '$Lasthave رغيف'),
                            userNoleg('فرق الخبز', '$Lastmony  جنيه مصري'),
                            Column(
                                //الشهر الحالي
                                children: LastMonth.map(
                              (e) => Text(
                                '${e['value'].toString()}   ${myTimestyle(e['date'])}',
                                style: textStyle3,
                              ),
                            ).toList()),
                            MyBunnerAds(),
                            Text('الشهر قبل السابق', style: textStyle4),
                            ListTile(
                              leading: Icon(
                                Icons.check_circle_sharp,
                                color: myLastTowMonth
                                    ? Colors.green
                                    : Colors.white,
                              ),
                              title: Text(
                                'تم تصفيه حساب هاذا الشهر',
                                style: textStyle7,
                              ),
                              
                            ),
                            userNoleg('سحب الخبز', '$importLastToBrid رغيف'),
                            userNoleg('سحب البيض', '$importLastToAgs بيضة'),
                            userNoleg('المستهلك', '$LastTowallEx رغيف'),
                            userNoleg('المتبقي', '$LastTowhave رغيف'),
                            userNoleg('فرق الخبز', '$LastTowmony  جنيه مصري'),
                            Column(
                                //الشهر الحالي
                                children: LastTowMonth.map(
                              (e) => Text(
                                '${e['value'].toString()}   ${myTimestyle(e['date'])}',
                                style: textStyle3,
                              ),
                            ).toList()),
                            MyBunnerAds(),
                          ],
                        ),
                      ),
                      MyBunnerAds(),
                    ]),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
