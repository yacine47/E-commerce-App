import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/client_features/home/data/repos/home_client_repo.dart';
import 'package:meta/meta.dart';

part 'report_product_state.dart';

class ReportProductCubit extends Cubit<ReportProductState> {
  ReportProductCubit(this.homeClientRepo) : super(ReportProductInitial());

  final HomeClientRepo homeClientRepo;
  late String title;
  late String content;

  Future<void> createReportProduct(int idProduct) async {
    emit(ReportProductLoading());
    var result = await homeClientRepo.createReportProduct(
      idProduct,
      {
        'title': title,
        'content': content,
      },
    );
    result.fold(
      (failure) => emit(ReportProductFailure(failure.error)),
      (success) => emit(ReportProductSuccess(success)),
    );
  }
}
