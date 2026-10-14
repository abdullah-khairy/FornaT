import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fornate/classat_and_variable/cloude_firestore.dart';
import 'package:fornate/classat_and_variable/firebase_auth.dart';
import 'package:fornate/screens/clints/add_my_acount.dart';
import 'package:fornate/screens/Tamwen/tamwen_data.dart';
import 'package:fornate/screens/clints/all_Month.dart';
import 'package:fornate/screens/minu_option.dart';
import 'package:fornate/widget/bunner_ads.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../classat_and_variable/ad_helper.dart';
import '../widget/loding.dart';
import 'package:fornate/classat_and_variable/my_variably.dart';

double agsPrice = 0;
double bridPrice = 0;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    prices();
    super.initState();
  }

  int valu = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            //كونتينر الوان الخلفيه
            mybackGrawendCOntaner,
            //التصميم للصفحه
            Column(
              children: [
                // المعلومات
                Expanded(
                  flex: 3,
                  child: InkWell(
                    onTap: () => setState(() {}),
                    child: Container(
                        padding: const EdgeInsets.all(16),
                        margin: const EdgeInsets.fromLTRB(32, 16, 32, 0),
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: SingleChildScrollView(
                          child: StreamBuilder(
                            stream: cardUsers.doc(user!.uid).snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Loding();
                              }
                              if (!snapshot.data!.exists) {
                                return AddNewAccount();
                              }
                              String name = snapshot.data!.get('name');
                              bool tackcard = snapshot.data!.get('tackcard');
                              List history = snapshot.data!.get('history');
                              List myags = snapshot.data!.get('ags');
                              int child = snapshot.data!.get('child');

                              dynamic total = child * 5 * 30;

                              //.......................................................
                              List<int> allMyvalue = []; //كل العيش
                              history.forEach((element) {
                                Timestamp date = element['date'];
                                var dateStyle =
                                    '${date.toDate().month}/${date.toDate().year}';
                                bool day = dateStyle == MonthTimaeStyle;
                                day ? allMyvalue.add(element['value']) : null;
                              });
                              var importBrid = history.isEmpty
                                  ? 0
                                  : allMyvalue.reduce(
                                      (value, element) => value + element);
                              //.........................................................

                              List<int> allMyags = []; //كل البيض
                              myags.forEach((element) {
                                Timestamp date = element['date'];
                                var dateStyle =
                                    '${date.toDate().month}/${date.toDate().year}';
                                bool day = dateStyle == MonthTimaeStyle;
                                day ? allMyags.add(element['value']) : null;
                              });
                              var importAgs = myags.isEmpty
                                  ? 0
                                  : allMyags.reduce(
                                      (value, element) => value + element);

                              //....................................................................
                              var ageMony =
                                  importAgs * (agsPrice); // فلوس البيض المستهلك
                              var bridMony =
                                  importBrid / 20; //فلوس العيش المستهلك
                              var allbride = (ageMony + bridMony) *
                                  20; //كل العيش المستهلك مع فارق البيض
                              var mony = (total - allbride) *
                                  (bridPrice); //فلوس فارق العيش
                              var dridHave =
                                  total - allbride; // المتبقي من العيش

                              return Column(
                                children: [
                                  ListTile(
                                      title: Text(
                                        name.toString(),
                                        style: textStyle3,
                                      ),
                                      subtitle: Text(
                                        user!.email.toString(),
                                        style: textStyle6,
                                      ),
                                      trailing: IconButton(
                                          onPressed: () => menuOption(
                                                context: context,
                                              ),
                                          icon: const Icon(
                                            Icons.menu,
                                            color: Colors.white,
                                          ))),
                                  ListTile(
                                    leading: Icon(
                                      Icons.check_circle_sharp,
                                      color: tackcard
                                          ? Colors.green
                                          : Colors.white30,
                                    ),
                                    title: Text(
                                      'الكرت',
                                      style: textStyle5,
                                    ),
                                  ),
                                  userNoleg('الافراد', child.toString()),
                                  userNoleg('الحصه الشهريه', '$total رغيف'),
                                  userNoleg('سحب الخبز', '$importBrid رغيف'),
                                  userNoleg('سحب البيض', '$importAgs بيضة'),
                                  userNoleg('المتبقي', '$dridHave رغيف'),
                                  userNoleg('سحب الكلي', '$allbride رغيف'),
                                  userNoleg('فرق الخبز', '$mony  جنيه مصري'),
                                ],
                              );
                            },
                          ),
                        )),
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                //اعلان بانر
                MyBunnerAds(),
                //الزراير
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 32),
                    child: Row(
                      children: [
                        //
                        Expanded(
                          child: Container(
                            decoration: mydecoration,
                            height: 122,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (Context) =>
                                            const TamwenData()));
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.credit_card,
                                    color: Colors.white,
                                    size: 32,
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    'التموين',
                                    style: textStyle3,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        // اضافه التاريخ
                        Expanded(
                          child: Container(
                            decoration: mydecoration,
                            height: 122,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (Context) => AllMonth(
                                              uid: user!.uid,
                                            )));
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.history,
                                    color: Colors.white,
                                    size: 32,
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    'مواعيد السحب',
                                    style: textStyle3,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  ListTile userNoleg(key, value) {
    return ListTile(
        leading: Text(
          '$key:',
          style: textStyle3,
        ),
        title: Text(
          value,
          style: textStyle6,
        ));
  }
}
