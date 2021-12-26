// //note
// final BehaviorSubject<String> note = BehaviorSubject<String>();
//
// Stream<String> get noteStream => note.stream;
//
// updatenote(String value) {
//   if (value == null || value.isEmpty) {
//     note.value = '';
//     note.sink.addError(MyText.field_is_not_correct);
//   } else {
//     note.sink.add(value);
//   }
//   // isUserInfoValid(registerType: _registerType);
// }
//
// bool get isnoteIncorrect =>
//     (!note.hasValue || note.value == null || note.value.isEmpty);
//
//