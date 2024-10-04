import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/subscription/presentation/manager/subscriptipn_operation_cubit.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({super.key,  this.text, this.onTap, this.selectedIndex});
final List<String> ?text;
final void Function(int)? onTap;
  final int ?selectedIndex;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
              2,
              (index) => GestureDetector(
                onTap:()=>onTap!(index),
                child: Column(
                  children: [
                    CustomTextWidget(
                      text: text![index],
                      style: getSemiboldTextStyle(
                          fontSize: 18,
                          color: selectedIndex ==
                                  index
                              ? AppColors.mainAppColor
                              : AppColors.black),
                    ),
                    if (selectedIndex == index)5.vs,
                    if (selectedIndex == index)
                      CustomDivider(
                        height: 4.h,
                        color: AppColors.mainAppColor,
                      )
                  ],
                ),
              )),
        ));
  }
}
