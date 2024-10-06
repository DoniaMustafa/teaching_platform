import 'package:teaching/core/widget/shimmer_widget.dart';
import 'package:teaching/features/home/presentation/manager/school_cubit.dart';

import '../../../../core/export/export.dart';
import '../../../../core/widget/custom_empty_widget.dart';
import '../../../../core/widget/custom_error_widget.dart';
import '../manager/ads_cubit.dart';

class BuildNearSchool extends StatelessWidget {
  const BuildNearSchool({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 160.h,
        child: BlocBuilder<NearSchoolCubit, CubitStates>(
            builder: (context, state) {
          if (state is FailedState) {
            return CustomErrorWidget(
              onTap: () => context.read<NearSchoolCubit>().getNearSchool(),
              message: state.message,
            );
          }
          if (state is LoadedState && state.data.isEmpty) {
            return const SizedBox.shrink();
          }
          return CustomListView(
            separatorWidget: (context, index) => SizedBox(
              width: 20.w,
            ),
            itemCount: state is LoadedState
                ? state.data.length
                : AppConstants.nShimmerItems,
            widget: (context, index) {
              if (state is LoadedState) {
                return Column(
                  children: [
                    CustomCard(
                        width: 90.w,
                        height: 90.h,
                        borderWidth: 1,
                        boxShadow: [
                          BoxShadow(
                              color: AppColors.black.withOpacity(0.2),
                              offset: Offset(0, 2),
                              blurRadius: 5)
                        ],
                        radius: 10.r,
                        borderColor: AppColors.textGrayColor1.withOpacity(0.2),
                        padding: getPadding(vertical: 20.h, horizontal: 25.w),
                        backgroundColor: AppColors.white,
                        child: CustomNetworkImage.rectangle(imageUrl: state.data[index].image,defaultAsset: AppAssets().emptyImage,)),
                    8.vs,
                    Expanded(
                      child: CustomTextWidget(
                        text: state.data[index].name!,
                        style: getRegularTextStyle(
                            fontSize: 14,
                            fontFamily: FontFamilies.outfitFamily),
                      ),
                    )
                  ],
                );
              } else {
                return Column(
                  children: [
                    CustomShimmer.fromRectangle(
                      width: 90.w,
                      borderRadius: BorderRadiusDirectional.circular(10),
                      height: 90.h,
                    ),
                    10.vs,
                    CustomShimmer.fromRectangle(
                      width: 70.w,
                      height: 10.h,
                      borderRadius: BorderRadiusDirectional.circular(1),
                    ),
                  ],
                );
              }
            },
          );
        }));
  }
}
