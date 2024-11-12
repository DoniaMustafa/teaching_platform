import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/subscriptions/subscription_details/presentation/widgets/build_my_favorite.dart';
import 'package:teaching/features/subscriptions/subscription_details/presentation/widgets/build_subscribe_course_details_component.dart';
import 'package:teaching/features/subscriptions/subscription_details/presentation/widgets/build_subscribe_list.dart';

class SubscriptionOfCourseDetailsScreen extends StatefulWidget {
  const SubscriptionOfCourseDetailsScreen({super.key});

  @override
  State<SubscriptionOfCourseDetailsScreen> createState() =>
      _SubscriptionScreenState();
}

class _SubscriptionScreenState
    extends State<SubscriptionOfCourseDetailsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // context.read<SubscriptionCubit>().getSubscription();
  }

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      statusBarColor: AppColors.mainAppColor,
      child: CustomSharedFullScreen(    isBackIcon: true,
        title: AppStrings().subscribeCourseDetails.trans,
        widget: Padding(
          padding: getPadding(horizontal: 10.w),
          child: Column(
            children: [
              BuildSubscribeCourseDetailsComponent(),
              10.vs,
              BuildMyFavorite(
                whichScreen: AppStrings().subscribeCourseDetails,
              ),
              2.vs,
              const BuildSubscribeList()
            ],
          ),
        ),
      ),
    );
  }
}
