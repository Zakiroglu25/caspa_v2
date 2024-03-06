import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:caspa_v2/infrastructure/configs/recorder.dart';
import 'package:caspa_v2/infrastructure/data_source/report_provider.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/categories_response.dart';
import 'package:caspa_v2/infrastructure/services/hive_service.dart';
import 'package:caspa_v2/util/constants/durations.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/delegate/request_control.dart';
import 'package:caspa_v2/util/screen/alert.dart';
import 'package:caspa_v2/util/screen/snack.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rxdart/rxdart.dart';

import '../../../locator.dart';
import '../../../util/delegate/app_operations.dart';
import '../../models/remote/response/branches_model.dart';
import '../../models/remote/response/wares.dart';
import 'report_state.dart';

class ReportCubit extends Cubit<ReportState> {
  ReportCubit() : super(ReportInitial());

  HiveService get _prefs => locator<HiveService>();
  TextEditingController subCategoryFilterController = TextEditingController();
  TextEditingController categoryFilterController = TextEditingController();

  List<Category> permanentCategories = [];
  List<WareHouse> permanentWares = [];
  List<Branch> permanentBranch = [];

  Future<File?> checkAndPickImage(BuildContext context) async {
    try {
      var galleryAccessStatus = await Permission.photos.status;
      await Permission.photos.request();
      if (galleryAccessStatus != PermissionStatus.granted) {
        log("1");
        var status = await Permission.photos.request();
        if (Platform.isAndroid) {
          final androidInfo = await DeviceInfoPlugin().androidInfo;
          if (androidInfo.version.sdkInt <= 32) {
            log("32");
            return updateImage(await AppOperations.pickPhotoFromGallery());

            /// use [Permissions.storage.status]
          }  else {
            log("33");
            return updateImage(await AppOperations.pickPhotoFromGallery());

            /// use [Permissions.photos.status]
          }
        }
        if (status != PermissionStatus.granted) {
          log("2");
          await showGalleryAccessAlert(context);
        } else {
          log("3");
          return updateImage(await AppOperations.pickPhotoFromGallery());
        }
      } else {
        log("4");
        return updateImage(await AppOperations.pickPhotoFromGallery());
      }
    } on PlatformException catch (e) {
      await showGalleryAccessAlert(context);
    } catch (e, s) {
      Recorder.recordCatchError(e, s);
      Snack.display(context: context, message: e.toString());
    }
  }

  Future<void> showGalleryAccessAlert(BuildContext context) async {
    Alert.show(context,
        title: MyText.we_need_access_to_gallery,
        content: MyText.we_will_redirect_to_settings_gallery,
        buttonText: MyText.goOn,
        onTap: () async => await openAppSettings());
  }

  void report(BuildContext context, {bool loading = true, int? id}) async {
    try {
      if (loading) {
        emit(ReportInProgress());
      }

      if (isUserInfoValid(id: id)) {
        final result = await ReportProvider.report(
          token: await _prefs.accessToken,
          seller: seller.valueOrNull,
          id: id,
          qty: productCount.valueOrNull,
          category: selectedSubCategory.valueOrNull!.id,
          tracking: trackingID.valueOrNull,
          price: price.valueOrNull,
          currency: priceType.valueOrNull!.toLowerCase(),
          invoice: image.valueOrNull,
          note: note.valueOrNull,
          ware: selectedWares.valueOrNull?.id,
          branch: selectedBranch.valueOrNull!.id,
        );
        log(result.toString());
        if (isSuccess(result?.statusCode)) {
          emit(ReportSuccess());
          log(result.toString());
        } else {
          emit(ReportError(
              error: MyText.error + " ${result!.statusCode ?? ''}"));
        }
      } else {
        emit(ReportError(error: MyText.all_fields_must_be_filled));
      }
    } on SocketException catch (_) {
      emit(ReportError(error: MyText.network_error));
    } catch (e, s) {
      emit(ReportError());
      Recorder.recordCatchError(e, s);
    }
  }

  void editReport(BuildContext context, [bool loading = true]) async {
    try {
      if (isUserInfoValid()) {
        if (loading) {
          emit(ReportInProgress());
        }
        final result = await ReportProvider.report(
          token: await _prefs.accessToken,
          seller: seller.valueOrNull,
          qty: productCount.valueOrNull,
          category: selectedSubCategory.valueOrNull!.id,
          tracking: trackingID.valueOrNull,
          price: price.valueOrNull,
          currency: priceType.valueOrNull!.toLowerCase(),
          invoice: image.valueOrNull,
          note: note.valueOrNull,
          ware: selectedWares.valueOrNull!.id,
          branch: selectedBranch.valueOrNull!.id,
        );

        if (isSuccess(result?.statusCode)) {
          emit(ReportSuccess());
        } else {
          emit(ReportError(error: MyText.error + " ${result!.statusCode}"));
        }
      } else {
        emit(ReportError(error: MyText.all_fields_must_be_filled));
      }
    } on SocketException catch (_) {
      //network olacaq
      emit(ReportError(error: MyText.network_error));
    } catch (e) {
      emit(ReportError());
    }
  }

