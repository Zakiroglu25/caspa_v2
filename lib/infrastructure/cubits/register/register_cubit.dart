// import 'package:bloc/bloc.dart';
// import 'package:caspa_v2/infrastructure/data_source/auth_provider.dart';
// import 'package:caspa_v2/infrastructure/models/requset/register_request_model.dart';
// import 'package:caspa_v2/infrastructure/models/response/register_response_model.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/cupertino.dart';
// import '';
// part 'register_state.dart';
//
// class RegisterCubit extends Cubit<RegisterState> {
//   RegisterCubit() : super(RegisterInitial());
//
//   void register(RegisterRequestModel body) async {
//
//
//
//
//
//     emit(RegisterLoading());
//     try {
//       RegisterResponseModel response = await AuthProvider.registration(name: name, surname: surname, address: address, email: email, password: password, password_confirmation: password_confirmation, phone: phone, accept: accept, company_name: company_name, tax_number: tax_number);
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
