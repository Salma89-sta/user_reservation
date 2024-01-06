import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rservation_user/colors/app_colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ReservedCardToUser extends StatelessWidget {
  final dynamic reservedProductImage;
  final String reservedProductName;
  final String fromDate;
  final String toDate;
  final String status;


  const ReservedCardToUser({Key? key,required this.reservedProductImage, required this.reservedProductName, required this.fromDate, required this.toDate, required this.status}) : super(key: key);

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
                      child: Image.network(reservedProductImage, width: 98.w,)),
              SizedBox(height: 5,),

              Text("${reservedProductName}", style: TextStyle(color: Colors.indigo, fontFamily: 'Cairo', fontWeight: FontWeight.bold, fontSize: 20.sp),),
              SizedBox(height: 5,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("${toDate}", style: TextStyle(color: AppColors.lightGrey, fontFamily: 'Cairo',fontSize: 20.sp),),
                  Text(" : الي ", style: TextStyle(color: Colors.indigo, fontFamily: 'Cairo',fontSize: 20.sp),),
                  SizedBox(width: 20,),
                  Text("${fromDate}", style: TextStyle(color: AppColors.lightGrey, fontFamily: 'Cairo',fontSize: 20.sp),),
                  Text(" : من ", style: TextStyle(color: Colors.indigo, fontFamily: 'Cairo',fontSize: 20.sp),),
                ],
              ),
              SizedBox(height: 10,),

              InkWell(
                onTap: (){
      showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog( // <-- SEE HERE
            content: SingleChildScrollView(
              child: ListBody(
                children:  <Widget>[
                  Center(child: Text("${status}")),
                ],
              ),
            ),
            actions: <Widget>[
              Center(
                child: TextButton(
                  child: const Text('رجوع'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),

            ],
          );
        },
      );

                },
                child: Text("تأكيد الحاله ", style: TextStyle(color: Colors.black, fontFamily: 'Cairo',fontSize: 20.sp,decoration: TextDecoration.underline,
                ), ),
              ),
            ],
          ),

        ),
      ),
    );
  }
}
