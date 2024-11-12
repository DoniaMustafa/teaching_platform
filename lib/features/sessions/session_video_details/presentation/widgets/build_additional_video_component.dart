import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/sessions/session_video_details/data/models/video_of_session_details_response_model.dart';
import 'package:teaching/features/sessions/session_video_details/presentation/manager/lessons_details/video_of_session_operation_cubit.dart';

class BuildAdditionalVideoComponent extends StatefulWidget {
   BuildAdditionalVideoComponent({super.key, required this.model});
  final VideoSessionsData model;

  @override
  State<BuildAdditionalVideoComponent> createState() => _BuildAdditionalVideoComponentState();
}

class _BuildAdditionalVideoComponentState extends State<BuildAdditionalVideoComponent> {
   double rate = 0;

   List<GenericModel> component = [
    GenericModel(
      title: AppStrings().rate.trans,
      icon: Icons.star,
    ),
    GenericModel(
      title: AppStrings().ask.trans,
      icon: Icons.announcement_sharp,
    ),
    GenericModel(
      title: AppStrings().save.trans,
      icon: Icons.bookmark,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return     SizedBox(
      width: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(component.length, (index) {
          return GestureDetector(
            onTap: () {
              switch (index) {
                case 0:
                  _showRateDialog(
                      context, widget.model.groupVideos![index]);
                  // isRate = !isRate;

                  setState(() {});
                case 2:
                  context
                      .read<FavoriteUnFavoriteVideoCubit>()
                      .addFavoriteUnFavoriteVideo(
                      isCourse: false,
                      videoId: context
                          .read<
                          VideoOfSessionOperationCubit>()
                          .videoId);
              }
            },
            child: Column(
              children: [
                BlocBuilder<FavoriteUnFavoriteVideoCubit,
                    CubitStates>(
                  builder: (context, state) {
                    return BlocBuilder<RateCubit, CubitStates>(
                      builder: (context, state) {
                        return Row(
                          children: [
                            // if (index == 0)
                            //   CustomTextWidget(
                            //     text:
                            //         '(${model..toString()})',
                            //     style: getRegularTextStyle(
                            //         fontSize: 12),
                            //   ),
                            CustomIcon(
                              icon: component[index].icon!,
                              color: index == 0
                                  ? context
                                  .read<RateCubit>()
                                  .isRate
                                  .isTrue
                                  ? AppColors.yellow
                                  : AppColors.textGrayColor1
                                  : index == 2
                                  ? context
                                  .read<
                                  FavoriteUnFavoriteVideoCubit>()
                                  .isFavorite
                                  .isTrue
                                  ? AppColors
                                  .mainAppColor
                                  : AppColors
                                  .grayTextColor
                                  : AppColors.mainAppColor,
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
                5.vs,
                CustomTextWidget(text: component[index].title!)
              ],
            ),
          );
        }),
      ),
    );
  }

   void _showRateDialog(context, SessionsGroupVideo model) {
     showCustomDialog(
         height: 340.h,
         context: context,
         style: getSemiboldTextStyle(
           fontSize: 18,
           color: AppColors.darkMainAppColor,
         ),
         title: AppStrings().rateNow.trans,
         widget: Expanded(
           child: Column(
             children: [
               20.vs,
               BuildRatingBar(
                 itemCount: 5,
                 itemSize: 35,
                 rate: rate,
                 onRate: (rating) {
                   rate = rating;
                 },
               ),
               20.vs,
               CustomElevatedButton(
                   margin: getMargin(horizontal: 20.w),
                   onPressed: () => AppService()
                       .getBlocData<RateCubit>()
                       .addVideoRate(
                       rate: rate.toInt(),
                       videoId: model.id,
                       isCourse: false),
                   text: AppStrings().done.trans)
             ],
           ),
         ));
   }
}
