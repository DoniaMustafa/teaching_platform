import 'dart:async';

// import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/near_school_details/data/models/near_school_details_model.dart';
// import 'package:teaching/features/near_school_details/presentation/manager/near_school_details_cubit.dart';
import 'package:teaching/features/near_school_details/presentation/widgets/build_school_shimmer.dart';

class NearSchoolDetailsScreen extends StatelessWidget {
  NearSchoolDetailsScreen({super.key});
  // final Completer<GoogleMapController> _controller =
  //     Completer<GoogleMapController>();
  //
  // CameraPosition? _kGooglePlex;

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
        statusBarColor: AppColors.mainAppColor,
        child: CustomSharedFullScreen(
            title: AppStrings().school.trans,
            isBackIcon: true,
            widget: BlocBuilder<NearSchoolDetailsCubit, CubitStates>(
              builder: (context, state) {
                if (state is FailedState) {
                  return CustomErrorWidget(
                    onTap: () {},
                    message: state.message,
                  );
                }
                if (state is LoadedState) {
                  // _kGooglePlex = CameraPosition(
                  //   target: LatLng(state.data.latitude, state.data.longitude),
                  //   zoom: 14.4746,
                  // );
                  return _buildBody(state.data);
                }
                return const BuildSchoolShimmer();
              },
            )));
  }

  Widget _buildBody(SchoolDetailsModel model) => Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Column(
            children: [
              40.vs,
              CustomTextWidget(
                text: AppService().getBlocData<LanguageCubit>().isEn
                    ? model.nameEn ?? ''
                    : model.name,
                style: getMediumTextStyle(
                    fontSize: 24, fontFamily: FontFamilies.interFamily),
              ),
              20.vs,
              // SizedBox(
              //   height: 200,
              //   // child: GoogleMap(
              //   //   mapType: MapType.hybrid,
              //   //   initialCameraPosition: _kGooglePlex!,
              //   //   onMapCreated: (GoogleMapController controller) {
              //   //     _controller.complete(controller);
              //   //   },
              //   // ),
              // ),
              20.vs,
              Padding(
                padding: getPadding(horizontal: 20.w),
                child: Column(
                  children: [
                    CustomTextWidget(
                      text: AppService().getBlocData<LanguageCubit>().isEn
                          ? model.descriptionEn ?? ''
                          : model.description,
                      style: getRegularTextStyle(
                          fontSize: 16, fontFamily: FontFamilies.interFamily),
                    ),
                    20.vs,
                    Row(
                      children: [
                        CustomTextWidget(
                          text: AppStrings().studentCount.trans,
                          style: getMediumTextStyle(
                              fontSize: 18,
                              fontFamily: FontFamilies.interFamily),
                        ),
                        const Spacer(),
                        CustomTextWidget(
                          text: model.studentCount.toString(),
                          style: getMediumTextStyle(
                              fontSize: 18,
                              fontFamily: FontFamilies.interFamily),
                        ),
                      ],
                    ),
                    20.vs,
                    Row(
                      children: [
                        CustomTextWidget(
                          text: AppStrings().ratting.trans,
                          style: getMediumTextStyle(
                              fontSize: 18,
                              fontFamily: FontFamilies.interFamily),
                        ),
                        const Spacer(),
                        BuildRatingBar(
                          isIgnoreRate: true,
                          rate: model.rate!.toDouble(),
                          itemSize: 25,
                          itemCount: 5,
                        )
                      ],
                    ),
                    30.vs,
                    CustomElevatedButton(
                      width: 100,
                        // margin: getPadding(horizontal: 20.w),
                        onPressed: () {
                          AppService()
                              .getBlocData<NearSchoolDetailsCubit>()
                              .launchMapsUrl(model.latitude!, model.longitude!);
                        },
                        text: AppStrings().location.trans)
                  ],
                ),
              )
            ],
          ),
          CustomElevatedButton(
              margin: getPadding(horizontal: 20.w),
              onPressed: () {},
              text: AppStrings().registerNow.trans)
        ],
      );
}
