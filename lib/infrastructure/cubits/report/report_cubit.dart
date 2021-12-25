import 'dart:async';
import 'dart:io';
import 'package:caspa_v2/infrastructure/models/remote/response/categories_response.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'report_state.dart';

class ReportCubit extends Cubit<ReportState> {
  ReportCubit() : super(ReportInitial());

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

  //--------------------values:-----------------

  //selected  category
  final BehaviorSubject<Category?> selectedCategory =
      BehaviorSubject<Category>();

  Stream<Category?> get selectedCategoryStream => selectedCategory.stream;

  updateSelectedCategory(Category value) {
    if (value == null) {
      selectedCategory.value = null;
      //taxNumber.sink.addError(MyText.field_is_not_correct);
    } else {
      if (selectedCategory.valueOrNull?.id != value.id) {
        //   selectedSubCategory.sink.add(null);
        updateSelectedSubCategory(SubCategory(
            id: 999999,
            name: '',
            createdAt: '',
            parentId: 999999,
            updatedAt: '',
            goodsId: 999999));
      }
      selectedCategory.sink.add(value);
    }

    //isUserInfoValid(registerType: _registerType);
  }

  bool get isCategoryIncorrect =>
      (!selectedCategory.hasValue || selectedCategory.value == null );

  //selected sub category
  final BehaviorSubject<SubCategory?> selectedSubCategory =
      BehaviorSubject<SubCategory>();

  Stream<SubCategory?> get selectedSubCategoryStream =>
      selectedSubCategory.stream;

  updateSelectedSubCategory(SubCategory? value) {
    bbbb(value.toString());
    if (value == null) {
      selectedSubCategory.value = null;
      //taxNumber.sink.addError(MyText.field_is_not_correct);
    } else {
      selectedSubCategory.sink.add(value);
    }
    //isUserInfoValid(registerType: _registerType);
  }

  bool get isSubCategoryIncorrect =>
      (!selectedSubCategory.hasValue || selectedSubCategory.value == null );

  //seller
  final BehaviorSubject<String> seller = BehaviorSubject<String>();

  Stream<String> get sellerStream => seller.stream;

  updateSeller(String value) {
    if (value == null || value.isEmpty) {
      seller.value = '';
      seller.sink.addError(MyText.field_is_not_correct);
    } else {
      seller.sink.add(value);
    }
    // isUserInfoValid(registerType: _registerType);
  }

  bool get isSellerIncorrect =>
      (!seller.hasValue || seller.value == null || seller.value.isEmpty);

  //trackingID
  final BehaviorSubject<String> trackingID = BehaviorSubject<String>();

  Stream<String> get trackingIDStream => trackingID.stream;

  updateTrackingID(String value) {
    if (value == null || value.isEmpty) {
      trackingID.value = '';
      trackingID.sink.addError(MyText.field_is_not_correct);
    } else {
      trackingID.sink.add(value);
    }
    // isUserInfoValid(registerType: _registerType);
  }

  bool get isTrackingIDIncorrect => (!trackingID.hasValue ||
      trackingID.value == null ||
      trackingID.value.isEmpty);

//productCount
  final BehaviorSubject<String> productCount = BehaviorSubject<String>();

  Stream<String> get productCountStream => productCount.stream;

  updateProductCount(String value) {
    if (value == null || value.isEmpty) {
      productCount.value = '';
      productCount.sink.addError(MyText.field_is_not_correct);
    } else {
      productCount.sink.add(value);
    }
    // isUserInfoValid(registerType: _registerType);
  }

  bool get isProductCountIncorrect => (!productCount.hasValue ||
      productCount.value == null ||
      productCount.value.isEmpty);

//note
  final BehaviorSubject<String> note = BehaviorSubject<String>();

  Stream<String> get noteStream => note.stream;

  updateNote(String value) {
    if (value == null || value.isEmpty) {
      note.value = '';
      note.sink.addError(MyText.field_is_not_correct);
    } else {
      note.sink.add(value);
    }
    // isUserInfoValid(registerType: _registerType);
  }

  bool get isNoteIncorrect =>
      (!note.hasValue || note.value == null || note.value.isEmpty);


  ////validation
  bool isUserInfoValid() {
    if (
    !isNoteIncorrect &&
    !isSellerIncorrect &&
    !isProductCountIncorrect &&
    !isTrackingIDIncorrect &&
    !isSubCategoryIncorrect &&
    !isCategoryIncorrect

    ) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<void> close() {
    selectedCategory.close();
    selectedSubCategory.close();
    note.close();
    productCount.close();
    trackingID.close();
    seller.close();
    return super.close();
  }
}
