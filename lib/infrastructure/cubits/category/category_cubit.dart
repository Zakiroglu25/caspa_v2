import 'dart:io';
import 'package:caspa_v2/infrastructure/cubits/category/category_state.dart';
import 'package:caspa_v2/infrastructure/data_source/category_provider.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/delegate/request_control.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  void fetch([bool loading = true]) async {
    if (loading) {
      emit(CategoryInProgress());
    }
    try {
      final response = await CategoryProvider.getCategory();
      if (isSuccess(response.statusCode)) {
        emit(CategorySuccess(response.data));
      }  else{
        emit(CategoryError(error: "Error status code: ${response.statusCode}"));
      }
    } on SocketException catch (_) {
      //network olacaq
      emit(CategoryNetworkError());
    } catch (e) {

      eeee("CategoryCubit -> fetch error: $e");
      emit(CategoryError(error: e.toString()));
    }
  }
}
