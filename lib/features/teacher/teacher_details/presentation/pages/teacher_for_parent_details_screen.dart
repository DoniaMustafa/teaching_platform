import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/teacher/teacher_details/presentation/widgets/build_teacher_for_parent.dart';
import 'package:teaching/features/teacher/teachers/presentation/widgets/build_teacher_item.dart';

class PrivateTeacherDetailsScreen extends StatelessWidget {
  const PrivateTeacherDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      statusBarColor: AppColors.mainAppColor,
      child: CustomSharedFullScreen(
        title: AppStrings().teachers.trans, isBackIcon: true,
        // anotherWidget: BuildCoursesAndGroupsSearchWidget(),
        widget: Padding(
          padding: getPadding(horizontal: 20.w),
          child: BlocBuilder<TeacherDetailsCubit, CubitStates>(
            builder: (context, state) {
              if (state is FailedState) {}
              if (state is LoadedState) {
                return BuildTeacherForParent(teacher: state.data,);
              }
              return Column(
                children: [
                  CustomShimmer.fromRectangle(
                    width: 150.w,
                    height: 30.h,
                    borderRadius: BorderRadiusDirectional.circular(10),
                  ),
                  10.vs,
                  CustomShimmer.fromRectangle(
                    width: 150.w,
                    height: 30.h,
                    borderRadius: BorderRadiusDirectional.circular(10),
                  ),
                  20.vs,
                  CustomShimmer.fromRectangle(
                    width: 150.w,
                    height: 30.h,
                    borderRadius: BorderRadiusDirectional.circular(10),
                  ),
                  10.vs,
                  CustomShimmer.fromRectangle(
                    width: 150.w,
                    height: 30.h,
                    borderRadius: BorderRadiusDirectional.circular(10),
                  ),
                  10.vs,
                  CustomShimmer.fromRectangle(
                    width: 150.w,
                    height: 30.h,
                    borderRadius: BorderRadiusDirectional.circular(10),
                  ),
                  20.vs,
                  CustomShimmer.fromRectangle(
                    width: 150.w,
                    height: 30.h,
                    borderRadius: BorderRadiusDirectional.circular(10),
                  ),
                  CustomShimmer.fromRectangle(
                    width: 150.w,
                    height: 30.h,
                    borderRadius: BorderRadiusDirectional.circular(10),
                  ),
                  10.vs,
                  CustomShimmer.fromRectangle(
                    width: 150.w,
                    height: 30.h,
                    borderRadius: BorderRadiusDirectional.circular(10),
                  ),
                  20.vs,
                  CustomShimmer.fromRectangle(
                    width: 150.w,
                    height: 30.h,
                    borderRadius: BorderRadiusDirectional.circular(10),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
