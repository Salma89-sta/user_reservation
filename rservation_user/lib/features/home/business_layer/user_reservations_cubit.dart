import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rservation_user/core/network/api_url.dart';
import 'package:rservation_user/core/network/my_http.dart';

part 'user_reservations_state.dart';

class UserReservationsCubit extends Cubit<UserReservationsState> {
  UserReservationsCubit() : super(UserReservationsInitial());

  static UserReservationsCubit get(context) => BlocProvider.of(context);

  Future<void> getUserReservations( String id) async{
    emit(UserReservationsLoading());

  try{
    var response = await MyDio.post(endPoint: API.getCategories, data: {"id": id});

    if (response?.statusCode==200){

      

    }else{
      emit(UserReservationsFailed());
    }
  }catch(e){
    emit(UserReservationsFailed());
    }

  }

}
