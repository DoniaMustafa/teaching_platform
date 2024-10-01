import '../../../../../core/export/export.dart';

class BuildNewRegister extends StatelessWidget {
  const BuildNewRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        CustomTextWidget(
          text: AppStrings().haveAccount.trans,
          style: getRegularTextStyle(color: AppColors.mainAppColor),
        ),
        5.hs,
        GestureDetector(
            onTap: () => Routes.chooseRoleRoute.moveTo,
            child: CustomTextWidget(
              text:AppStrings().createAccount.trans,
              style: getBoldTextStyle(color: AppColors.darkMainAppColor),
            )),
      ],
    );
  }
}
