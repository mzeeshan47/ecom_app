import 'package:ecom_app/consts/colors.dart';
import 'package:ecom_app/consts/lists.dart';
import 'package:ecom_app/consts/strings.dart';
import 'package:ecom_app/widgets/common/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:ecom_app/views/profile_screen/components/details_card.dart';
import 'package:ecom_app/views/auth_screen/login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(Scaffold(
        body: SafeArea(
            child: Container(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: Align(
                alignment: Alignment.topRight,
                child: const Icon(
                  Icons.edit,
                  color: AppColor.color1,
                )),
          ),

          //user details section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: AppColor.color1,
                  child: Stack(children: [
                    Align(
                      alignment: Alignment.bottomRight,
                      child: CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.white70,
                        child: Icon(
                          Icons.add_a_photo,
                          size: 15,
                        ),
                      ),
                    ),
                  ]),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dummy User",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrange),
                      ),
                      Text(
                        "customer@example.com",
                        style: TextStyle(color: Colors.deepOrange),
                      ),
                    ],
                  ),
                ),
                OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.grey),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                    },
                    child: Text(
                      logOut,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange),
                    ))
              ],
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              detailsCard(count: "00", title: "In your Cart"),
              detailsCard(count: "00", title: "In your Wishlist"),
              detailsCard(count: "00", title: "Your Orders"),
            ],
          ),
          SizedBox(height: 30),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6), color: Colors.white),
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.asset(
                      profileButtonIcons[index],
                      width: 30,
                    ),
                    title: Text(
                      profileButtonList[index],
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(color: lightGrey);
                },
                itemCount: profileButtonIcons.length),
          )
        ],
      ),
    ))));
  }
}
