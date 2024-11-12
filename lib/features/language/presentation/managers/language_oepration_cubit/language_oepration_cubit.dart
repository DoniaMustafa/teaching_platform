import '../../../../../core/export/export.dart';
import '../language_cubit/language_cubit.dart';

part 'language_oepration_state.dart';

class LanguageOperationCubit extends Cubit<LanguageOeprationState> {
  LanguageOperationCubit() : super(LanguageOeprationInitial());

  int? selected ;
  changeSelected(int index) {
    if (AppService().getBlocData<LanguageCubit>().isEn.isTrue) {
      selected = 0;
      index = 0;
    } else {
      selected = 1;
      index = 1;
    }
    selected = index;
    emit(ChangeSelectedState());
  }
}
