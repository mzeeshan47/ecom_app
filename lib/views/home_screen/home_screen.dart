import 'package:ecom_app/consts/colors.dart';
import 'package:ecom_app/consts/images.dart';
import 'package:ecom_app/consts/strings.dart';
import 'package:ecom_app/views/home_screen/featured_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:ecom_app/consts/lists.dart';
import 'package:ecom_app/widgets/common/home_button.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white70,
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(children: [
            Container(
                alignment: Alignment.center,
                height: 60,
                color: lightGrey,
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: searchanything,
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                )),
            SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    AspectRatio(
                      aspectRatio: 21 / 9,
                      child: Swiper(
                          containerHeight: 150,
                          autoplay: true,
                          itemCount: slidersList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                                clipBehavior: Clip.antiAlias,
                                margin: EdgeInsets.symmetric(horizontal: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Image.asset(
                                  slidersList[index],
                                  fit: BoxFit.fill,
                                ));
                          }),
                    ),
                    SizedBox(height: 10),
                    //Buttons

                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                            2,
                            (index) => Container(
                                  height: screenHeight * 0.15,
                                  width: screenWidth / 2.5,
                                  child: homeButtons(
                                      screenWidth / 2.25,
                                      screenHeight * 0.15,
                                      index == 0 ? Todays_deal : Flashdeal,
                                      index == 0 ? todayDeal : flashdeal,
                                      () {}),
                                ))),
                    SizedBox(height: 10),

                    //2nd Slider

                    AspectRatio(
                      aspectRatio: 21 / 9,
                      child: Swiper(
                          containerHeight: 150,
                          autoplay: true,
                          itemCount: slidersList2.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                                clipBehavior: Clip.antiAlias,
                                margin: EdgeInsets.symmetric(horizontal: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Image.asset(
                                  slidersList2[index],
                                  fit: BoxFit.fill,
                                ));
                          }),
                    ),
                    SizedBox(height: 10),
                    //Buttons

                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                            3,
                            (index) => Container(
                                  height: screenHeight * 0.15,
                                  width: screenWidth / 3.5,
                                  child: homeButtons(
                                      screenWidth / 2.25,
                                      screenHeight * 0.15,
                                      index == 0
                                          ? Top_Categories
                                          : index == 1
                                              ? Brand
                                              : Top_Seller,
                                      index == 0
                                          ? topCategories
                                          : index == 1
                                              ? brand
                                              : topSellers,
                                      () {}),
                                ))),
                    SizedBox(height: 10),
                    // featured categories
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(featuredCategories,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Colors.white))),
                    SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                            3,
                            (index) => Column(
                                  children: [
                                    FeaturedButton(
                                        icon: featuredImages1[index],
                                        title: featuredTitles1[index]),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    FeaturedButton(
                                        icon: featuredImages2[index],
                                        title: featuredTitles2[index]),
                                  ],
                                )).toList(),
                      ),
                    ),

                    //featured product
                    SizedBox(height: 10),

                    Container(
                      padding: EdgeInsets.all(12),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: AppColor.color1,
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(featuredProducts,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.white)),
                          SizedBox(height: 10),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(
                                  6,
                                  (index) => Container(
                                        margin:
                                            EdgeInsets.symmetric(horizontal: 4),
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          color: Colors.white,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                child: Image.asset(
                                                  featuredProductsImages[index],
                                                  width: 135,
                                                  fit: BoxFit.cover,
                                                )),
                                            SizedBox(height: 10),
                                            Text(featuredProductsdetails[index],
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            SizedBox(height: 10),
                                            Text(
                                              featuredProductsrates[index],
                                              style: TextStyle(
                                                  color: Colors.deepOrange,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                          ],
                                        ),
                                      )),
                            ),
                          )
                        ],
                      ),
                    ),

                    //3rd swiper
                    SizedBox(height: 10),
                    AspectRatio(
                      aspectRatio: 21 / 9,
                      child: Swiper(
                          containerHeight: 150,
                          autoplay: true,
                          itemCount: slidersList3.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                                clipBehavior: Clip.antiAlias,
                                margin: EdgeInsets.symmetric(horizontal: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Image.asset(
                                  slidersList3[index],
                                  fit: BoxFit.fill,
                                ));
                          }),
                    ),
                    //all products selection
                    SizedBox(height: 10),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(allProducts,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Colors.white))),
                    SizedBox(height: 10),
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 6,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        mainAxisExtent: 250,
                      ),
                      itemBuilder: (context, index) {
                        return Container(
                            margin: EdgeInsets.symmetric(horizontal: 2),
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4)),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    allProductsImages[index],
                                    height: screenHeight * 0.160,
                                    width: screenWidth * 0.250,
                                    fit: BoxFit.cover,
                                  ),
                                  const Spacer(),
                                  Text(allProductsdetails[index],
                                      softWrap: true,
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(height: 10),
                                  Text(
                                    allProductsrates[index],
                                    softWrap: true,
                                    style: TextStyle(
                                        color: Colors.deepOrange,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ]));
                      },
                    )
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
