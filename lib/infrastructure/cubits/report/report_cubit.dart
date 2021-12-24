import 'dart:io';
import 'package:caspa_v2/infrastructure/data_source/report_provider.dart';
import 'package:caspa_v2/infrastructure/data_source/tarif_provider.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/categories_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'report_state.dart';

class ReportCubit extends Cubit<ReportState> {
  ReportCubit() : super(ReportInitial());


  Category? _selectedCategory;
  SubCategory? _selectedSubCategory;


  set selectedCategory(Category? value) {
    _selectedCategory = value;
  }

  set selectedSubCategory(SubCategory? value) {
    _selectedSubCategory = value;
  }


  Category? get selectedCategory => _selectedCategory;

  SubCategory? get selectedSubCategory => _selectedSubCategory;

  void report([bool loading = true]) async {
    if (loading) {
      emit(ReportInProgress());
    }
    try {
      // final result = await ReportProvider.report(  store: store,
      //   qty: qty,
      //   category: category,
      //   tracking: tracking,
      //   price: price,
      //   currency: currency,
      //   invoice: invoice,
      //   note: note,);
      // if (result.tariffList!= null) {
      //   emit(ReportSuccess(
      //   //    result.tariffList!
      //   ));
      // } else {
      //   emit(ReportError());
      // }
    } on SocketException catch (_) {
      //network olacaq
      emit(ReportError());
    } catch (e) {
      emit(ReportError());
    }
  }


}
