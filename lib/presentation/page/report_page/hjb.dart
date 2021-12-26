// //priceType
// final BehaviorSubject<String> priceType = BehaviorSubject<String>();
//
// Stream<String> get priceTypeStream => priceType.stream;
//
// updatepriceType(String value) {
//   if (value == null || value.isEmpty) {
//     priceType.value = '';
//     priceType.sink.addError(MyText.field_is_not_correct);
//   } else {
//     priceType.sink.add(value);
//   }
//   // isUserInfoValid(registerType: _registerType);
// }
//
// bool get isPriceTypeIncorrect =>
//     (!priceType.hasValue || priceType.value == null || priceType.value.isEmpty);
