import 'package:caspa_v2/infrastructure/models/remote/response/contact_model.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/shop_list.dart';

abstract class ContactState {}

class ContactInitial extends ContactState {}

class ContactInProgress extends ContactState {}

class ContactError extends ContactState {
  String? error;

  ContactError({this.error});
}

class ContactNetworkError extends ContactState {}

class ContactSuccess extends ContactState {
  ContactSuccess(this.contact);

  final Contact? contact;
}