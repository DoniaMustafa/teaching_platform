import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/notes/presentation/manager/notes_cubit.dart';
import 'package:teaching/features/notes/presentation/manager/notes_public_cubit.dart';

class BuildPublicNotes extends StatelessWidget {
  const BuildPublicNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<NotesPublicCubit, CubitStates>(
        builder: (context, state) {
          if (state is FailedState) {
            return CustomErrorWidget(
              onTap: () => context.read<NotesPublicCubit>().getPublicNotes(),
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
          // if (AppPrefs.userRole == "1" || AppPrefs.userRole == "7") {
          AppService().getBlocData<NotesCubit>().getNotes(
              model: TeacherModel(
                  subjectId: teacher.subjectId,
                  teacherName: teacher.teacherName));
          // }
          Routes.notesRoute.moveTo;
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
