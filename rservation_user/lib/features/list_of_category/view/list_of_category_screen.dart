import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rservation_user/features/drawer/drawe_widget.dart';
import 'package:rservation_user/features/list_of_category/view/table_calender.dart';
import '../../list_of_category_details/view/List_of_category_details_screen.dart';
import 'card_of_category_list.dart';

class ListOfCategoryScreen extends StatefulWidget {
  const ListOfCategoryScreen({Key? key}) : super(key: key);

  @override
  State<ListOfCategoryScreen> createState() => _ListOfCategoryScreenState();
}

class _ListOfCategoryScreenState extends State<ListOfCategoryScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Center(child: Text("المنشآت", style: TextStyle(color: Colors.white, fontFamily: 'Cairo', fontWeight: FontWeight.bold),)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 5,),
            // SearchDate( ),
            ListOfCategory(listOfCategoryImage: "https://static.independent.co.uk/2023/03/24/09/Best%20New%20York%20boutique%20hotels.jpg", listOfCategoryName: 'شقه 4', listOfCategoryDescription: 'لديها 3 غرف و حمام كبير ', listOfCategoryPricePerDay: 100,
             listOfCategoryStatus: 'في الصيانه', forMoreDetails: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> ListOfCategoryDetailsScreen(name: 'غرفه', description: 'تحتوي علي 3 غرف و حمامين ', address: 'علي مبارك', price: '20', priceIn: 'day',) ));

              }, priceIn: 'day', calenderWidget: CalendarDialog(), ),

            // BookCalendar(),
          ],
        ),
      ),
    );
  }
}
