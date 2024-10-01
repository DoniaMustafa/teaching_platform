import 'package:carousel_slider/carousel_slider.dart';
import 'package:teaching/core/widget/custom_empty_widget.dart';
import 'package:teaching/core/widget/custom_error_widget.dart';
import 'package:teaching/features/home/presentation/manager/ads_cubit.dart';
import 'package:teaching/features/home/presentation/widgets/shimmer/ads_shimmer.dart';

import '../../../../core/export/export.dart';

class BuildAdsList extends StatelessWidget {
  const BuildAdsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdsCubit, CubitStates>(builder: (context, state) {
      if (state is FailedState) {
        return CustomErrorWidget(
          onTap: () => context.read<AdsCubit>().getAds(),
          message: state.message,
        );
      }
      if (state is LoadedState && state.data.isEmpty) {
        return CustomEmptyWidget(
          // onTap: () => context.read<AdsCubit>().getAds(),
          // message: state.,
        );
      }
      return _buildAdsSlider(state);
    });
  }

  Widget _buildAdsSlider(CubitStates state) => CarouselSlider.builder(
      itemCount:
          state is LoadedState ? state.data.length : AppConstants.nShimmerItems,
      itemBuilder: (context, index, realIndex) {
        if (state is LoadedState) {
          return CustomCard(
            padding: getPadding(horizontal: 5.w),
            backgroundColor: AppColors.lightPurple,
            child: CustomNetworkImage.rectangle(
              width: width,
              imageUrl: state.data[index].image,
              defaultAsset: AppAssets().onlineLearning,
            ),
          );
        } else {
          return AdsShimmer();
        }
      },
      options: CarouselOptions(
        height: 150.h,
        viewportFraction: 0.9,
        // padEnds: true,
        // aspectRatio:0.6/0.4,
        initialPage: 0,
        // enlargeFactor: 0.2,
        enableInfiniteScroll: true,
        scrollPhysics: const BouncingScrollPhysics(),
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.easeOut,
        enlargeCenterPage: false,
        onPageChanged: (int i, CarouselPageChangedReason changedReason) {
          // BlocProvider.of<IndicatorCubit>(context).change(i);
        },
        scrollDirection: Axis.horizontal,
      ));
  // => BlocBuilder<AdsCubit, CubitStates>(
  //   builder: (context, state) {
  //     if (state is LoadedState) {
  //       if (state.data.isEmpty) {
  //         return const SizedBox.shrink();
  //       }
  //       return ;
  //     }
  //     return CarouselSlider.builder(
  //         itemCount: AppConstants.nShimmerItems,
  //         itemBuilder: (context, index, realIndex) => Padding(
  //           padding: getPadding(horizontal: 10.w),
  //           child: CustomShimmer.fromRectangle(
  //             borderRadius: BorderRadius.circular(8),
  //             height: 150.h,
  //             width: width,
  //           ),
  //         ),
  //         options: CarouselOptions(
  //           height: 150.h,
  //           viewportFraction: 0.97,
  //           padEnds: true,
  //           // enlargeFactor: 0.2,
  //           enableInfiniteScroll: true,
  //           scrollPhysics: const BouncingScrollPhysics(),
  //           autoPlay: true,
  //           autoPlayInterval: 5.seconds,
  //           autoPlayAnimationDuration: 5.seconds,
  //           autoPlayCurve: Curves.easeOut,
  //           enlargeCenterPage: false,
  //           onPageChanged: (int i, CarouselPageChangedReason changedReason) {
  //             BlocProvider.of<IndicatorCubit>(context).change(i);
  //           },
  //           scrollDirection: Axis.horizontal,
  //         ));
  //   },
  // );

  // Widget _buildDotIndicator() => BlocBuilder<AdsCubit, CubitStates>(
  //   builder: (context, state) {
  //     int count = AppConstants.nShimmerItems;
  //     if (state is LoadedState) {
  //       count = state.data.length;
  //     }
  //     return AdsIndicatorWidget(
  //       itemCount: count,
  //     );
  //   },
  // );
}
