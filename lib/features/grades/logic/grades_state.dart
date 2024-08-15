abstract class GradesState {}

class InitialState extends GradesState {}

class OnGetGradesLoadingState extends GradesState {}
class OnGetGradesSuccessState extends GradesState {}
class OnGetGradesErrorState extends GradesState {}
class OnGetGradesCatchErrorState extends GradesState {}

class OnSearchDoneState extends GradesState {}
