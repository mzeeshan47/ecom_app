import 'package:ecom_app/consts/strings.dart';
import 'package:ecom_app/widgets/common/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:ecom_app/consts/lists.dart';
import 'package:flutter/widgets.dart';

class CategoryScreen extends StatefulWidget {

  const CategoryScreen({Key? key}) : super(key: key);
@override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {


  @override
  Widget build(BuildContext context) {
    return bgWidget(
     Scaffold(
        appBar: AppBar(
          title: Text(categories, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30)),
        ),
        body: Container(
          padding: EdgeInsets.all(15),
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: 9,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, mainAxisSpacing: 8, crossAxisSpacing: 8, mainAxisExtent: 200),
            itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: Colors.white),
              clipBehavior: Clip.antiAlias,
              child: Column(children: [
                SizedBox(height:10),
                ClipRRect( borderRadius: BorderRadius.circular(4),
                  child: Image.asset(categoryImages[index],
                  height: 120,
                  width: 120,
                  fit: BoxFit.cover,),
                ),
            SizedBox(height: 20,),
            Title(color: Colors.grey, child: Text(categoryList[index], textAlign: TextAlign.center,)),
            ],
            ),           );
          },)
        )
      )
    );
  }
}