  void deleteReport(BuildContext context,
      {bool loading = true, required int id}) async {
    try {
      if (loading) {
        emit(ReportInProgress());
      }
      final result = await ReportProvider.deleteReport(id: id);

      if (isSuccess(result?.statusCode)) {
        Snack.positive(context: context, message: MyText.operationIsSuccess);
        Go.pop(context);
        emit(ReportSuccess());
      } else {
        emit(ReportError(error: MyText.error + " ${result!.statusCode}"));
      }
    } on SocketException catch (_) {
      //network olacaq
      emit(ReportError(error: MyText.network_error));
    } catch (e) {
      emit(ReportError());
    }
  }

  clearSubFilter() async {
    await Future.delayed(AppDurations.ms500);
    subCategories.sink.add(selectedCategory.value?.children ?? []);
    subCategoryFilterController.clear();
  }

  clearFilter() async {
    await Future.delayed(AppDurations.ms500);
    updateCategoriesList(permanentCategories);
    categoryFilterController.clear();
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
      clearFilter();
      filterSubCategoriesList('');
    }

    //isUserInfoValid(registerType: _registerType);
  }

  ///selectedWares
  final BehaviorSubject<WareHouse?> selectedWares =
      BehaviorSubject<WareHouse>();

  Stream<WareHouse?> get selectedWaresStream => selectedWares.stream;

  updateWares(WareHouse? value) {
    if (value == null) {
      selectedWares.value = null;
      //taxNumber.sink.addError(MyText.field_is_not_correct);
    } else {
      if (selectedWares.valueOrNull?.id != value.id) {
        print(selectedWares.valueOrNull?.id);

        selectedWares.sink.add(value);
      }
    }

    //isUserInfoValid(registerType: _registerType);
  }

  ///selectedWares

  ///selectedBranch
  final BehaviorSubject<Branch?> selectedBranch = BehaviorSubject<Branch>();

  Stream<Branch?> get selectedBranchStream => selectedBranch.stream;

  updateBranch(Branch value) {
    if (value == null) {
      selectedBranch.value = null;
      //taxNumber.sink.addError(MyText.field_is_not_correct);
    } else {
      if (selectedBranch.valueOrNull?.id != value.id) {
        print(selectedBranch.valueOrNull?.id);

        selectedBranch.sink.add(value);
      }
    }

    //isUserInfoValid(registerType: _registerType);
  }

  ///selectedBranch

  bool get isCategoryIncorrect =>
      (!selectedCategory.hasValue || selectedCategory.value == null);

  //selected sub category
  final BehaviorSubject<SubCategory?> selectedSubCategory =
      BehaviorSubject<SubCategory>();

  Stream<SubCategory?> get selectedSubCategoryStream =>
      selectedSubCategory.stream;

  updateSelectedSubCategory(SubCategory? value) {
    if (value == null) {
      selectedSubCategory.value = null;
    } else {
      selectedSubCategory.sink.add(value);
    }
    clearSubFilter();
  }

  bool get isSubCategoryIncorrect => (!selectedSubCategory.hasValue ||
      selectedSubCategory.value == null ||
      selectedSubCategory.value?.id == 999999);

  //  category list
  final BehaviorSubject<List<Category>> categories =
      BehaviorSubject<List<Category>>.seeded([]);

  Stream<List<Category>> get categoriesListStream => categories.stream;

  ///wares list
  final BehaviorSubject<List<WareHouse>> wares =
      BehaviorSubject<List<WareHouse>>.seeded([]);

  Stream<List<WareHouse>> get waresListStream => wares.stream;

  ///wares list

  ///branch list
  final BehaviorSubject<List<Branch>> branch =
      BehaviorSubject<List<Branch>>.seeded([]);

  Stream<List<Branch>> get branchListStream => branch.stream;

  ///branch list

  filterCategoriesList(String text) {
    if (text == null) {
      // subCategories.value = null;
      //taxNumber.sink.addError(MyText.field_is_not_correct);
    } else {
      //   subCategoriesList = selectedCategory.children!;
      categories.sink.add(permanentCategories);
      final mainList = <Category>[];
      categories.value.forEach((userDetail) {
        if (userDetail.name!.toLowerCase().contains(text.toLowerCase()) ||
            userDetail.name!.toLowerCase().contains(text.toLowerCase()))
          mainList.add(userDetail);
      });
      categories.sink.add(mainList);
    }
    //isUserInfoValid(registerType: _registerType);
  }

  //update wares list
  updateWaresList(List<WareHouse> value) {
    permanentWares = value;
    wares.sink.add(permanentWares);
  }

  //update branch list
  updateBranchList(List<Branch> value) {
    permanentBranch = value;
    branch.sink.add(permanentBranch);
  }

  updateCategoriesList(List<Category> value) {
    permanentCategories = value;
    categories.sink.add(permanentCategories);
  }

  bool get isSubCategoriesListIncorrect => (!selectedSubCategory.hasValue ||
      selectedSubCategory.value == null ||
      selectedSubCategory.value?.id == 999999);

  // sub category list
  final BehaviorSubject<List<SubCategory>> subCategories =
      BehaviorSubject<List<SubCategory>>.seeded([]);

  Stream<List<SubCategory>> get subCategoriesListStream => subCategories.stream;

  filterSubCategoriesList(String text) {
    bbbb(text.toString());
    if (text == null) {
    } else {
      subCategories.sink.add(selectedCategory.value?.children ?? []);
      final mainList = <SubCategory>[];
      subCategories.value.forEach((userDetail) {
        if (userDetail.name!.toLowerCase().contains(text.toLowerCase()) ||
            userDetail.name!.toLowerCase().contains(text.toLowerCase()))
          mainList.add(userDetail);
      });
      subCategories.sink.add(mainList);
    }
    //isUserInfoValid(registerType: _registerType);
  }

  bool get isCategoriesListIncorrect => (!selectedSubCategory.hasValue ||
      selectedSubCategory.value == null ||
      selectedSubCategory.value?.id == 999999);

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
    if (value.isEmpty) {
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
  final BehaviorSubject<int> productCount = BehaviorSubject<int>();

  Stream<int> get productCountStream => productCount.stream;

  updateProductCount(String value) {
    if (value == null || value.isEmpty) {
      // productCount.value = '';
      productCount.sink.addError(MyText.field_is_not_correct);
    } else {
      productCount.sink.add(int.parse(value));
    }
    // isUserInfoValid(registerType: _registerType);
  }

  bool get isProductCountIncorrect =>
      (!productCount.hasValue || productCount.value == null);

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

  //price
  final BehaviorSubject<double> price = BehaviorSubject<double>();

  Stream<double> get priceStream => price.stream;

  updatePrice(String value) {
    if (value == null || value.isEmpty) {
      price.sink.addError(MyText.field_is_not_correct);
    } else {
      price.sink.add(double.parse(value));
    }
    // isUserInfoValid(registerType: _registerType);
  }

  bool get isPriceIncorrect => (!price.hasValue || price.value == null);

  //priceType
  final BehaviorSubject<String> priceType =
      BehaviorSubject<String>.seeded(MyText.tryy);

  Stream<String> get priceTypeStream => priceType.stream;

  updatepriceType(String value) {
    if (value == null || value.isEmpty) {
      priceType.value = '';
      priceType.sink.addError(MyText.field_is_not_correct);
    } else {
      priceType.sink.add(value);
    }
    // isUserInfoValid(registerType: _registerType);
  }

  bool get isPriceTypeIncorrect => (!priceType.hasValue ||
      priceType.value == null ||
      priceType.value.isEmpty);

  ////validation
  bool isUserInfoValid({int? id}) {
    if (
        //!isNoteIncorrect &&
        !isSellerIncorrect &&
            !isProductCountIncorrect &&
            (!isImageIncorrect
            //|| id != null
            ) &&
            !isPriceIncorrect &&
            !isPriceTypeIncorrect &&
            !isTrackingIDIncorrect &&
            !isSubCategoryIncorrect &&
            !isCategoryIncorrect) {
      return true;
    } else {
      return false;
    }
  }

//photo
  final BehaviorSubject<File?> image = BehaviorSubject<File>();

  Stream<File?> get imageStream => image.stream;

  updateImage(File? value) {
    if (value == null || value.path == null) {
      image.sink.addError(MyText.field_is_not_correct);
    } else {
      image.sink.add(value);
    }
    // isUserInfoValid(registerType: _registerType);
  }

  bool get isImageIncorrect => (!image.hasValue || image.value == null);

  @override
  Future<void> close() {
    selectedCategory.close();
    selectedSubCategory.close();
    note.close();
    productCount.close();
    trackingID.close();
    priceType.close();
    image.close();
    price.close();
    seller.close();
    selectedWares.close();
    selectedBranch.close();
    return super.close();
  }
}
