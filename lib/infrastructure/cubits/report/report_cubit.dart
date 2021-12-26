import 'dart:async';
import 'dart:io';
import 'package:caspa_v2/infrastructure/data_source/report_provider.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/categories_response.dart';
import 'package:caspa_v2/infrastructure/services/preferences_service.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/screen/alert.dart';
import 'package:caspa_v2/util/screen/snack.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:rxdart/rxdart.dart';
import '../../../locator.dart';
import 'report_state.dart';
import 'package:geolocator/geolocator.dart';

class ReportCubit extends Cubit<ReportState> {
  ReportCubit() : super(ReportInitial());

  PreferencesService get _prefs => locator<PreferencesService>();



  Future<File?> checkAndPickImage(BuildContext context) async {
    try {
      var galleryAccessStatus = await Permission.photos.status;
      await Permission.photos.request();
      if (galleryAccessStatus != PermissionStatus.granted) {
        var status = await Permission.photos.request();
        if (status != PermissionStatus.granted) {
          await showGalleryAccessAlert(context);
        } else {
          return pickPhotoFromGallery();
        }
      } else {
        return pickPhotoFromGallery();
      }
    } on PlatformException catch (e) {
      eeee("error: " + e.toString());
      await showGalleryAccessAlert(context);
    } catch (e) {
      eeee("error: " + e.toString());
      Snack.display(context: context, message: e.toString());
    }
  }

  Future<void> showGalleryAccessAlert(BuildContext context) async {
    Alert.show(context,
        title: MyText.we_need_access_to_gallery,
        content: MyText.we_will_redirect_to_settings,
        buttonText: MyText.goOn,
        onTap: () async => await openAppSettings());
  }

  void report(BuildContext context, [bool loading = true]) async {
    if (loading) {
      emit(ReportInProgress());
    }
    try {
      if (isUserInfoValid()) {


        final result = await ReportProvider.report(
          token: await _prefs.accessToken,
          seller: seller.valueOrNull,
          qty: productCount.valueOrNull,
          category: selectedSubCategory.valueOrNull!.id,
          tracking: trackingID.valueOrNull,
          price: price.valueOrNull,
          currency: priceType.valueOrNull,
          invoice: image.valueOrNull,
          note: note.valueOrNull,
        );
        // if (result.tariffList != null) {
        //   emit(ReportSuccess(
        //       //    result.tariffList!
        //       ));
        // } else {
        //   emit(ReportError());
        // }
      } else {
        Snack.display(
            context: context, message: MyText.all_fields_must_be_filled);
      }
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
      (!selectedCategory.hasValue || selectedCategory.value == null);

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
      (!selectedSubCategory.hasValue || selectedSubCategory.value == null);

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
  final BehaviorSubject<int> productCount = BehaviorSubject<int>();

  Stream<int> get productCountStream => productCount.stream;

  updateProductCount(int value) {
    if (value == null ) {
     // productCount.value = '';
      productCount.sink.addError(MyText.field_is_not_correct);
    } else {
      productCount.sink.add(value);
    }
    // isUserInfoValid(registerType: _registerType);
  }

  bool get isProductCountIncorrect => (!productCount.hasValue ||
      productCount.value == null );

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

  updatePrice(double value) {
    if (value == null ) {

      price.sink.addError(MyText.field_is_not_correct);
    } else {
      price.sink.add(value);
    }
    // isUserInfoValid(registerType: _registerType);
  }

  bool get isPriceIncorrect =>
      (!price.hasValue || price.value == null );

  //priceType
  final BehaviorSubject<String> priceType = BehaviorSubject<String>.seeded(MyText.tryy);

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

  bool get isPriceTypeIncorrect =>
      (!priceType.hasValue || priceType.value == null || priceType.value.isEmpty);

  ////validation
  bool isUserInfoValid() {
    if (!isNoteIncorrect &&
        !isSellerIncorrect &&
        !isProductCountIncorrect &&
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

  updateImage(File value) {
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
    return super.close();
  }

  Future<File?> pickPhotoFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      updateImage(imageFile);
      bbbb("image picked succesfully!");
      return imageFile;
    }
  }
}
