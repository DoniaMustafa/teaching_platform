import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/courses_groups/presentation/manager/public_course_cubit.dart';
import 'package:teaching/features/teacher/teachers/data/models/teacher_respons_model.dart';
import 'package:teaching/features/teacher/teachers/presentation/manager/teachers_of_student_cubit.dart';
import 'package:teaching/features/notes/presentation/manager/notes_booked_unbooked_cubit.dart';
import 'package:teaching/features/notes/presentation/manager/notes_cubit.dart';
import 'package:teaching/features/notes/presentation/pages/notes_booked_unbooked_screen.dart';
import 'package:teaching/features/teacher/teacher_details/presentation/manager/teacher_details_cubit.dart';

import '../manager/notes_operation_cubit.dart';

class BuildNotes extends StatelessWidget {
  const BuildNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<NotesCubit, CubitStates>(
        builder: (context, state) {
          if (state is FailedState) {
            return CustomErrorWidget(
              onTap: () => context.read<NotesCubit>().getNotes(),
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

  Widget buildTeachersItem(TeacherDetailsData teacher) => GestureDetector(
        onTap: () {
          AppService().getBlocData<NotesOperationCubit>().notesIndex = 0;
          Routes.notesBookedUnbookedRoute.moveToWithArgs({
            NotesBookedUnbookedScreen.subjectIdKey: teacher.subjectId,
            NotesBookedUnbookedScreen.teacherIdKey: teacher.teacherId,
          });
          AppService()
              .getBlocData<NotesBookedUnbookedCubit>()
              .getBookedUnBookedNotes(
                  model: TeacherModel(
                      teacherId: teacher.teacherId,
                      subjectId: teacher.subjectId));
          // Routes.teacherDetailsRoute.moveTo;
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
            isBorder: false, spacer: 8,
            followers: teacher.followersCount!.toString(),
            endTitle: teacher.followersCount! <= 1
                ? AppStrings().follower.trans
                : AppStrings().followers.trans,
            // radiusDirectional: BorderRadiusDirectional.only(
            //   topEnd: Radius.circular(10),topStart: Radius.circular(10)
            // ),
            title: teacher.teacherName!,
            subtitle: teacher.subjectName ?? '',
            image: '${EndPoints.url}${teacher.teacherPicture!}',
            rate: teacher.rate,
            dividerHeight: height / 8.9,
            padding: getPadding(horizontal: 10.w, vertical: 10.h),
          ),
        ),
      );
}
// return
