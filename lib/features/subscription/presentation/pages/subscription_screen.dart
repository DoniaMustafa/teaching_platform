import 'package:teaching/features/courses_groups/presentation/manager/coures_group_operation_cubit.dart';
import 'package:teaching/features/subscription/presentation/manager/subscriptipn_operation_cubit.dart';
import 'package:teaching/features/subscription/presentation/widgets/build_subscription_tab_bar.dart';
import 'package:teaching/features/subscription/presentation/widgets/build_subscription_tab_bar_view.dart';

import '../../../../core/export/export.dart';
import '../../../home/presentation/manager/subscription_cubit.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<SubscriptionCubit>().getSubscription();
    context.read<SubjectsCubit>().getSubjects();
  }

  @override
  Widget build(BuildContext context) {
    return CustomSharedFullScreen(
      title: AppStrings().mySubscriptions.trans,
      widget: Column(
        children: [
          CustomSubjectList(),
          20.vs,
          const BuildSubscriptionTabBar(),
          const BuildSubscriptionTabBarView(),
          BlocBuilder<SubscriptionOperationCubit, CubitStates>(
            builder: (context, state) {
              return CustomElevatedButton(
                  margin: getMargin(horizontal: 130.w),
                  onPressed: () {
                    switch (
                        context.read<SubscriptionOperationCubit>().tabIndex) {
                      case 0:
                        Routes.coursesGroupsRoute.moveTo;
                        context
                            .read<CoursesGroupOperationCubit>()
                            .onChangePublicTabIndex(0);
                        break;
                      case 1:
                        Routes.coursesGroupsRoute.moveTo;
                        context
                            .read<CoursesGroupOperationCubit>()
                            .onChangePublicTabIndex(1);
                        break;
                    }
                  },
                  text: context.read<SubscriptionOperationCubit>().tabIndex == 0
                      ? '${AppStrings().courses.trans} ${AppStrings().store.trans}'
                      : '${AppStrings().groups.trans} ${AppStrings().store.trans}');
            },
          ),
          10.vs,
        ],
      ),
    );
  }
}
