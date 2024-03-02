import 'package:ecom_app/consts/colors.dart';
import 'package:ecom_app/consts/strings.dart';
import 'package:ecom_app/views/auth_screen/signup_screen.dart';
import 'package:ecom_app/views/auth_screen/validator.dart';
import 'package:ecom_app/views/home_screen/home.dart';
import 'package:ecom_app/widgets/common/app_logo_widget.dart';
import 'package:ecom_app/widgets/common/bg_widget.dart';
import 'package:ecom_app/widgets/common/my_button.dart';
import 'package:flutter/material.dart';
import 'package:ecom_app/widgets/common/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isSubmit = false;

  Future<void> _submit() async {
    setState(() {
      isSubmit = true; // Set to true to show loading indicator
    });

    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      setState(() {
        isSubmit = false; // Reset to false if validation fails
      });
      return;
    }
    _formKey.currentState!.save();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Home()));
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return bgWidget(Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
          child: SingleChildScrollView(
            child: Column(
                    children: [
            SizedBox(height: screenHeight * 0.1),
            applogoWidget(),
            const SizedBox(height: 10),
            const Text('Log in to $appname',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: AppColor.color1)),
            const SizedBox(height: 15),
            Column(children: [
              Container(
                  width: 300,
                  padding: const EdgeInsets.all(16),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      shape: BoxShape.rectangle),
                  child: Form(
                    key: _formKey,
                    child: Column(children: [
                      CustomTextField(
                        hint: emailHint,
                        title: email,
                        validator: FieldValidator.validateEmail,
                        controller: emailController,
                      ),
                      CustomTextField(
                        hint: passwordHint,
                        title: password,
                        validator: FieldValidator.validatePassword,
                        controller: passwordController,
                      ),
                      Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              forgetPass,
                              style: TextStyle(color: Colors.blue),
                            ),
                          )),
                      SizedBox(
                        height: 5,
                      ),
                      MyButton(
                        color: Colors.red,
                        onPress: _submit,
                        textColor: Colors.white,
                        title: login,
                      ),
                      SizedBox(height: 5),
                      Text(createNewAccount,
                          style: TextStyle(color: Colors.grey)),
                      SizedBox(height: 5),
                      MyButton(
                        color: Color.fromARGB(237, 233, 220, 30),
                        title: signup,
                        textColor: Colors.orange,
                        onPress: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignupScreen(),
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 10),
                      Text(loginWith, style: TextStyle(color: Colors.grey)),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CircleAvatar(
                                  radius: 25,
                                  child: Image.asset(
                                      'assets/icons/facebook_logo.png',
                                      width: 30),
                                  backgroundColor: lightGrey,
                                ),
                                SizedBox(width: 15),
                                CircleAvatar(
                                  radius: 25,
                                  child: Image.asset(
                                      'assets/icons/google_logo.png',
                                      width: 30),
                                  backgroundColor: lightGrey,
                                ),
                                SizedBox(width: 15),
                                CircleAvatar(
                                  radius: 25,
                                  child: Image.asset(
                                      'assets/icons/twitter_logo.png',
                                      width: 30),
                                  backgroundColor: lightGrey,
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ]),
                  ))
            ])
                    ],
                  ),
          )),
    ));
  }
}
