import 'dart:async';
import 'package:ecom_app/views/auth_screen/login_screen.dart';
import 'package:ecom_app/widgets/common/app_logo_widget.dart';
import 'package:ecom_app/consts/strings.dart';
import 'package:flutter/material.dart';
import 'package:ecom_app/consts/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const LoginScreen())));
  }

  @override
  Widget build(BuildContext context) {

    // final screenHeight = MediaQuery.of(context).size.height;
    // final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: Center(
          child: Column(children: [
            const SizedBox(height: 250),
            applogoWidget(),
            const SizedBox(height: 20),
            const Text(
              appname,
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColor.color1,
            ),),
            const SizedBox(height: 5),
            const Text(
              appdescription,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: AppColor.color1,
            )),
            const Spacer(),
            const Text(
              appversion,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColor.color1,
            )),
            const SizedBox(height: 30),
          ]),
        ));
  }
}
