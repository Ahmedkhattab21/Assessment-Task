import 'package:assesment_task/core/services/cache_helper.dart';
import 'package:assesment_task/core/utils/constant_keys.dart';
import 'package:assesment_task/features/home/logic/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(InitialState());

  String name=".....";

   getNameFromShared() {
     name= CacheHelper.getString(ConstantKeys.saveNameToShared) ?? ".....";
    emit(OnGetNameDoneState());
  }

  static HomeCubit get(context) => BlocProvider.of(context);
}
