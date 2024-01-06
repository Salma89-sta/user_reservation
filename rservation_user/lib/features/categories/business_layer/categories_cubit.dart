import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rservation_user/core/network/api_url.dart';

import '../../../core/network/my_http.dart';
import '../data_layer/model/categories_model.dart';

part  'categories_state.dart';


class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  static CategoryCubit get(context) => BlocProvider.of(context);
  static const Duration timeoutDuration = Duration(seconds: 30);


  List<Data> categories = [];

  getCategories() async {
    emit(GetCategoriesLoading());
    try {
      var response = await MyDio.get(endPoint: API.getCategories);
      print("-----------------  getCategories  -----------------");
      print(response!.statusCode);
      if (response!.statusCode == 200) {
        print(response.data);
        var decodedData = json.decode(response.data);
        print(decodedData);
        var jsonResponse =await CategoriesModel.fromJson(decodedData);

        if (jsonResponse.success!) {
          print("categories");
          categories = jsonResponse.data!;
          print(categories);
          if(categories != null){
            print("...................00000........");
            emit(GetCategoriesSuccess());
          }
        } else {
          print(response.data);
          print(response.statusCode);
          emit(GetCategoriesFailure());
        }
      } else {
        print(response.data);
        print(response.statusCode);
        emit(GetCategoriesFailure());
      }
    } catch (e) {
      print(e);
      emit(GetCategoriesFailure());
    }
  }
}