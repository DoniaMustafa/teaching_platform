import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/subscriptions/subscription_details/presentation/manager/subscriptipn_course_details_cubit.dart';

class BuildSubscribeCourseDetailsComponent extends StatelessWidget {
  BuildSubscribeCourseDetailsComponent({super.key,});



  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubscriptionCourseDetailsCubit, CubitStates>(
      builder: (context, state) {
        if (state is FailedState) {
          return CustomErrorWidget(message: state.message, onTap: () {});
        } else if (state is LoadedState && state.data.isEmpty) {
          return const CustomEmptyWidget();
        }
        if(state is LoadedState){
          return _buildComponent(state.data[0]);
        }else{
          return CustomShimmer(width: 100,height: 20,);
        }

      },
    );
  }
  _buildComponent(TeacherModel model)=>CustomHeader(
    image: '${EndPoints.url}${model.teacherPicture}',
    name: model.teacherName!,
    subjectLabel: model.subjectName!,
    gradeLabel: model.gradeName!,
    labelType: AppStrings().courses.trans,
  );
}
