import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/favorite/data/models/favorite_videos_response_model.dart';
import 'package:teaching/features/favorite/presentation/manager/favorite_video_courses_cubit.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    super.initState();
    context.read<FavoriteVideoCoursesCubit>().getFavoriteVideoCourses();
  }

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
        showBack: true,
        statusBarColor: AppColors.statusBarColor,
        showSafeArea: true,
        backgroundColor: AppColors.white,
        appbarColor: AppColors.mainAppColor,
        widget: CustomTextWidget(
          text: 'My Favorite',
          style: getSemiboldTextStyle(color: AppColors.white, fontSize: 20),
        ),
        showAppbar: true,
        child: BlocBuilder<FavoriteVideoCoursesCubit, CubitStates>(
          builder: (context, state) {
            if (state is FailedState) {
              return CustomErrorWidget(message: state.message, onTap: () {});
            }
            if (state is LoadedState && state.data.isEmpty) {
              return CustomEmptyWidget();
            }
            return CustomListView(
              itemCount: state is LoadedState
                  ? state.data.length
                  : AppConstants.shimmerItems,
              axisDirection: Axis.vertical,
              scroll: const BouncingScrollPhysics(),
              widget: (context, index) {
                return state is LoadedState
                    ? buildItem(state.data[index])
                    : CustomShimmer.fromRectangle(
                        height: 80.h,
                        width: width,
                        borderRadius: BorderRadiusDirectional.circular(10.r),
                      );
              },
              separatorWidget: (context, index) => 15.vs,
            );
          },
        ));
  }

  buildItem(FavoriteVideoData data) => CustomListTile(
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 2),
              color: AppColors.black.withOpacity(0.25),
              blurRadius: 8)
        ],
        isCircle: false,
        title: data.title!,
        subtitle: data.courseName,
        spacer: 10,
        isIcon: false,
        image: '${EndPoints.url}${data.videoUrl}',
      );
}
