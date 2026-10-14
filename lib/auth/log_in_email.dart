import 'package:flutter/material.dart';
import 'package:fornate/auth/sign_up_email.dart';
import 'package:fornate/classat_and_variable/firebase_auth.dart';
import 'package:fornate/classat_and_variable/my_variably.dart';

class LogInEmail extends StatefulWidget {
  const LogInEmail({super.key});

  @override
  State<LogInEmail> createState() => _LogInEmailState();
}

class _LogInEmailState extends State<LogInEmail> {
  var email, password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //كونتينر الوان الخلفيه
          mybackGrawendCOntaner,
          //body
          ListView(
            children: [
              //logo
              Center(
                child: Image.asset(
                  'images/Artboard 2fornalogo.png',
                  width: 200,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: Form(
                    key: formstate,
                    child: Column(
                      children: [
                        //الايميل
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: sineInInputDecoration(
                              'فلان @ فلان.com', Icons.email),
                          onSaved: (newValue) => email = newValue,
                          style: textStyle6,
                          
                          validator: (value) {
                            if (!isValidEmail(value)) {
                              return 'error email';
                            }
                            if (value!.length > 100) {
                              return 'الايميل لايكون اكثر من 100 حرف';
                            }
                            if (value.length < 6) {
                              return 'الايميل لا يكون اقل من 6';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        //الباسورد
                        TextFormField(
                                                    keyboardType: TextInputType.visiblePassword,

                          decoration: sineInInputDecoration(
                              'كلمه السر ', Icons.password),
                          obscureText: true,
                          onSaved: (newValue) => password = newValue,
                          style: textStyle6,
                          validator: (value) {
                            // if (!isValidPassword(value)) {
                            //   return 'error password';
                            // }
                            if (value!.length > 100) {
                              return 'الباسورد لايكون اكثر من 100 حرف';
                            }
                            if (value.length < 6) {
                              return 'الباسورد لايكون اقل من 6 حرف';
                            }
                            return null;
                          },
                        ),
                        //لو عندو اكونت
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: Row(children: [
                            Text('اذا لم يكن لديك حساب ', style: textStyle6),
                            TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const SineUpEmail(),
                                      ));
                                },
                                child: const Text('انشئ حساب'))
                          ]),
                        ),
                        // تسجيل
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
                              var formData = formstate.currentState;
                              if (formData!.validate()) {
                                formData.save();

                                await signIn(context, email, password);
                              }
                            },
                            child: Text('تسجيل الدخول', style: textStyle3),
                          ),
                        ),
                        // خيارات تسجسل اخري
                        const SizedBox(
                          height: 50,
                          child: Divider(
                            height: 2,
                            color: Colors.blue,
                          ),
                        ),
                        //جوجل
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
                              await signUpGoogle(context);
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: Image.asset('images/google.png'),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                Text('جوجل ', style: textStyle3),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        //فيسبوك
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
                            onPressed: () async => null,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: Image.asset('images/facebock.png'),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                Text('فيس بوك ', style: textStyle3),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
              )
            ],
          ),
        ],
      ),
    );
  }
}
