import 'package:assesment_task/features/claces/data/models/delete_class_request.dart';
import 'package:assesment_task/features/claces/data/models/get_claces_response_model.dart';
import 'package:assesment_task/features/claces/data/repos/claces_repo.dart';
import 'package:assesment_task/features/claces/logic/claces_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClacesCubit extends Cubit<ClacesState> {
  final ClacesRepo _clacesRepo;

  ClacesCubit(this._clacesRepo) : super(InitialState());

  List<GetClacesResponseModel> claces = [];

  getClaces(String id) {
    emit(OnGetClacesLoadingState());
    _clacesRepo.getClaces().then((value) {
      value.fold((l) {
        emit(OnGetClacesErrorState());
      }, (r) {
        claces = r.where((item) => item.gradeId == id).toList();
        emit(OnGetClacesSuccessState());
      });
    }).catchError((error) {
      emit(OnGetClacesCatchErrorState());
    });
  }

  List<GetClacesResponseModel> searchedClaces = [];
  TextEditingController searchController = TextEditingController();

  searchNames(String query) {
    searchedClaces = claces
        .where((item) => item.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    emit(OnSearchDoneState());
  }

  deleteItem(int type, String id) {
    if (type == 1) {
      searchedClaces.removeWhere((item) => item.id == id);
    } else {
      claces.removeWhere((item) => item.id == id);
    }
    emit(OnGetClacesSuccessState());
  }

  deleteClass(String gradeId,String id) {
    _clacesRepo
        .deleteClass(DeleteClassRequest(
      id: id,
    ))
        .then((value) {
      value.fold((l) {}, (r) {
        getClaces(gradeId);
      });
    }).catchError((error) {});
  }

  static ClacesCubit get(context) => BlocProvider.of(context);
}
