// import 'package:bloc/bloc.dart';
// import 'package:caspa_v2/infrastructure/data_source/register_repositoriy.dart';
// import 'package:caspa_v2/infrastructure/models/requset/register_request_model.dart';
// import 'package:caspa_v2/infrastructure/models/response/register_response_model.dart';
// import 'package:dio/dio.dart';
// import 'package:equatable/equatable.dart';
// import 'package:flutter/cupertino.dart';
// import '';
// part 'register_state.dart';
//
// class RegisterCubit extends Cubit<RegisterState> {
//   RegisterCubit() : super(RegisterInitial());
//   RegisterRepository _authRepository = RegisterRepository();
//
//   void register(RegisterRequestModel body) async {
//     emit(RegisterLoading());
//     try {
//       RegisterResponseModel response = await _authRepository.registerCivil(body);
//       if (response.message == null) {
//         emit(RegisterSuccess(response.message!));
//       } else {
//         emit(RegisterFailed(response.message!));
//       }
//     } on DioError catch (e) {
//       print(e.response!.data.toString());
//       emit(RegisterFailed(e.response!.data.toString()));
//     } catch (e, s) {
//       emit(RegisterFailed("Errorlari doshuyecem"));
//     }
//   }
// }
