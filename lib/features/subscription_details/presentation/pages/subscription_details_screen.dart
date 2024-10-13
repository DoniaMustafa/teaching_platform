import 'package:teaching/features/courses_groups/presentation/manager/coures_group_operation_cubit.dart';
import 'package:teaching/features/subscription/presentation/manager/subscriptipn_operation_cubit.dart';
import 'package:teaching/features/subscription/presentation/widgets/build_subscription_tab_bar.dart';
import 'package:teaching/features/subscription/presentation/widgets/build_subscription_tab_bar_view.dart';
import 'package:teaching/features/subscription_details/presentation/widgets/build_my_favorite.dart';
import 'package:teaching/features/subscription_details/presentation/widgets/build_subscribe_course_details_component.dart';
import 'package:teaching/features/subscription_details/presentation/widgets/build_subscribe_list.dart';

import '../../../../core/export/export.dart';
import '../../../home/presentation/manager/subscription_cubit.dart';

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
      child: CustomSharedFullScreen(
        title: AppStrings().coursesDetails.trans,
        widget: Padding(
          padding: getPadding(horizontal: 10.w),
          child: Column(
            children: [
              // BuildSubscribeCourseDetailsComponent()
              10.vs,
              const BuildMyFavorite(),
              2.vs,
              const BuildSubscribeList()
            ],
          ),
        ),
      ),
    );
  }
}
