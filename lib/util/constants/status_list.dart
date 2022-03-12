import 'package:caspa_v2/infrastructure/models/local/statuses.dart';

class StatusList {
  final List<Status> all = [
    Status(id: 1, status: 'Sifariş verilib'),
    Status(id: 2, status: 'Anbardadır'),
    Status(id: 3, status: 'Bəyan'),
    Status(id: 4, status: 'Göndərilib'),
    Status(id: 5, status: 'Gömrükdə'),
    Status(id: 6, status: 'Çeşidlənir'),
    Status(id: 8, status: 'Çatıb'),
    Status(id: 9, status: 'Təhvil verilib'),
    Status(id: 10, status: 'Kuryer ilə Təhvil'),
  ];

  final List<Status> special = [
    Status(id: 1, status: 'Sifariş verilib', step: 'Sifariş verilib'),
    Status(id: 2, status: 'Anbardadır', step: 'Anbardadır'),
    //Status(id: 3, status: 'Bəyan'),
    Status(id: 4, status: 'Göndərilib', step: 'Göndərilib'),
    //Status(id: 5, status: 'Gömrükdə'),
    //Status(id: 6, status: 'Çeşidlənir'),
    Status(id: 8, status: 'Çatıb', step: 'Çatıb'),
    Status(id: 9, status: 'Təhvil verildi', step: 'Təhvil verildi'),
    // Status(id: 10, status: 'Kuryer ilə Təhvil'),
  ];

  static final List<Status> steps = [
    Status(id: 1, status: 'Sifariş verilib', step: 'Sifariş verilib'),
    Status(id: 2, status: 'Xarici anbardadır', step: 'Anbarda'),
    //Status(id: 3, status: 'Bəyan'),
    Status(id: 4, status: 'Yoldadır', step: 'Göndərilib'),
    //Status(id: 5, status: 'Gömrükdə'),
    //Status(id: 6, status: 'Çeşidlənir'),
    Status(id: 8, status: 'Yerli anbardadır', step: 'Çatıb'),
    Status(id: 9, status: 'Təhvil verildi', step: 'Təhvil verildi'),
    // Status(id: 10, status: 'Kuryer ilə Təhvil'),
  ];

  static final List<String> stepsString = [
    'Sifariş verilib',
    'Anbarda',
    //Status(id: 3, status: 'Bəyan'),
    'Göndərilib',
    //Status(id: 5, status: 'Gömrükdə'),
    //Status(id: 6, status: 'Çeşidlənir'),
    'Çatıb',
    'Təhvil verildi',
    // Status(id: 10, status: 'Kuryer ilə Təhvil'),
  ];

  static String? fromStatusToStep(String status) {
    String step = '';

    for (Status e in steps) {
      if (e.status == status) {
        step = e.step!;
      }
    }

    return step;
    // steps.
  }
}
