import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/chat/data/models/teachers_to_chat_response_model.dart';
import 'package:teaching/features/chat/presentation/manager/teacher_to_chat_cubit.dart';
import 'package:teaching/features/chat/presentation/widgets/chat/custom_online_image.dart';

class BuildUsersOnlineChat extends StatelessWidget {
  const BuildUsersOnlineChat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3.2 / 0.9,
      child: BlocBuilder<TeacherToChatCubit, CubitStates>(
        builder: (context, state) {
          if (state is FailedState) {
            return CustomErrorWidget(
              onTap: () =>
                  context.read<TeacherToChatCubit>().getTeacherToChat(),
              message: state.message,
            );
          }
          if (state is LoadedState && state.data.isEmpty) {
            return const SizedBox.shrink();
          }
          return CustomListView(
              axisDirection: Axis.horizontal,
              itemCount: state is LoadedState
                  ? state.data.length
                  : AppConstants.nShimmerItems,
              widget: (context, index) => state is LoadedState
                  ? _buildTeacherItem(state.data[index])
                  : CustomShimmer.fromCircular(
                      radius: 30.r,
                    ));
        },
      ),
    );
  }

  Widget _buildTeacherItem(TeachersToChatData teacher) => GestureDetector(
        // onTap: onTap,
        child: Padding(
          padding: getPadding(end: 10.w),
          child: Column(
            children: [
              CustomOnlineImage(
                image: '${EndPoints.url}${teacher.profilePicture}',
              ),
              5.vs,
              CustomTextWidget(
                text: teacher.teacherName!,
                style: getRegularTextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      );
}
