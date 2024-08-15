import 'package:assesment_task/features/grade_details/data/models/add_grade_response_error.dart';

abstract class GradeDetailsState {}

class InitialState extends GradeDetailsState {}


class OnAddGradeLoadingState extends GradeDetailsState {}
class OnAddGradeSuccessState extends GradeDetailsState {}
class OnAddGradeErrorState extends GradeDetailsState {
  ErrorResponse error;

  OnAddGradeErrorState({required this.error});
}
class OnAddGradeCatchErrorState extends GradeDetailsState {}


// class OnEditGradeLoadingState extends GradeDetailsState {}
// class OnEditGradeSuccessState extends GradeDetailsState {}
// class OnEditGradeErrorState extends GradeDetailsState {
//   String error;
//
//   OnEditGradeErrorState({required this.error});
// }
// class OnEditGradeCatchErrorState extends GradeDetailsState {}

