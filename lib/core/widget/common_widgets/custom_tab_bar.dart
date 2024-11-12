import 'package:teaching/core/export/export.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar(
      {super.key,
      this.isDivider = true,
      this.fontSize,
        this.text, this.style,

        this.onTap,
      this.selectedIndex});
  final List<String>? text;
  final void Function(int)? onTap;
  final int? selectedIndex;
  final double? fontSize;
  final TextStyle? style;
  final bool? isDivider;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        // height: 50.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
              text!.length,
              (index) => GestureDetector(
                    onTap: () => onTap!(index),
                    child: Column(
                      children: [
                        CustomTextWidget(
                          text: text![index],
                          style: style??getBoldTextStyle(
                              fontSize: fontSize??18,
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
