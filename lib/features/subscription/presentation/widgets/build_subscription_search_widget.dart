import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/courses_groups/presentation/manager/coures_group_operation_cubit.dart';
import 'package:teaching/features/courses_groups/presentation/manager/public_course_cubit.dart';
import 'package:teaching/features/courses_groups/presentation/manager/public_group_cubit.dart';

class BuildSubscriptionSearchWidget extends StatefulWidget {
  BuildSubscriptionSearchWidget({
    super.key,
  });

  @override
  State<BuildSubscriptionSearchWidget> createState() =>
      _BuildSubscriptionSearchWidgetState();
}

class _BuildSubscriptionSearchWidgetState
    extends State<BuildSubscriptionSearchWidget> with SearchVariables {
  @override
  Widget build(BuildContext context) {
    return PositionedDirectional(
      top: 50,
      end: 10,
      start: 10,
      child: BlocBuilder<CoursesGroupOperationCubit, CubitStates>(
        builder: (context, state) {
          if (context.read<CoursesGroupOperationCubit>().publicTapIndex == 0) {
            return BlocBuilder<PublicCourseCubit, CubitStates>(
              builder: (context, state) {
                return CustomTextFormField(
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  enabledBorder:
                      OutlineInputBorder(borderSide: BorderSide.none),
                  isFill: true,
                  controller: subscribeCourseController,
                  onChanged: (String input) {
                    subscribeCourseController.text = input;

                    setState(() {});
                    context
                        .read<PublicCourseCubit>()
                        .searchInList(subscribeCourseController.text);
                  },
                );
              },
            );
          } else {
            return BlocBuilder<PublicGroupCubit, CubitStates>(
              builder: (context, state) {
                return CustomTextFormField(
                  isFill: true,
                  controller: subscribeGroupController,
                  onChanged: (String input) {
                    subscribeGroupController.text = input;
                    setState(() {});
                    context
                        .read<PublicGroupCubit>()
                        .searchInList(subscribeGroupController.text);
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
