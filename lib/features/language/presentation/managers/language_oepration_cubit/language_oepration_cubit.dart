import '../../../../../core/export/export.dart';
import '../language_cubit/language_cubit.dart';

part 'language_oepration_state.dart';

class LanguageOperationCubit extends Cubit<LanguageOeprationState> {
  LanguageOperationCubit() : super(LanguageOeprationInitial());

  int selected = 0;
  changeSelected(int index) {
    if (AppService().getBlocData<LanguageCubit>().isEn.isTrue) {
      selected = 0;
    } else {
      selected = 1;
    }
    selected = index;
    emit(ChangeSelectedState());
  }
}
