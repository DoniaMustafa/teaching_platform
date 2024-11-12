
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/ads_details/data/models/ads_details_model.dart';

class AdsDetailsScreen extends StatelessWidget {
  AdsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
        statusBarColor: AppColors.mainAppColor,
        child: CustomSharedFullScreen(
            title: AppStrings().adsDetails.trans,
            isBackIcon: true,
            widget: BlocBuilder<AdsDetailsCubit, CubitStates>(
              builder: (context, state) {
                if (state is FailedState) {
                  return CustomErrorWidget(
                    onTap: () {},
                    message: state.message,
                  );
                }
                if (state is LoadedState) {
                  return _buildBody(state.data);
                }
                return Column(
                  children: [
                    40.vs,
                    CustomShimmer(
                      width: 150,
                      height: 20,
                      borderRadius: BorderRadiusDirectional.circular(5),
                    ),
                    20.vs,
                    CustomShimmer(
                      width: width,
                      height: 200,
                      borderRadius: BorderRadiusDirectional.circular(5),
                    ),
                    20.vs,
                    CustomShimmer(
                      width: 300,
                      height: 20,
                      borderRadius: BorderRadiusDirectional.circular(5),
                    ),
                    5.vs,
                    CustomShimmer(
                      width: 300,
                      height: 20,
                      borderRadius: BorderRadiusDirectional.circular(5),
                    ),
                    5.vs,
                    CustomShimmer(
                      width: 300,
                      height: 20,
                      borderRadius: BorderRadiusDirectional.circular(5),
                    ),
                    5.vs,
                    CustomShimmer(
                      width: 300,
                      height: 20,
                      borderRadius: BorderRadiusDirectional.circular(5),
                    ),
                  ],
                );
              },
            )));
  }

  Widget _buildBody(AdsDetailsModel model) => Padding(
        padding: getPadding(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              40.vs,
              CustomTextWidget(
                text: model.name!,
                style: getRegularTextStyle(
                    fontSize: 18, fontFamily: FontFamilies.dubaiFamily),
              ),
              20.vs,
              CustomNetworkImage.rectangle(
                height: 200,
                imageUrl: '${EndPoints.url}${model.pathUrl}',
                defaultAsset: AppAssets().professionalCourses,
              ),
              20.vs,
              Padding(
                padding: getPadding(horizontal: 20.w),
                child: CustomTextWidget(
                  text: model.description!,
                  style: getRegularTextStyle(
                      fontSize: 16, fontFamily: FontFamilies.interFamily),
                ),
              ),
            ],
          ),
        ),
      );
}
