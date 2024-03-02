import 'package:ecom_app/consts/colors.dart';
import 'package:ecom_app/consts/strings.dart';
import 'package:ecom_app/views/auth_screen/login_screen.dart';
import 'package:ecom_app/views/auth_screen/validator.dart';
import 'package:ecom_app/widgets/common/app_logo_widget.dart';
import 'package:ecom_app/widgets/common/bg_widget.dart';
import 'package:ecom_app/widgets/common/my_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ecom_app/widgets/common/custom_textfield.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool? isCheck = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmpassController = TextEditingController();
  bool isSubmit = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    Future<void> submit() async {
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
          context, MaterialPageRoute(builder: (context) => const LoginScreen()));
    }

    double screenHeight = MediaQuery.of(context).size.height;
    return bgWidget(Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
          child: Column(
        children: [
          SizedBox(height: screenHeight * 0.1),
          applogoWidget(),
          const SizedBox(height: 10),
          const Text('Join in to $appname',
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
                  child: Column(
                    children: [
                      CustomTextField(
                          hint: nameHint,
                          title: name,
                          controller: nameController,
                          validator: FieldValidator.validateFullname),
                      CustomTextField(
                        hint: emailHint,
                        title: email,
                        controller: emailController,
                        validator: FieldValidator.validateEmail,
                      ),
                      CustomTextField(
                        hint: passwordHint,
                        title: password,
                        controller: passController,
                        validator: FieldValidator.validatePassword,
                      ),
                      CustomTextField(
                          hint: passwordHint,
                          title: confirmPass,
                          controller: confirmpassController,
                          validator: (value) {
                            FieldValidator.validateConfirmPassword(
                                value, passController.text);
                          }),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Checkbox(
                              checkColor: Colors.red,
                              value: isCheck,
                              onChanged: (newValue) {
                                setState(() {
                                  isCheck = newValue;
                                });
                              }),
                          SizedBox(width: 2),
                          Expanded(
                            child: RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                  text: "I agree to the ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: const Color.fromARGB(
                                          195, 158, 158, 158),
                                      fontSize: 10)),
                              TextSpan(
                                  text: termAndCond,
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: Colors.red,
                                      fontSize: 12)),
                              TextSpan(
                                  text: " & ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: const Color.fromARGB(
                                          195, 158, 158, 158),
                                      fontSize: 10)),
                              TextSpan(
                                  text: privacyPolicy,
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: Colors.red,
                                      fontSize: 12)),
                            ])),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      MyButton(
                        color: isCheck == true ? Colors.red : lightGrey,
                        title: signup,
                        textColor: Colors.white,
                        onPress: submit,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: alreadyHaveAccount,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(195, 158, 158, 158),
                                  fontSize: 10)),
                          TextSpan(
                              text: login,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                  fontSize: 12),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const LoginScreen(),
                                      ));
                                }),
                        ]),
                      ),
                    ],
                  ),
                ))
          ])
        ],
      )),
    ));
  }
}
