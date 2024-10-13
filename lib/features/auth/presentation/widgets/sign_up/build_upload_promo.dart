import 'package:teaching/core/managers/file_magager_cubit.dart';

import '../../../../../core/export/export.dart';

mixin BuildUploadPromoVariables {
  String? radioValue = AppListsConstant.promo[0];
  TextEditingController controller = TextEditingController();
  int selectedIndex = 0;
}

class BuildUploadPromoPart extends StatefulWidget {
  BuildUploadPromoPart({super.key});

  @override
  State<BuildUploadPromoPart> createState() => _BuildUploadPromoPartState();
}

class _BuildUploadPromoPartState extends State<BuildUploadPromoPart>
    with BuildUploadPromoVariables {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: CustomTextWidget(
            text: AppStrings().promoUpload.trans,
            style: getBoldTextStyle(
                fontSize: 16,
                fontFamily: FontFamilies.dubaiFamily,
                color: AppColors.darkMainAppColor),
          ),
        ),
        // 10.vs,
        _buildMultiChooseRadio,
        10.vs,
        _buildUploadVideo,
      ],
    );
  }

  get _buildMultiChooseRadio => Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
            AppListsConstant.promo.length,
            (index) => Padding(
                  padding: getPadding(end: 10.w),
                  child: Row(
                    children: [
                      Radio(
                          value: AppListsConstant.promo[index],
                          groupValue: radioValue,
                          onChanged: (value) {
                            radioValue = value!;
                            selectedIndex = index;
                            print(selectedIndex);
                            print(radioValue);
                            setState(() {});
                          }),
                      CustomTextWidget(
                        text: AppListsConstant.promo[index],
                        style: getRegularTextStyle(
                            fontSize: 16,
                            fontFamily: FontFamilies.outfitFamily),
                      )
                    ],
                  ),
                )),
      );

  get _buildUploadVideo {
    if (radioValue == 'Url') {
      return CustomTextFormField(
        controller: controller,
      );
    } else {
      return BlocBuilder<FileManagerCubit, CubitStates>(
        builder: (context, state) {
          return BuildDottedBorder(
            onTap: () => context.read<FileManagerCubit>().getVideo(),
            child: Padding(
              padding: getPadding(top: 26.h, bottom: 18.h),
              child: Row(
                children: [
                  // CustomSvg(asset: AppAssets().uploadVideo),
                  // 4.vs,
                  Expanded(
                    child: CustomTextWidget(
                      align: TextAlign.center,
                      text: context.read<FileManagerCubit>().video.isNotNull
                          ? context
                              .read<FileManagerCubit>()
                              .video!
                              .path
                              .split('/')
                              .last
                          : AppStrings().browse.trans,
                      style: getRegularTextStyle(
                          fontSize: 16,
                          fontFamily: FontFamilies.dubaiFamily,
                          color: AppColors.mainAppColor),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }
  }
}
