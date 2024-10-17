import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/courses_groups/presentation/manager/public_course_cubit.dart';
import 'package:teaching/features/home/data/models/teacher_respons_model.dart';
import 'package:teaching/features/home/presentation/manager/teachers_of_student_cubit.dart';
import 'package:teaching/features/teacher/teacher_details/presentation/manager/teacher_details_cubit.dart';

class BuildTeachers extends StatelessWidget {
  const BuildTeachers({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<TeachersOfStudentCubit, CubitStates>(
        builder: (context, state) {
          if (state is FailedState) {
            return CustomErrorWidget(
              onTap: () =>
                  context.read<TeachersOfStudentCubit>().getTeacherOfStudent(),
              message: state.message,
            );
          }
          if (state is LoadedState && state.data.isEmpty) {
            return const CustomEmptyWidget();
          }
          return CustomListView(
              itemCount: state is LoadedState
                  ? state.data.length
                  : AppConstants.shimmerItems,
              // shrinkWrap: true,
              separatorWidget: (BuildContext context, int index) => 20.vs,
              axisDirection: Axis.vertical,
              widget: (BuildContext context, int index) => state is LoadedState
                  ? buildTeachersItem(state.data[index])
                  : CustomShimmer.fromRectangle(
                      width: width,
                      height: 90,
                    ));
        },
      ),
    );
  }

  Widget buildTeachersItem(TeacherDataModel teacher) => GestureDetector(
        onTap: () {
          AppService()
              .getBlocData<TeacherDetailsCubit>()
              .getTeacherDetails(model: TeacherModel(teacherId: teacher.id));
          Routes.teacherDetailsRoute.moveTo;
        },
        child: CustomCard(
          radius: 0,
          backgroundColor: AppColors.white,
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 2),
                color: AppColors.black.withOpacity(0.25),
                blurRadius: 8)
          ],
          child: CustomListTile(
            title: teacher.name!,
            subtitle: teacher.subjects!,
            image: '${EndPoints.url}${teacher.profileImage!}',
            rate: teacher.rate,
            height: height / 8.9,
            followers:
                '${teacher.followersCount} ${AppStrings().follower.trans} ',
            padding: getPadding(horizontal: 10.w, vertical: 10.h),
          ),
        ),
      );
}
// return
