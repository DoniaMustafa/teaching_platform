import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/sessions/session_video_details/presentation/manager/exam_video_of_session_operation_cubit.dart';

class BuildVideoTabsBar extends StatefulWidget {
  const BuildVideoTabsBar({super.key});

  @override
  State<BuildVideoTabsBar> createState() => _BuildVideoTabsBarState();
}

class _BuildVideoTabsBarState extends State<BuildVideoTabsBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
            AppListsConstant.sessionTabsBar.length,
                (index) =>
                BlocBuilder<TabBarOperationCubit, CubitStates>(
                  builder: (context, state) {
                    return Padding(
                      padding: getPadding(horizontal: 5.w),
                      child: GestureDetector(
                        onTap: () =>  context.read<TabBarOperationCubit>().onChangeTabIndex(index),
                        child: CustomTextWidget(
                          text: AppListsConstant.sessionTabsBar[index],
                          style: getBoldTextStyle(
                              fontSize: 16,
                              color: context.read<TabBarOperationCubit>().tapIndex == index
                                  ? AppColors.mainAppColor
                                  : AppColors.black),
                        ),
                      ),
                    );
                  },
                )),
      ),
    );
  }
}
