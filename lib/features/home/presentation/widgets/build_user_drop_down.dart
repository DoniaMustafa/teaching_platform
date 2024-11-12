import 'package:teaching/core/export/export.dart';

class BuildUserDropDown extends StatefulWidget {
  BuildUserDropDown({super.key});

  @override
  State<BuildUserDropDown> createState() => _BuildUserDropDownState();
}

class _BuildUserDropDownState extends State<BuildUserDropDown> {


  @override
  Widget build(BuildContext context) {
    // selected = user[0];
    return Container(
      height: 40.h,
      decoration: BoxDecoration(
          color: AppColors.mainAppColor,
          borderRadius: BorderRadius.circular(10.r)),
      // child: PopupMenuButton(
      //   icon: CustomIcon(
      //     icon: Icons.keyboard_arrow_down_rounded,
      //     color: AppColors.white,
      //   ),
      //   onSelected: (value) {
      //     selected = value;
      //     setState(() {});
      //   },
      //   itemBuilder: (BuildContext bc) {
      //     return List.generate(
      //       user.length,
      //       (index) => PopupMenuItem(
      //         value: user[index],
      //         child: CustomTextWidget(
      //           text: user[index],
      //           style: getRegularTextStyle(
      //             fontSize: 14,
      //             color: AppColors.white,
      //           ),
      //         ),
      //       ),
      //     );
      //   },
      // ),
      // width: 120.w,
      // child: DropdownButton(
      //   borderRadius: BorderRadius.circular(5.r),
      //   isDense: true,
      //   dropdownColor: AppColors.mainAppColor,
      //   // style: getRegularTextStyle(
      //   //   fontSize: 12,
      //   //   color: AppColors.black,
      //   // ),
      //   iconEnabledColor: AppColors.white,
      //   alignment: AlignmentDirectional.center,
      //   padding: getPadding(top: 5.h, start: 8.w),
      //   value: selected,
      //   items: List.generate(
      //       user.length,
      //       (int index) => DropdownMenuItem(
      //             alignment: AlignmentDirectional.center,
      //             value: user[index],
      //             child: CustomTextWidget(
      //               text: user[index],
      //               style: getRegularTextStyle(
      //                 fontSize: 14,
      //                 color: AppColors.white,
      //               ),
      //             ),
      //           )),
      //   onChanged: (value) {
      //     selected = value!;
      //     setState(() {});
      //   },
      // ),
    );
    // items: user,
  }
}
