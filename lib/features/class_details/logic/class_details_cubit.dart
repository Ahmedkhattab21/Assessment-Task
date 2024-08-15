import 'package:assesment_task/features/class_details/data/models/add_class_request.dart';
import 'package:assesment_task/features/class_details/data/models/add_class_response_error.dart';
import 'package:assesment_task/features/class_details/data/models/update_class_request.dart';
import 'package:assesment_task/features/class_details/data/repos/class_details_repo.dart';
import 'package:assesment_task/features/class_details/logic/class_details_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClassDetailsCubit extends Cubit<ClassDetailsState> {
  final ClassDetailsRepo _classDetailsRepo;

  ClassDetailsCubit(this._classDetailsRepo) : super(InitialState());

  final formKey = GlobalKey<FormState>();

  TextEditingController addArController = TextEditingController();
  TextEditingController addEnController = TextEditingController();

  addGrade(BuildContext context, String gradeId, String schoolId) {
    emit(OnAddClassLoadingState());
    _classDetailsRepo
        .addClass(AddClassRequest(
            nameAr: addArController.text,
            nameEn: addEnController.text,
            gradeId: gradeId,
            schoolId: schoolId))
        .then((value) {
      value.fold((l) {
        emit(OnAddClassErrorState(
            error: ClassError(
                nameAr: l.error.nameAr,
                nameEn: l.error.nameEn,
                gradeId: l.error.gradeId,
                schoolId: l.error.schoolId)));
      }, (r) {
        emit(OnAddClassSuccessState());
      });
    }).catchError((error) {
      emit(OnAddClassCatchErrorState());
    });
  }

  getData(String textAr, String textEn) {
    addArController.text = textAr;
    addEnController.text = textEn;
  }

  editClass(BuildContext context, String id, String gradeId, String schoolId) {
    emit(OnAddClassLoadingState());
    _classDetailsRepo
        .editClass(UpdateClassRequest(
      nameAr: addArController.text,
      nameEn: addEnController.text,
      gradeId: gradeId,
      schoolId: schoolId,
      id: id,
    ))
        .then((value) {
      value.fold((l) {
        emit(OnAddClassErrorState(
            error: ClassError(
                nameAr: l.error.nameAr,
                nameEn: l.error.nameEn,
                gradeId: l.error.gradeId,
                schoolId: l.error.schoolId)));
      }, (r) {
        emit(OnAddClassSuccessState());
      });
    }).catchError((error) {
      emit(OnAddClassCatchErrorState());
    });
  }

  static ClassDetailsCubit get(context) => BlocProvider.of(context);
}
