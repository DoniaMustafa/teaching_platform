import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/subscription/presentation/manager/subscriptipn_operation_cubit.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({super.key,  this.text});
final String ?text;
// final
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
              2,
              (index) => BlocBuilder<SubscriptionOperationCubit, CubitStates>(
                    builder: (context, state) {
                      return GestureDetector(
                        onTap: () => context
                            .read<SubscriptionOperationCubit>()
                            .onChangeTabIndex(index),
                        child: Column(
                          children: [
                            CustomTextWidget(
                              text: index == 0
                                  ? AppStrings().myCourses
                                  : AppStrings().myGroups,
                              style: getSemiboldTextStyle(
                                  fontSize: 18,
                                  color: context
                                              .read<
                                                  SubscriptionOperationCubit>()
                                              .tabIndex ==
                                          index
                                      ? AppColors.mainAppColor
                                      : AppColors.black),
                            ),
                            if (context
                                    .read<SubscriptionOperationCubit>()
                                    .tabIndex ==
                                index)
                              5.vs,
                            if (context
                                    .read<SubscriptionOperationCubit>()
                                    .tabIndex ==
                                index)
                              CustomDivider(
                                height: 4.h,
                                color: AppColors.mainAppColor,
                              )
                          ],
                        ),
                      );
                    },
                  )),
        ));
  }
}
