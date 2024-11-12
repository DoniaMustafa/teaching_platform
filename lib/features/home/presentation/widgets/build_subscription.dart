
import '../../../../core/export/export.dart';

class BuildSubscription extends StatelessWidget {
  const BuildSubscription({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 1.5 / 0.9,
        // height: 250.h,
        child: BlocBuilder<SubscriptionCubit, CubitStates>(
            builder: (context, state) {
          if (state is FailedState) {
            return CustomErrorWidget(
              onTap: () => context.read<SubscriptionCubit>().getSubscription(),
              message: state.message,
            );
          }
          if (state is LoadedState &&
              state.data.courses.isEmpty &&
              state.data.groups.isEmpty) {
            return const SizedBox.shrink();
          }
          return buildTeachersOfStudentList(state);
        }));
  }

  Widget buildTeachersOfStudentList(CubitStates state) {
    return state is LoadedState
        ? ListView(
            scrollDirection: Axis.horizontal,
            children: [
              CustomListView( axisDirection: Axis.horizontal,
                  shrinkWrap: true,
                  separatorWidget: (context, index) => SizedBox(
                        width: 20.w,
                      ),
                  itemCount: state is LoadedState
                      ? state.data.courses.length
                      : AppConstants.nShimmerItems,
                  widget: (context, index) => CustomItem(
                        onNavigateTap: () =>
                            Routes.subscriptionOfCourseDetailsRoute.moveTo,
                        isSubScribe: true,
                        coursesModel: state.data.courses[index],
                      )),
              CustomListView( axisDirection: Axis.horizontal,
                  shrinkWrap: true,
                  separatorWidget: (context, index) => SizedBox(
                        width: 20.w,
                      ),
                  itemCount: state is LoadedState
                      ? state.data.groups.length
                      : AppConstants.nShimmerItems,
                  widget: (context, index) => CustomItem(
                        onNavigateTap: () {
                          context
                              .read<SubscriptionGroupDetailsCubit>()
                              .getSubscriptionGroupDetails(
                                  model: TeacherModel(
                                      teacherId:
                                          state.data.groups[index].teacherId,
                                      subjectId:
                                          state.data.groups[index].subjectId));
                          Routes.subscriptionGroupDetailsRoute.moveTo;
                        },
                        isSubScribe: true,
                        groupsModel: state.data.groups[index],
                      )),
            ],
          )
        : CustomShimmerItemOfList();
  }
}
