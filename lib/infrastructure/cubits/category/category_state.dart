import 'package:caspa_v2/infrastructure/models/remote/response/categories_response.dart';

abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryInProgress extends CategoryState {}

class CategoryError extends CategoryState {
  String? error;

  CategoryError({this.error});
}

class CategorySuccess extends CategoryState {
  CategorySuccess(this.categories);

  List<Category> categories;
}

class CategoryNetworkError extends CategoryState {}
