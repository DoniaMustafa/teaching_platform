import 'package:teaching/features/auth/presentation/manager/user_cubit/user_cubit.dart';

import '../../../../core/export/export.dart';

mixin SignUpByPhoneVariables {

  String userTypeAsString = '';

  final _formKey = GlobalKey<FormState>();
  TextEditingController phone = TextEditingController();
}

class SignUpByPhoneScreen extends StatelessWidget with SignUpByPhoneVariables {
  SignUpByPhoneScreen({super.key});
  static const String userTypeKey = 'userTypeKey';
  static const String userTypeIdKey = 'userTypeIdKey';
  static int? userId;
  static const String userTypeStringKey = 'userTypeStringKey';
  static String userType = '';
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? data = getArguments(context);
    if (data.isNotNull) {
      userType = data![userTypeKey];
      userTypeAsString = data[userTypeStringKey];
      userId = data[userTypeIdKey];
    }
    return CustomBackground(
      // userType: SignUpByPhoneScreen.userType,
      child: Align(
        alignment: AlignmentDirectional.center,
        child: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              20.vs,
              _buildTitleSubTitleImage,
              40.vs,
              _buildBody,
            ],
          ),
        ),
      ),
    );
  }

  get _buildTitleSubTitleImage => Column(
        children: [
          CustomTextWidget(
            text: '${AppStrings().welcomeTo.trans} ${AppStrings().appName}',
            style: getBoldTextStyle(
                height: 1,
                fontSize: 22,
                color: AppColors.darkMainAppColor,
                fontFamily: FontFamilies.elMessiriFamily),
          ),
          CustomTextWidget(
            text: EnumService.registerType(userType),
            style: getSemiboldTextStyle(
                color: AppColors.darkMainAppColor,
                fontSize: 16,
                fontFamily: FontFamilies.elMessiriFamily),
          ),
          40.vs,
          CustomImageWidget(
            asset: AppAssets().students,
            width: 170.w,
            height: 190.h,
          ),
        ],
      );
  get _buildBody => Padding(
        padding: getPadding(horizontal: 24.w),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: PhoneWidget(
                controller: phone,
              ),
            ),
            26.vs,
            BuildNextButton(
                onTap: () {
                  _formKey.currentState!.validate();
                  if (AppService().getBlocData<ErrorCubit>().errors.isEmpty) {
                    AppService().getBlocData<UserCubit>().registerByPhone(
                        user: UserModel(
                            phoneNumber: phone.text, userRole: '$userId'));
                  }
                },
                text: AppStrings().continuation.trans),
            26.vs,
            _buildSignBy,
            20.vs,
          ],
        ),
      );

  get _buildSignBy => Column(
        children: [
          Row(
            children: [
              const Expanded(child: CustomDivider()),
              20.hs,
              CustomTextWidget(
                text: AppStrings().orSignUp.trans,
                style: getRegularTextStyle(
                    color: AppColors.textGrayColor1,
                    fontSize: 16,
                    fontFamily: FontFamilies.elMessiriFamily),
              ),
              20.hs,
              const Expanded(child: CustomDivider()),
            ],
          ),
          26.vs,
          CustomElevatedButton(
            radius: 10.r,
            onPressed: () {},
            text:
                '${AppStrings().continueUsing.trans} ${AppStrings().google.trans}',
            color: AppColors.mintColor1,
            textColor: AppColors.mainAppColor,
            style: getSemiboldTextStyle(
              color: AppColors.darkMainAppColor,
              fontSize: 14,
              fontFamily: FontFamilies.elMessiriFamily,
            ),
          ),
          10.vs,
          CustomElevatedButton(
              color: AppColors.lightBlue,
              radius: 10.r,
              style: getSemiboldTextStyle(
                color: AppColors.white,
                fontSize: 14,
                fontFamily: FontFamilies.elMessiriFamily,
              ),
              onPressed: () {},
              text:
                  '${AppStrings().continueUsing.trans} ${AppStrings().facebook.trans}'),
          10.vs,
          CustomElevatedButton(
              color: AppColors.darkMainAppColor,
              style: getSemiboldTextStyle(
                color: AppColors.white,
                fontSize: 14,
                fontFamily: FontFamilies.elMessiriFamily,
              ),
              radius: 10.r,
              onPressed: () {},
              text:
                  '${AppStrings().continueUsing.trans} ${AppStrings().apple.trans}'),
          10.vs,
          CustomTextWidget(
            text: AppStrings().alreadyHaveAccount.trans,
            style: getRegularTextStyle(
                color: AppColors.darkMainAppColor,
                fontSize: 16,
                fontFamily: FontFamilies.elMessiriFamily),
          ),
        ],
      );
}
