import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rservation_user/features/home/view/reserved-card.dart';
import '../../drawer/drawe_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      drawer: DrawerWidget(),

      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Center(child: Text("حجوزاتي", style: TextStyle(color: Colors.white, fontFamily: 'Cairo', fontWeight: FontWeight.bold),)),
      ),
      body: SafeArea(
        child:SingleChildScrollView(
          child: Column(
            children: [
              ReservedCardToUser(reservedProductImage: "https://www.lux-review.com/wp-content/uploads/2019/09/turkish-hotel.jpg", reservedProductName: "غرفه 3", fromDate: "20-5", toDate: "30-5", status: 'تمت الموافقه',),

            ],
          ),
        ) ,
      ),
    );

  }
}
