import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/notes/presentation/manager/notes_booked_unbooked_cubit.dart';

class BuildNotesComponent extends StatelessWidget {
  const BuildNotesComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesBookedUnbookedCubit, CubitStates>(
      builder: (context, state) {
        if (state is FailedState) {
          return SizedBox.shrink();
        }
        if (state is LoadedState &&
            context.read<NotesBookedUnbookedCubit>().booked.isEmpty) {
          return SizedBox.shrink();
        } else {
          if (state is LoadedState) {
            return CustomHeader(
             name: state.data[0].teacherName!,
              subjectLabel: state.data[0].subjectName!,
              // gradeLabel: model[0].gradeName!,
              labelType: AppStrings().notes.trans,
            );
          } else {
            return Column(
              children: [
                CustomShimmer.fromCircular(
                  radius: 40.r,
                ),
                20.vs,
                CustomShimmer.fromRectangle(
                  width: 100.w,
                  height: 20.h,
                ),
                20.vs,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomShimmer.fromRectangle(
                      width: 100.w,
                      height: 20.h,
                    ),
                    CustomShimmer.fromRectangle(
                      width: 100.w,
                      height: 20.h,
                    ),
                  ],
                )
              ],
            );
          }
        }
      },
    );
  }
}
