import 'package:ecom_app/consts/colors.dart';
import 'package:ecom_app/consts/images.dart';
import 'package:ecom_app/consts/strings.dart';
import 'package:ecom_app/views/home_screen/home_screen.dart';
import 'package:ecom_app/widgets/common/bg_widget.dart';
import 'package:ecom_app/widgets/common/my_button.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
 const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                child: Text(yourorders,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 30))),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                emptycart,
                height: 130,
                width: 100,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 10),
              Text(
                continueshopping,
                style: TextStyle(
                    color: AppColor.color1,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              MyButton(
                  color: Colors.deepOrange,
                  onPress: () {
                    
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                  },
                  textColor: Colors.white,
                  title: gotohome),
            ],
          ),
        ),
      ),
    );
  }
}
