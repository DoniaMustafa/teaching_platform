import 'package:carousel_slider/carousel_slider.dart';
import 'package:teaching/core/widget/custom_empty_widget.dart';
import 'package:teaching/core/widget/custom_error_widget.dart';
import 'package:teaching/features/ads_details/presentation/manager/ads_details_cubit.dart';
import 'package:teaching/features/home/presentation/manager/ads_cubit.dart';
import 'package:teaching/features/home/presentation/widgets/shimmer/ads_shimmer.dart';

import '../../../../core/export/export.dart';

class BuildAdsList extends StatefulWidget {
  const BuildAdsList({super.key});

  @override
  State<BuildAdsList> createState() => _BuildAdsListState();
}

class _BuildAdsListState extends State<BuildAdsList> {
  int currentIndex = 0;

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
        return const SizedBox.shrink();
      }
      return _buildAdsSlider(state);
    });
  }

  Widget _buildAdsSlider(CubitStates state) => Column(
        children: [
          CarouselSlider.builder(
              itemCount: state is LoadedState
                  ? state.data.length
                  : AppConstants.nShimmerItems,
              itemBuilder: (context, index, realIndex) {
                if (state is LoadedState) {
                  return GestureDetector(
                    onTap: () {
                      currentIndex = index;
                      setState(() {});
                      context
                          .read<AdsDetailsCubit>()
                          .getAdvertisementsDetails(id: state.data[index].id);
                      Routes.adsDetailsRoute.moveTo;
                    },
                    child: CustomCard(
                      margin: getPadding(horizontal: 5.w),
                      backgroundColor: AppColors.lightPurple,
                      child: CustomNetworkImage.rectangle(
                        width: width,
                        imageUrl: '${EndPoints.url}${state.data[index].image}',
                        defaultAsset: AppAssets().professionalCourses,
                      ),
                    ),
                  );
                } else {
                  return const AdsShimmer();
                }
              },
              options: CarouselOptions(
                height: 150.h,
                viewportFraction: 1,
                initialPage: 0,
                enableInfiniteScroll: true,
                scrollPhysics: const BouncingScrollPhysics(),
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.easeOut,
                enlargeCenterPage: false,
                onPageChanged:
                    (int i, CarouselPageChangedReason changedReason) {
                  // BlocProvider.of<IndicatorCubit>(context).change(i);
                },
                scrollDirection: Axis.horizontal,
              )),
          10.vs,
          _buildDotInductor(state),
        ],
      );
  Widget _buildDotInductor(CubitStates state) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
            state is LoadedState ? state.data.length : 3,
            (index) => CustomCard(
              margin: getPadding(end: 3.w),
                  backgroundColor: currentIndex == index
                      ? AppColors.mainAppColor
                      : AppColors.profileDivider,
                  radius: 5,
                  height: 5,
                  width: currentIndex == index ? 10 : 5,
                )),
      );
}
