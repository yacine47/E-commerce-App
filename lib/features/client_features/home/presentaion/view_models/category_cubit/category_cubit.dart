import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/models/category_model.dart';
import 'package:ecommerce_app/features/client_features/home/data/repos/home_client_repo.dart';
import 'package:meta/meta.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this.homeClientRepo) : super(CategoryInitial());

  final HomeClientRepo homeClientRepo;

  Future<void> getAllCategories() async {
    emit(CategoryLoading());
    var result = await homeClientRepo.getAllCategories();

    result.fold(
      (failure) => emit(CategoryFailure(failure.error)),
      (categories) => emit(CategorySuccess(categories)),
    );
  }
}
