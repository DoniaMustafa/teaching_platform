import 'package:bloc/bloc.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/subscriptions/subscription_details/domain/use_cases/subscription_details_use_Case.dart';

class SubscriptionCourseDetailsCubit extends Cubit<CubitStates> {
  SubscriptionCourseDetailsCubit(this.useCase) : super(InitialState());

  SubscriptionDetailsUseCase useCase;
  getSubscribeCourseDetails({TeacherModel? model}) {
    managerExecute<List<TeacherModel>>(
        useCase.getSubscribeCourseDetails(model: model!),
        onSuccess: (data) {
          // for (var element in data![0].teacherCourses!) {
          //   element.courseLessons!.forEach((lessons) {
          //     lessons.free = true;
          //     lessons.isSubscribed = true;
          //   });
          // }
          emit(LoadedState<List<TeacherModel>>(data: data!));
        },
        onFail: (message) => emit(FailedState(message: message)),
        onStart: () => emit(LoadingState()));
  }
}
