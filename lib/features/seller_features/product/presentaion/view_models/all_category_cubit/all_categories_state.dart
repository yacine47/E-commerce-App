part of 'all_categories_cubit.dart';

@immutable
abstract class AllCategoriesState {}

class AllCategoriesInitial extends AllCategoriesState {}

class AllCategoriesLoading extends AllCategoriesState {}

class AllCategoriesSuccess extends AllCategoriesState {
  final List<MultiSelectItem<int>> categories;

  AllCategoriesSuccess(this.categories);
}

class AllCategoriesFailure extends AllCategoriesState {
  final String errMessage;

  AllCategoriesFailure(this.errMessage);
}
