import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../colors/app_colors.dart';

class ListOfCategory extends StatelessWidget {

  final dynamic listOfCategoryImage;
  final String listOfCategoryName;
  final String priceIn;
  final Widget calenderWidget;
  final String listOfCategoryDescription;
  final double listOfCategoryPricePerDay;
  final VoidCallback forMoreDetails;

  final String listOfCategoryStatus;


  const ListOfCategory({Key? key,required this.calenderWidget,required this.listOfCategoryImage, required this.listOfCategoryName, required this.listOfCategoryDescription, required this.listOfCategoryPricePerDay, required this.listOfCategoryStatus, required this.forMoreDetails, required this.priceIn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: const EdgeInsets.only(top:20.0),
    child: Center(
    child: Container(
    width: 85.w,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    border:Border.all(
    color: Colors.deepOrange,
    width:2,

    ),
    ),

    child: Column(
    children: [
    ClipRRect(
    borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
    child: Image.network(listOfCategoryImage, width: 98.w,height: 30.h, fit: BoxFit.fill,)),
      SizedBox(height: 5,),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: 10,),
          calenderWidget,
          SizedBox(width: 10,),
          Text("${listOfCategoryName}", style: TextStyle(color: Colors.indigo, fontFamily: 'Cairo', fontWeight: FontWeight.bold, fontSize: 18.sp),),
        ],
      ),
      SizedBox(height: 5,),
      Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end ,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(width: 10,),
            Text("${listOfCategoryDescription}", style: TextStyle(color: Colors.indigo, fontFamily: 'Cairo',fontSize: 18.sp),),
            Text(" : الوصف", style: TextStyle(color: Colors.indigo, fontFamily: 'Cairo', fontWeight: FontWeight.bold, fontSize: 18.sp),),
          ],
        ),
      ),

      SizedBox(height: 5,),
      Row(
        mainAxisAlignment: MainAxisAlignment.end ,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(width: 10,),
          Text("${listOfCategoryPricePerDay}", style: TextStyle(color: Colors.indigo, fontFamily: 'Cairo',  fontSize: 18.sp),),
          Text(" : ${priceIn} ",style: TextStyle(color: Colors.indigo, fontFamily: 'Cairo', fontWeight: FontWeight.bold, fontSize: 18.sp),),
          Text(" السعر ", style: TextStyle(color: Colors.indigo, fontFamily: 'Cairo', fontWeight: FontWeight.bold, fontSize: 18.sp),),
          SizedBox(width: 10.w,),
          Text("${listOfCategoryStatus}",style: TextStyle(color: Colors.indigo, fontFamily: 'Cairo',  fontSize: 18.sp),),
          Text(" : الحاله  ", style: TextStyle(color: Colors.indigo, fontFamily: 'Cairo', fontWeight: FontWeight.bold, fontSize: 18.sp),),


        ],
      ),
      SizedBox(height:10),

      Row(
        mainAxisAlignment: MainAxisAlignment.center ,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: forMoreDetails,
            child: Text("لمزيد من التفاصيل", style: TextStyle(color: Colors.black,decoration: TextDecoration.underline, fontFamily: 'Cairo',
            ),),
          ),
        ],
      ),

    ],
      ),

      ),
      ),
      );
  }
}
