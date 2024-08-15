import 'package:assesment_task/features/class_details/data/models/add_class_response_error.dart';

abstract class ClassDetailsState {}

class InitialState extends ClassDetailsState {}


class OnAddClassLoadingState extends ClassDetailsState {}
class OnAddClassSuccessState extends ClassDetailsState {}
class OnAddClassErrorState extends ClassDetailsState {
  ClassError error;

  OnAddClassErrorState({required this.error});
}
class OnAddClassCatchErrorState extends ClassDetailsState {}


