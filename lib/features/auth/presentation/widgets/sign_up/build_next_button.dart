import '../../../../../core/export/export.dart';

class BuildNextButton extends StatelessWidget {
  const BuildNextButton({super.key, this.onTap, required this.text});

  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return   BlocBuilder<ErrorCubit, ErrorState>(

    builder: (context, state) {
        return CustomElevatedButton(
          // margin: getMargin(end: 23.w),
          // boxShadow:const [
          //   BoxShadow(
          //       color: AppColors.primaryShadow,
          //       blurRadius: 26,
          //       offset: Offset(0, 10))
          // ],
          radius: 10.r,
          onPressed: () => onTap!(),
          style: getBoldTextStyle(
              fontFamily: FontFamilies.elMessiriFamily,
              fontSize: 15,
              color: AppColors.white),
          text: text,
          // rightIcon: CustomCard(
          //     radius: 15.r,
          //     padding: getPadding(horizontal: 14.w, vertical: 6.2.h),
          //     margin: getPadding(end: 20.w),
          //     backgroundColor: AppColors.white,
          //     child: const CustomIcon(
          //       icon: Icons.arrow_forward_ios,
          //       size: 12,
          //     )),
          // width: 118.w,
        );
      },
    );
  }
}
