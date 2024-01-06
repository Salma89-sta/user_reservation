import 'package:flutter/material.dart';
import 'package:rservation_user/bloc_provider.dart';
import 'package:rservation_user/core/network/my_http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:bloc/bloc.dart';
import 'app/app.dart';

late SharedPreferences sharedPreferences;
late bool internetChecker;


Future<void> main() async {
  // Bloc.observer = MyBlocObserver();

  MyDio.init();
  SharedPreferences sharedPreferences;

  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting();
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();

  runApp(
      Directionality(
          textDirection: TextDirection.rtl,
          child: MyApp())
  );
}
init() async {
  sharedPreferences = await SharedPreferences.getInstance();
}
