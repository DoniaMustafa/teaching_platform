import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/sessions/student_group_sessions/presentation/manager/sessions_of_group_cubit.dart';
import 'package:teaching/features/subscription_details/presentation/manager/subscriptipn_group_details_cubit.dart';
import 'package:teaching/features/subscription_details/presentation/widgets/build_my_favorite.dart';
import 'package:teaching/features/subscription_details/presentation/widgets/build_subscribe_component.dart';
import 'package:teaching/features/subscription_details/presentation/widgets/subscribe_group_shimmer.dart';

import '../../../sessions/student_group_sessions/presentation/pages/student_group_sessions_screen.dart';

class SubscriptionGroupDetailsScreen extends StatefulWidget {
  const SubscriptionGroupDetailsScreen({super.key});

  @override
  State<SubscriptionGroupDetailsScreen> createState() =>
      _SubscriptionGroupScreenState();
}

class _SubscriptionGroupScreenState
    extends State<SubscriptionGroupDetailsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      statusBarColor: AppColors.mainAppColor,
      child: CustomSharedFullScreen(
        title: AppStrings().subscribeGroupDetails.trans,
        widget: Padding(
            padding: getPadding(horizontal: 10.w),
            child: BlocBuilder<SubscriptionGroupDetailsCubit, CubitStates>(
                builder: (context, state) {
              if (state is FailedState) {
                return CustomErrorWidget(message: state.message, onTap: () {});
              }
              if (state is LoadedState) {
                return _buildBody(state.data[0]);
              }
              return const SubscribeGroupShimmer();
            })),
      ),
    );
  }

  Widget _buildBody(GroupDetailsDataModel model) => Column(
        children: [
          BuildSubscribeComponent(
            model: model,
          ),
          10.vs,
          BuildMyFavorite(
            whichScreen: AppStrings().subscribeGroupDetails,
          ),
          2.vs,
          Expanded(
            child: CustomListView(
              axisDirection: Axis.vertical,
              shrinkWrap: true,
              padding: getPadding(vertical: 30.h, horizontal: 10.w),
              itemCount: model.teacherGroups!.length,
              // scroll: NeverScrollableScrollPhysics(),
              separatorWidget: (context, index) => 20.vs,
              widget: (context, index) => CustomListTile(
                onTap: () {
                  context.read<SessionsOfGroupCubit>().getSessionsOfGroup(
                      groupId: model.teacherGroups![index].groupId!);

                  Routes.studentGroupSessionsRoute.moveToWithArgs(
                      {StudentGroupSessionsScreen.groupDetailsKey: model});
                },
                padding: getPadding(
                  horizontal: 20.w,
                  vertical: 20.h,
                ),
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(0, 4),
                      blurRadius: 3,
                      color: AppColors.black.withOpacity(0.20))
                ],
                title: model.teacherGroups![index].title!,
                subtitle:
                    '${model.teacherGroups![index].availablePlaces}/${model.teacherGroups![index].limit} ${AppStrings().student.trans}',
                endSubtitle:
                    '${model.teacherGroups![index].sessionsCount} ${AppStrings().session.trans} ',
                endTitle: model.teacherGroups![index].price.toString(),
                image: AppAssets().teacher,
              ),
            ),
          ),
        ],
      );
}
