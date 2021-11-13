// //birthDate
//  final BehaviorSubject<String> birthDate = BehaviorSubject<String>();
//
// Stream<String> get birthDateStream => birthDate.stream;
//
// updateBirthDate(String value) {
//   if (value == null || value.isEmpty) {
//     birthDate.value = '';
//     birthDate.sink.addError("field_is_not_correct");
//   } else {
//     birthDate.sink.add(value);
//   }
// }
//
// bool get isBirthDateIncorrect =>
//     (!birthDate.hasValue || birthDate.value == null || birthDate.value.isEmpty);