// class ErrorResponse {
//   List<List>? errors;
//
//   ErrorResponse({this.errors});
//
//   ErrorResponse.fromJson(Map<String, dynamic> json) {
//     if (json['errors'] != null) {
//       errors = <List>[];
//       json['errors'].forEach((v) { errors.add(new List.fromJson(v)); });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.errors != null) {
//       dxaata['errors'] = this.errors.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Errors {
//
//
//   Errors({});
//
// Errors.fromJson(Map<String, dynamic> json) {
// }
//
// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = new Map<String, dynamic>();
//   return data;
// }
// }
//
