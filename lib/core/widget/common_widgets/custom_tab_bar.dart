import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/subscription/presentation/manager/subscriptipn_operation_cubit.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar(
      {super.key,
      this.isDivider = true,
      this.text,
      this.onTap,
      this.selectedIndex});
  final List<String>? text;
  final void Function(int)? onTap;
  final int? selectedIndex;
  final bool? isDivider;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        // height: 50.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
              2,
              (index) => GestureDetector(
                    onTap: () => onTap!(index),
                    child: Column(
                      children: [
                        CustomTextWidget(
                          text: text![index],
                          style: getBoldTextStyle(
                              fontSize: 18,
                              color: selectedIndex == index
                                  ? AppColors.mainAppColor
                                  : AppColors.black),
                        ),
                        _buildDivider(index)
                      ],
                    ),
                  )),
        ));
  }

  Widget _buildDivider(int index) {
    if (isDivider.isTrue) {
      return Column(
        children: [
          if (selectedIndex == index) 5.vs,
          if (selectedIndex == index)
            CustomDivider(
              height: 4.h,
              color: AppColors.mainAppColor,
            )
        ],
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
