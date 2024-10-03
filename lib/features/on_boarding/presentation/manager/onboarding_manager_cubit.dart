import '../../../../core/export/export.dart';
import '../../domain/usecase/onborading_usecases.dart';

part 'onboarding_manager_state.dart';

class OnboardingManagerCubit extends Cubit<OnboardingManagerState> {
  OnBoardingUsesCases onBoardingUsesCases;
  OnboardingManagerCubit({required this.onBoardingUsesCases}) : super(OnboardingManagerInitial());
  Future<bool> isNewInstalled() async => (await managerExecute<bool?>(onBoardingUsesCases.getNew())).orTrue;

  Future<bool> cachedNewInstall() async => (await managerExecute<bool?>(onBoardingUsesCases.cacheNew(), onSuccess: (data) {
        Routes.loginRoute.moveToAndRemoveCurrent();
      }))
          .orFalse;

  int currentPage = 0;
  onChangeOnBoardingWidget(int page){
    currentPage=page;
    emit(OnChangeOnBoardingState());
  }

}
