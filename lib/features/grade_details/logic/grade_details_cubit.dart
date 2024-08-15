import 'package:assesment_task/features/grade_details/data/models/add_grade_request.dart';
import 'package:assesment_task/features/grade_details/data/models/add_grade_response_error.dart';
import 'package:assesment_task/features/grade_details/data/models/update_grade_request.dart';
import 'package:assesment_task/features/grade_details/data/repos/grade_details_repo.dart';
import 'package:assesment_task/features/grade_details/logic/grade_details_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GradeDetailsCubit extends Cubit<GradeDetailsState> {
  final GradeDetailsRepo _gradeDetailsRepo;

  GradeDetailsCubit(this._gradeDetailsRepo) : super(InitialState());

  final formKey = GlobalKey<FormState>();

  TextEditingController addArController = TextEditingController();
  TextEditingController addEnController = TextEditingController();

  addGrade(BuildContext context, String schoolId) {
    emit(OnAddGradeLoadingState());
    _gradeDetailsRepo
        .addGrade(AddGradeRequest(
            nameAr: addArController.text,
            nameEn: addEnController.text,
            schoolId: schoolId))
        .then((value) {
      value.fold((l) {
        emit(OnAddGradeErrorState(
            error: ErrorResponse(
                nameAr: l.error.nameAr,
                nameEn: l.error.nameEn,
                schoolId: l.error.schoolId)));
      }, (r) {
        emit(OnAddGradeSuccessState());
      });
    }).catchError((error) {
      emit(OnAddGradeCatchErrorState());
    });
  }

  getData(String textAr, String textEn) {
    addArController.text = textAr;
    addEnController.text = textEn;
  }

  editGrade(BuildContext context, String id, String schoolId) {
    emit(OnAddGradeLoadingState());
    _gradeDetailsRepo
        .editGrade(UpdateGradeRequest(
      nameAr: addArController.text,
      nameEn: addEnController.text,
      schoolId: schoolId,
      id: id,
    ))
        .then((value) {
      value.fold((l) {
        emit(OnAddGradeErrorState(
            error: ErrorResponse(
                nameAr: l.error.nameAr,
                nameEn: l.error.nameEn,
                schoolId: l.error.schoolId)));
      }, (r) {
        emit(OnAddGradeSuccessState());
      });
    }).catchError((error) {
      emit(OnAddGradeCatchErrorState());
    });
  }

  static GradeDetailsCubit get(context) => BlocProvider.of(context);
}
