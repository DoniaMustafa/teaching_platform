import 'package:teaching/core/widget/common_item_widgets/custom_item.dart';
import 'package:teaching/features/teacher/teachers/presentation/manager/teachers_of_parent_cubit.dart';

import '../../../../core/export/export.dart';

class BuildFeatures extends StatelessWidget {
  const BuildFeatures({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: getPadding(horizontal: 20.w),
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 20,
      mainAxisSpacing: 5,
      crossAxisCount: 2,
      shrinkWrap: true,
      childAspectRatio: 0.9 / 0.9,
      children: List.generate(AppListsConstant.parentFeaturesItems.length,
          (index) => _buildFeaturesItem(index)),
    );
  }

  Widget _buildFeaturesItem(int index) => GestureDetector(
        onTap: () {
          switch (index) {
            case 0:
              Routes.parentChildrenRoute.moveTo;
            case 1:
              AppService().getBlocData<TeachersOfParentCubit>()
                  .searchResult=null;
              Routes.teachersOfParentRoute.moveTo;
          }
        },
        child: CustomCard(
            boxShadow: [
              BoxShadow(
                  color: AppColors.black.withOpacity(0.1),
                  offset: Offset(0, 2),
                  blurRadius: 5),
            ],
            radiusDirectional: const BorderRadiusDirectional.only(
                topEnd: Radius.circular(15), bottomStart: Radius.circular(15)),
            borderColor: AppColors.textGrayColor1.withOpacity(0.2),
            borderWidth: 1,
            padding: getPadding(vertical: 15.h, horizontal: 20.w),
            backgroundColor: AppColors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomNetworkImage.rectangle(
                  width: 50.w,
                  height: 50.h,
                  imageUrl: AppAssets().parentFeaturesItems[index],
                ),
                20.vs,
                Expanded(
                    child: CustomTextWidget(
                  text: AppListsConstant.parentFeaturesItems[index].title!,
                  style: getBoldTextStyle(
                    fontSize: 16,
                    fontFamily: FontFamilies.abhayaLibreFamily,
                  ),
                ))
              ],
            )),
      );
}
