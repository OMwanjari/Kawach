// ignore: depend_on_referenced_packages
import 'package:flutter/gestures.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health/auth_controller.dart';

import 'signin_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool changeButton = false;
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(children: [
              SizedBox(
                height: h * 0.01,
              ),
              Image.asset(
                'assets/images/login.jpg',
                height: h * 0.3,
              ),
              const Align(
                alignment: Alignment.bottomCenter,
              ),
              Container(
                height: h * 0.5,
                width: w * 0.95,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(h * 0.06),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade500,
                      offset: const Offset(4.0, 4.0),
                      blurRadius: 15.0,
                      spreadRadius: 5.0,
                    ), // BoxShadow
                    const BoxShadow(
                      color: Colors.white,
                      offset: Offset(-4.0, -4.0),
                      blurRadius: 15.0,
                      spreadRadius: 5.0,
                    ),
                  ],
                  color: Colors.deepPurple[200],
                ),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.center,
                    ),
                    SizedBox(
                      height: h * 0.03,
                    ),
                    Text(
                      "Welcome Back",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: h * 0.035),
                    ),
                    SizedBox(
                      height: h * 0.02,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: h * 0.015, horizontal: h * 0.02),
                      child: Column(
                        children: [
                          SizedBox(
                            width: 0.8 * w,
                            child: TextFormField(
                                controller: emailController,
                                decoration: InputDecoration(
                                    hintText: "Enter Email",
                                    hintStyle: TextStyle(fontSize: h * 0.021),
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.only(
                                          left: h * 0.03, right: h * 0.005),
                                      child: Icon(
                                        Icons.email_outlined,
                                        color: Colors.pink,
                                        size: h * 0.021,
                                      ),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    labelText: "Email",
                                    labelStyle: TextStyle(fontSize: h * 0.021),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(h * 0.03))),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Email cannot be empty";
                                  }
                                  return null;
                                }),
                          ),
                          SizedBox(
                            height: h * 0.02,
                          ),
                          SizedBox(
                            width: 0.8 * w,
                            child: TextFormField(
                                controller: passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                    hintText: "Enter Password",
                                    hintStyle: TextStyle(fontSize: h * 0.021),
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.only(
                                          left: h * 0.03, right: h * 0.005),
                                      child: Icon(
                                        Icons.password_outlined,
                                        color: Colors.pinkAccent,
                                        size: h * 0.021,
                                      ),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    labelText: "Password",
                                    labelStyle: TextStyle(fontSize: h * 0.021),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(h * 0.03))),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "password cannot be empty";
                                  } else if (value.length < 6) {
                                    return "password must contain 6 letters";
                                  }
                                  return null;
                                }),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: h * 0.02,
                    ),
                    InkWell(
                      onTap: () async {
                        if (_formkey.currentState!.validate()) {
                          setState(() {
                            changeButton = true;
                          });

                          //await Future.delayed(const Duration(seconds: 1));
                          AuthController.instance.login(
                              emailController.text.trim(),
                              passwordController.text.trim());
                          /*setState(() {
                            changeButton = false;
                          });*/
                        }
                      },
                      child: AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        width: changeButton ? 60 : w * 0.8,
                        height: 60,
                        alignment: Alignment.center,
                        // ignore: sort_child_properties_last
                        child: changeButton
                            ? const Icon(
                                Icons.done,
                                color: Colors.white,
                              )
                            : Text(
                                "login",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: h * 0.025,
                                ),
                              ),
                        decoration: BoxDecoration(
                            color:
                                changeButton ? Colors.green : Colors.pinkAccent,
                            borderRadius: BorderRadius.circular(
                                changeButton ? 50 : h * 0.03)),
                      ),
                    ),
                    SizedBox(
                      height: h * 0.01,
                    ),
                    RichText(
                        text: TextSpan(
                            text: "Don't have an account?",
                            style: TextStyle(
                              fontSize: h * 0.02,
                              color: Colors.black,
                            ),
                            children: [
                          TextSpan(
                              text: " Create",
                              style: TextStyle(
                                fontSize: h * 0.02,
                                color: Colors.deepPurple.shade900,
                                fontWeight: FontWeight.bold,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap =
                                    () => Get.to(() => const SigninPage()))
                        ])),
                    // SizedBox(
                    // height: 20,
                    //),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
