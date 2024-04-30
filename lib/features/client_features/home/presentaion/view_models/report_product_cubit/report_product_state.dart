part of 'report_product_cubit.dart';

@immutable
abstract class ReportProductState {}

class ReportProductInitial extends ReportProductState {}

class ReportProductLoading extends ReportProductState {}

class ReportProductFailure extends ReportProductState {
  final String errMessage;

  ReportProductFailure(this.errMessage);
}

class ReportProductSuccess extends ReportProductState {
  final String successMessage;

  ReportProductSuccess(this.successMessage);
}
