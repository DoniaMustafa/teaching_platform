import 'package:teaching/features/auth/presentation/manager/user_cubit/user_cubit.dart';

import '../../../../core/export/export.dart';
import '../../../../custom_easy_localization.dart';

class BuildDrawer extends StatelessWidget implements Drawer {
  const BuildDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.white,
      child: CustomEasyLocalization(
        child: SafeArea(
          child: Column(
            children: [
              40.vs,

                GestureDetector(
                  onTap: () => Routes.profileRoute.moveTo,
                  child: CustomNetworkImage.circular(
                    imageUrl: '${EndPoints.baseUrl}${AppPrefs.user!.image}',
                    radius: 100.r,
                    defaultAsset: '',
                  ),
                ),
              10.vs,
              CustomTextWidget(
                text: AppPrefs.user!.name!,
                style: getSemiboldTextStyle(
                    fontSize: 18, fontFamily: FontFamilies.interFamily),
              ),
              12.vs,
              CustomCard(
                child: CustomTextWidget(
                  text: 'تبديل الحساب',
                  style: getSemiboldTextStyle(
                      fontSize: 14, color: AppColors.selectedColor),
                ),
              ),
              30.vs,
              _buildItems(context)
            ],
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement backgroundColor
  Color? get backgroundColor => throw UnimplementedError();

  @override
  // TODO: implement child
  Widget? get child => throw UnimplementedError();

  @override
  // TODO: implement clipBehavior
  Clip? get clipBehavior => throw UnimplementedError();

  @override
  // TODO: implement elevation
  double? get elevation => throw UnimplementedError();

  @override
  // TODO: implement semanticLabel
  String? get semanticLabel => throw UnimplementedError();

  @override
  // TODO: implement shadowColor
  Color? get shadowColor => throw UnimplementedError();

  @override
  // TODO: implement shape
  ShapeBorder? get shape => throw UnimplementedError();

  @override
  // TODO: implement surfaceTintColor
  Color? get surfaceTintColor => throw UnimplementedError();

  @override
  // TODO: implement width
  double? get width => throw UnimplementedError();
}

// Drawer buildDrawer() => ;
Widget _buildItems(context) => Column(
      children: List.generate(
          EnumService.userDrawerType(AppPrefs.userRole!, context).length,
          (index) {
        return GestureDetector(
          onTap: () =>
              EnumService.userDrawerType(AppPrefs.userRole!, context)[index]
                  .onTap!(),
          child: CustomCard(
              padding: getPadding(horizontal: 15.w, vertical: 12.h),
              child: Row(
                children: [
                  // CustomImageWidget(
                  //
                  //   asset: AppAssets().drawer[index],
                  //   width: 25.w,
                  //   height: 25.h,
                  // ),
                  10.hs,
                  BlocBuilder<LanguageCubit, LanguageState>(
                    builder: (context, state) {
                      return CustomTextWidget(
                        text: EnumService.userDrawerType(
                                AppPrefs.userRole!, context)[index]
                            .title!
                            .trans,
                        style: getMediumTextStyle(fontSize: 14),
                      );
                    },
                  ),
                  const Spacer(),
                  const CustomIcon(
                    icon: Icons.arrow_forward_ios,
                    size: 18,
                    color: AppColors.softBlack,
                  )
                ],
              )),
        );
      }),
    );
