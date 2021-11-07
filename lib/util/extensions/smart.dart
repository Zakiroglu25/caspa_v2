// Flutter imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension SmartSize on  num {
  double get sm => (this.sp.toDouble()>toDouble())?toDouble():sp;
}
