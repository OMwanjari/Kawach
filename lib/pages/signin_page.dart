// ignore: depend_on_referenced_packages
import 'package:flutter/gestures.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health/auth_controller.dart';
import 'package:lottie/lottie.dart';
import 'login_page.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  bool changeButton = false;

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    var textsize = h * 0.021;
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var gud1Controller = TextEditingController();
    var gud2Controller = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(children: [
              Lottie.asset(
                "assets/animations/signin.json",
                height: h * 0.2,
                fit: BoxFit.cover,
              ),
              const Align(
                alignment: Alignment.bottomCenter,
              ),
              Container(
                height: h * 1.5,
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
                child: Column(children: [
                  SizedBox(
                    height: h * 0.03,
                  ),
                  Text(
                    "H e l l o ",
                    style: TextStyle(
                      fontSize: h * 0.035,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: h * 0.02),
                    child: Column(
                      children: [
                        SizedBox(
                          width: 0.8 * w,
                          child: TextFormField(
                            controller: nameController,
                            decoration: InputDecoration(
                                hintText: "Enter Username",
                                hintStyle: TextStyle(fontSize: textsize),
                                prefixIcon: Icon(
                                  Icons.account_circle_outlined,
                                  color: Colors.pink,
                                  size: textsize,
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                hoverColor:
                                    const Color.fromARGB(255, 215, 245, 255),
                                labelText: "Username",
                                labelStyle: TextStyle(fontSize: textsize),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(h * 0.03))),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Username cannot be empty";
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: h * 0.02,
                        ),
                        SizedBox(
                          width: 0.8 * w,
                          child: TextFormField(
                            controller: phoneController,
                            decoration: InputDecoration(
                                hintText: "Enter Phone no",
                                hintStyle: TextStyle(fontSize: textsize),
                                prefixIcon: Icon(
                                  Icons.call_outlined,
                                  color: Colors.pink,
                                  size: textsize,
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                hoverColor:
                                    const Color.fromARGB(255, 215, 245, 255),
                                labelText: "Phone no",
                                labelStyle: TextStyle(fontSize: textsize),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(h * 0.03))),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Phone cannot be empty";
                              }
                              return null;
                            },
                          ),
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
                                  hintStyle: TextStyle(fontSize: textsize),
                                  prefixIcon: Icon(
                                    Icons.password,
                                    color: Colors.pink,
                                    size: textsize,
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  hoverColor:
                                      const Color.fromARGB(255, 215, 245, 255),
                                  labelText: "Password",
                                  labelStyle: TextStyle(fontSize: textsize),
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
                        SizedBox(
                          height: h * 0.02,
                        ),
                        SizedBox(
                          width: 0.8 * w,
                          child: TextFormField(
                              controller: emailController,
                              decoration: InputDecoration(
                                  hintText: "Enter Email",
                                  hintStyle: TextStyle(fontSize: textsize),
                                  prefixIcon: Icon(
                                    Icons.email_outlined,
                                    color: Colors.pink,
                                    size: textsize,
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  hoverColor:
                                      const Color.fromARGB(255, 215, 245, 255),
                                  labelText: "Email",
                                  labelStyle: TextStyle(
                                    fontSize: textsize,
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(h * 0.03))),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Email cannot be empty";
                                }
                                return null;
                              }),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  SizedBox(
                    width: 0.8 * w,
                    child: TextFormField(
                      controller: gud1Controller,
                      decoration: InputDecoration(
                          hintText: "Enter 1st Guardian Phone no",
                          hintStyle: TextStyle(fontSize: textsize),
                          prefixIcon: Icon(
                            Icons.call_outlined,
                            color: Colors.pink,
                            size: textsize,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hoverColor: const Color.fromARGB(255, 215, 245, 255),
                          labelText: "1st Guardian no.",
                          labelStyle: TextStyle(fontSize: textsize),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(h * 0.03))),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  SizedBox(
                    width: 0.8 * w,
                    child: TextFormField(
                      controller: gud2Controller,
                      decoration: InputDecoration(
                          hintText: "Enter 2nd Guardian no",
                          hintStyle: TextStyle(fontSize: textsize),
                          prefixIcon: Icon(
                            Icons.call_outlined,
                            color: Colors.pink,
                            size: textsize,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hoverColor: const Color.fromARGB(255, 215, 245, 255),
                          labelText: "2nd Guardian no.",
                          labelStyle: TextStyle(fontSize: textsize),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(h * 0.03))),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.03,
                  ),
                  InkWell(
                    onTap: () async {
                      if (_formkey.currentState!.validate()) {
                        setState(() {
                          changeButton = true;
                        });
                        AuthController.instance.register(
                            emailController.text.trim(),
                            passwordController.text.trim(),
                            nameController.text.trim(),
                            phoneController.text.trim(),
                            gud1Controller.text.trim(),
                            gud2Controller.text.trim());
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
                              "Sign up",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: h * 0.022,
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
                        text: "Have an account ?",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: textsize,
                        ),
                        children: [
                          TextSpan(
                              text: " Login",
                              style: TextStyle(
                                color: Colors.deepPurple.shade900,
                                fontWeight: FontWeight.bold,
                                fontSize: textsize,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Get.to(() => const LoginPage()))
                        ]),
                  )
                ]),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
