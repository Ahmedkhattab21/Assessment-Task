import 'dart:collection';

import 'package:assesment_task/features/grades/data/models/delete_grade_request.dart';
import 'package:assesment_task/features/grades/data/models/get_grades_response_model.dart';
import 'package:assesment_task/features/grades/data/repos/grades_repo.dart';
import 'package:assesment_task/features/grades/logic/grades_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GradesCubit extends Cubit<GradesState> {
  final GradesRepo _gradesRepo;

  GradesCubit(this._gradesRepo) : super(InitialState());

  List<GetGradesResponseModel> grades = [];

  getGrades() {
    emit(OnGetGradesLoadingState());
    _gradesRepo.getGrades().then((value) {
      value.fold((l) {
        emit(OnGetGradesErrorState());
      }, (r) {
        grades = r;
        emit(OnGetGradesSuccessState());
      });
    }).catchError((error) {
      emit(OnGetGradesCatchErrorState());
    });
  }

  List<GetGradesResponseModel> searchedGrades = [];
  TextEditingController searchController = TextEditingController();

  searchNames(String query) {
    searchedGrades = grades
        .where((item) => item.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    emit(OnSearchDoneState());
  }

  // deleteItem(int type, String id) {
  //   if (type == 1) {
  //     searchedGrades.removeWhere((item) => item.id == id);
  //   } else {
  //     grades.removeWhere((item) => item.id == id);
  //   }
  //   emit(OnGetGradesSuccessState());
  // }

  deleteGrade(String id) {
    _gradesRepo
        .deleteGrade(DeleteGradeRequest(
      id: id,
    ))
        .then((value) {
      value.fold((l) {}, (r) {
        getGrades();
      });
    }).catchError((error) {});
  }

  static GradesCubit get(context) => BlocProvider.of(context);
}
