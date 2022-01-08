import 'package:caspa_v2/util/enums/payment_type.dart';
import 'package:flutter/cupertino.dart';

class PaymentTypeModel{

  String title;
  Widget? child;
  PaymentType paymentType;

  PaymentTypeModel({required this.title, this.child,required this.paymentType});
}