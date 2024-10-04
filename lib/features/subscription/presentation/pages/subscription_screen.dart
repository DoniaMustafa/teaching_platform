import 'package:teaching/core/widget/common_widgets/custom_tab_bar.dart';
import 'package:teaching/features/subscription/presentation/manager/subscriptipn_operation_cubit.dart';
import 'package:teaching/features/subscription/presentation/widgets/custom_subject_list.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    return CustomSharedFullScreen(
      title: AppStrings().schedule.trans,
      widget: Column(
        children: [
         CustomSubjectList(label: 'لغة عربيه',onTap: (){},image:AppAssets().exam,),
          20.vs,
        const  BuildSubscriptionTabBar(),
         const BuildSubscriptionTabBarView(),
          BlocBuilder<SubscriptionOperationCubit, CubitStates>(
            builder: (context, state) {
              return CustomElevatedButton(
                  margin: getMargin(horizontal: 130.w),
                  onPressed: () {},
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
