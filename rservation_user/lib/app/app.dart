import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rservation_user/features/categories/business_layer/categories_cubit.dart';
import 'package:rservation_user/features/login/view/login.dart';
import '../features/home/view/home_screen.dart';
import '../features/list_of_category/view/list_of_category_screen.dart';
import '../features/list_of_category/view/table_calender.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return BlocProvider(
          create: (context) => CategoryCubit()..getCategories(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(

              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: LogIn(),
          ),
        );
      },
    );
  }

}
