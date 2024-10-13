import 'dart:io';

import 'package:teaching/core/helper/custom_bootom_sheet.dart';
import 'package:teaching/core/managers/file_magager_cubit.dart';
import 'package:teaching/core/widget/custom_list_tile.dart';
import 'package:teaching/features/auth/data/models/post_params_resume_model.dart';
import 'package:teaching/features/auth/presentation/manager/user_cubit/user_cubit.dart';
import 'package:teaching/features/auth/presentation/pages/verification_screen.dart';

import '../../../../core/export/export.dart';

class UploadResumeScreen extends StatefulWidget {
  UploadResumeScreen({super.key});

  @override
  State<UploadResumeScreen> createState() => _UploadResumeScreenState();
}

class _UploadResumeScreenState extends State<UploadResumeScreen>
    with SignUpByPhoneVariables, BuildUploadPromoVariables {
  @override
  Widget build(BuildContext context) {
    return BuildBackgroundWithAppBar(
      userType: SignUpByPhoneScreen.userType,
      child: Padding(
        padding: getPadding(horizontal: 20.w),
        child: Align(
          alignment: AlignmentDirectional.center,
          child: SingleChildScrollView(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                3.vs,
                CustomImageWidget(
                  asset: AppAssets().students,
                  width: 170.w,
                  height: 190.h,
                ),
                15.vs,
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: CustomTextWidget(
                    text: AppStrings().uploadCV.trans,
                    style: getBoldTextStyle(
                        fontSize: 16,
                        fontFamily: FontFamilies.dubaiFamily,
                        color: AppColors.darkMainAppColor),
                  ),
                ),
                14.vs,
                _buildUploadCV,
                15.vs,
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: CustomTextWidget(
                    text: AppStrings().uploadLatestCertificate.trans,
                    style: getBoldTextStyle(
                        fontSize: 16,
                        fontFamily: FontFamilies.dubaiFamily,
                        color: AppColors.darkMainAppColor),
                  ),
                ),
                14.vs,
                _buildUploadImage,
                15.vs,
                BuildUploadPromoPart(),
                100.vs,
                _buildDoneButton,
                14.vs,
              ],
            ),
          ),
        ),
      ),
    );
  }

  get _buildUploadCV => BlocBuilder<FileManagerCubit, CubitStates>(
        builder: (context, state) {
          return BuildDottedBorder(
            onTap: () => context.read<FileManagerCubit>().getFile(),
            child: Row(
              children: [
                Expanded(
                  child: CustomTextWidget(
                    text: context.read<FileManagerCubit>().file.isNotNull
                        ? context.read<FileManagerCubit>().fileName!
                        : AppStrings().browse.trans,
                    align: TextAlign.center,
                    style: getRegularTextStyle(
                        fontSize: 16,
                        height: 2,
                        fontFamily: FontFamilies.dubaiFamily,
                        color: AppColors.mainAppColor),
                  ),
                ),
              ],
            ),
          );
        },
      );

  get _buildUploadImage => BlocBuilder<FileManagerCubit, CubitStates>(
        builder: (context, state) {
          return BuildDottedBorder(
            onTap: () => _showBottomSheet(context),
            child: Row(
              children: [
                Expanded(
                  child: CustomTextWidget(
                    text: context.read<FileManagerCubit>().image.isNotNull
                        ? context
                            .read<FileManagerCubit>()
                            .image!
                            .path
                            .split('/')
                            .last
                        : AppStrings().browse.trans,
                    align: TextAlign.center,
                    style: getRegularTextStyle(
                        fontSize: 16,
                        fontFamily: FontFamilies.dubaiFamily,
                        color: AppColors.mainAppColor),
                  ),
                ),
              ],
            ),
          );
        },
      );

  get _buildDoneButton => CustomElevatedButton(
        onPressed: () {
          if (context.read<FileManagerCubit>().file.isNotNull &&
              context.read<FileManagerCubit>().image.isNotNull &&
              (context.read<FileManagerCubit>().video.isNotNull ||
                  controller.text.isNotNull)) {
            context.read<UserCubit>().register(
                resumeModel: PostParamsResumeModel(
                    phoneNumber: VerificationScreen.phone,
                    certificate: context.read<FileManagerCubit>().image!.path,
                    cV: context.read<FileManagerCubit>().file!.path,
                    intro: selectedIndex == 1
                        ? controller.text
                        : context.read<FileManagerCubit>().video!.path,
                    isExternalLink: selectedIndex == 1 ? true : false),
                stepsNo: 4);
          }
        },
        text: AppStrings().createAccount.trans,
        radius: 10.r,
      );

  void _showBottomSheet(context) {
    CustomBottomSheet.showCustomBottomSheet(
        context: context,
        constraint: BoxConstraints(maxHeight: 189.h),
        content: CustomCard(
          child: Column(
            children: [
              16.vs,
              const Text('تحميل صورة شخصية'),
              16.vs,
              BlocBuilder<FileManagerCubit, CubitStates>(
                builder: (context, state) {
                  return GestureDetector(
                    onTap: () => context.read<FileManagerCubit>().getImage(),
                    child: CustomListTile(
                        title: 'المعرض',
                        isBorder: false,
                        style: getRegularTextStyle(
                          color: AppColors.heavyBlack,
                        )),
                  );
                },
              ),
              Padding(
                padding: getPadding(vertical: 20.h),
                child: CustomDivider(
                  color: AppColors.heavyBlack,
                  height: 1,
                  width: width,
                ),
              ),
              BlocBuilder<FileManagerCubit, CubitStates>(
                builder: (context, state) {
                  return GestureDetector(
                    onTap: () => context
                        .read<FileManagerCubit>()
                        .getImage(isCamera: true),
                    child: CustomListTile(
                      isBorder: false,
                      title: 'كاميرا',
                      style: getRegularTextStyle(
                        color: AppColors.heavyBlack,
                      ),
                    ),
                  );
                },
              ),
              const Spacer(),
              const CustomDivider()
            ],
          ),
        ),
        padding: getPadding(horizontal: 20.w));
  }
}
