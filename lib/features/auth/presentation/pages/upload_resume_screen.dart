
import '../../../../core/export/export.dart';

class UploadResumeScreen extends StatefulWidget {
  UploadResumeScreen({super.key});

  @override
  State<UploadResumeScreen> createState() => _UploadResumeScreenState();
}

class _UploadResumeScreenState extends State<UploadResumeScreen> {
  //Initial definition of radio button value
  @override
  Widget build(BuildContext context) {
    return BuildBackgroundWithAppBar(
      userType: SignUpByPhoneScreen.userType,
      child: Padding(
        padding: getPadding(horizontal: 20.w),
        child: Align(
          alignment: AlignmentDirectional.center,
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
              _buildUploadImage,
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

             const Spacer(
                flex: 1,
              ),
              _buildDoneButton,
              14.vs,
            ],
          ),
        ),
      ),
    );
  }

  get _buildUploadImage => BuildDottedBorder(
        child: Row(
          children: [
            CustomSvg(asset: AppAssets().upload),
            Expanded(
              child: Align(
                  alignment: Alignment.center,
                  child: CustomTextWidget(
                    text: AppStrings().browse.trans,
                    style: getRegularTextStyle(
                        fontSize: 16,
                        fontFamily: FontFamilies.dubaiFamily,
                        color: AppColors.mainAppColor),
                  )),
            )
          ],
        ),
      );



  get _buildDoneButton => CustomElevatedButton(
        onPressed: () => showCreateAccountDialog(context),
        text: AppStrings().createAccount.trans,
        radius: 10.r,
      );
}
