import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teaching/core/export/export.dart';


class SubscriptionOperationCubit extends Cubit<CubitStates> {
  SubscriptionOperationCubit() : super(InitialState());

  int tabIndex=0;
  onChangeTabIndex(int index){
    tabIndex=index;
    print(tabIndex);
    emit(LoadedState<int>(data: tabIndex));
  }

}
