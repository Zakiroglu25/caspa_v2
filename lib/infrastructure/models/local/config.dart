
import 'package:caspa_v2/presentation/page/auth/register/widgets/selectable/gender_list.dart';
import 'package:caspa_v2/util/enums/gender_type.dart';

class ConfigFIre {
   bool? writeUser;
   bool? writePath;

//<editor-fold desc="Data Methods">

   ConfigFIre({
    this.writeUser,
    this.writePath,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ConfigFIre &&
          runtimeType == other.runtimeType &&
          writeUser == other.writeUser &&
          writePath == other.writePath);

  @override
  int get hashCode => writeUser.hashCode ^ writePath.hashCode;

  @override
  String toString() {
    return 'Config{' +
        ' writeUser: $writeUser,' +
        ' writePath: $writePath,' +
        '}';
  }

  ConfigFIre copyWith({
    bool? writeUser,
    bool? writePath,
  }) {
    return ConfigFIre(
      writeUser: writeUser ?? this.writeUser,
      writePath: writePath ?? this.writePath,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'writeUser': this.writeUser,
      'writePath': this.writePath,
    };
  }

  factory ConfigFIre.fromMap(Map<String, dynamic> map) {
    return ConfigFIre(
      writeUser: map['writeUser'] as bool,
      writePath: map['writePath'] as bool,
    );
  }



  ConfigFIre.fromJson(Map<String, dynamic> json) {
    writeUser = json['writeUser'];
    writePath = json['writePath'];

  }


//</editor-fold>
}
