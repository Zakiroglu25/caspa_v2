import 'package:caspa_v2/util/enums/payment_type.dart';
import 'package:flutter/cupertino.dart';

class PaymentKind{

  String title;
  Widget? child;
  PaymentType paymentType;

  PaymentKind({required this.title, this.child,required this.paymentType});
}