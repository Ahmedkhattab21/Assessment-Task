abstract class ClacesState {}

class InitialState extends ClacesState {}

class OnGetClacesLoadingState extends ClacesState {}
class OnGetClacesSuccessState extends ClacesState {}
class OnGetClacesErrorState extends ClacesState {}
class OnGetClacesCatchErrorState extends ClacesState {}

class OnSearchDoneState extends ClacesState {}
