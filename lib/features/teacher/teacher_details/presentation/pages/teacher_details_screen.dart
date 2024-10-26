import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/course/courses_details/presentation/manager/courses_details/courses_details_cubit.dart';
import 'package:teaching/features/course/courses_details/presentation/pages/courses_details_screen.dart';
import 'package:teaching/features/group/groups_details/presentation/manager/group_details/group_details_cubit.dart';
import 'package:teaching/features/group/groups_details/presentation/pages/groups_details_screen.dart';
import 'package:teaching/features/teacher/teacher_details/presentation/manager/follow_teacher_cubit.dart';
import 'package:teaching/features/teacher/teacher_details/presentation/manager/review_teacher_cubit.dart';
import 'package:teaching/features/teacher/teacher_details/presentation/manager/teacher_details_cubit.dart';
import 'package:teaching/features/teacher/teacher_details/presentation/widgets/teacher_shimmer.dart';

class TeacherDetailsScreen extends StatelessWidget {
  TeacherDetailsScreen({super.key});
  List<String> teacherData = [];
  double rate = 0.0;
  @override
  Widget build(BuildContext context) {
    return CustomBackground(
        statusBarColor: AppColors.mainAppColor,
        child: CustomSharedFullScreen(
          isBackIcon: true,
          title: AppStrings().teachers.trans,
          widget: Container(
            padding: getPadding(
              horizontal: 10.w,
            ),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: BlocBuilder<TeacherDetailsCubit, CubitStates>(
                builder: (context, state) {
                  if (state is FailedState) {
                    return CustomErrorWidget(
                        message: state.message,
                        onTap: () => context
                            .read<TeacherDetailsCubit>()
                            .getTeacherDetails());
                  }
                  if (state is LoadedState) {
                    teacherData = [
                      state.data.subjects!,
                      state.data.grades!,
                      state.data.educationTypes!
                    ];
                    return _buildTeacherBody(state.data, context);
                  }
                  return const TeacherShimmer();
                },
              ),
            ),
          ),
        ));
  }

  Widget _buildTeacherBody(TeacherDetailsData data, context) => Column(
        children: [
          15.vs,
          Padding(
            padding: getPadding(horizontal: 10.h),
            child: Row(
              children: [
                const CustomIcon(
                  icon: Icons.info,
                  color: AppColors.mainAppColor,
                  size: 35,
                ),
                const Spacer(),
                BlocBuilder<FollowTeacherCubit, CubitStates>(
                  builder: (context, state) {
                    return GestureDetector(
                      onTap: () => context
                          .read<FollowTeacherCubit>()
                          .followingTeacher(
                              model: TeacherModel(teacherId: data.teacherId)),
                      child: CustomTextWidget(
                        text: context.read<FollowTeacherCubit>().isFollow.isTrue
                            ? AppStrings().unfollow.trans
                            : AppStrings().follow.trans,
                        style: getRegularTextStyle(
                            fontSize: 20,
                            color: AppColors.mainAppColor,
                            fontFamily: FontFamilies.outfitFamily),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
          10.vs,
          CustomNetworkImage.circular(
            imageUrl: '${EndPoints.url}${data.profileImage}',
            radius: 130.r,
          ),
          CustomTextWidget(
            text: data.teacherName!,
            style: getBoldTextStyle(
                fontSize: 20, color: AppColors.black.withOpacity(0.65)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 4,
                child: Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: BuildRatingBar(
                    rate: data.rate,
                    isIgnoreRate: true,
                    itemCount: 4,
                    itemSize: 25,
                  ),
                ),
              ),
              5.hs,
              Expanded(
                flex: 2,
                child: CustomTextWidget(
                  text: '(${data.reviewersCount})',
                  style: getBoldTextStyle(
                      fontSize: 10, color: AppColors.black.withOpacity(0.65)),
                ),
              ),
            ],
          ),
          5.vs,
          CustomTextWidget(
            text: '${data.followersCount} ${AppStrings().follower.trans}',
            style: getBoldTextStyle(
                fontSize: 14, color: AppColors.black.withOpacity(0.65)),
          ),
          10.vs,
          CustomElevatedButton(
            onPressed: () => _showRateDialog(context, data),
            text: AppStrings().rateNow.trans,
            margin: getMargin(
              horizontal: 150.w,
            ),
            style: getRegularTextStyle(
                fontSize: 16,
                color: AppColors.white,
                fontFamily: FontFamilies.interFamily),
            height: 35.h,
          ),
          10.vs,
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 10,
            children: List.generate(teacherData.length, (index) {
              return Chip(
                backgroundColor: AppColors.fillColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    side: const BorderSide(
                      color: AppColors.borderColor2,
                      width: 1,
                    )),
                label: CustomTextWidget(
                  text: teacherData[index],
                  style: getRegularTextStyle(fontSize: 12),
                ),
              );
            }),
          ),
          10.vs,
          Container(
            margin: getPadding(horizontal: 5.w),
            child: Column(
              children: [
                CustomListTile(
                  onTap: () {
                    AppService()
                        .getBlocData<CoursesDetailsCubit>()
                        .getCoursesDetails(
                            TeacherModel(teacherId: data.teacherId!));
                    Routes.coursesDetailsRoute.moveToWithArgs({
                      CoursesDetailsScreen.whichScreenKey:
                          AppStrings().teacherDetails,
                      CoursesDetailsScreen.teacherIdKey: data.teacherId!
                    });
                  },
                  height: height / 8.2,
                  title: AppStrings().coursesCount.trans,
                  subtitle:
                      '${data.coursesCount} ${AppStrings().course.trans} ',
                  isCircle: false,
                  r: 0,
                  image: AppAssets().coursesIcon,
                  isIcon: true,
                  padding: getPadding(horizontal: 10.w, vertical: 15.h),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 2),
                        color: AppColors.black.withOpacity(0.25),
                        blurRadius: 8)
                  ],
                ),
                10.vs,
                CustomListTile(
                    onTap: () {
                      AppService()
                          .getBlocData<GroupDetailsCubit>()
                          .getGroupDetails(teacherId: data.teacherId!);
                      Routes.groupsDetailsRoute.moveToWithArgs({
                        GroupsDetailsScreen.whichScreenKey:
                            AppStrings().teacherDetails,
                        // // CoursesDetailsScreen.subjectNameKey:
                        // // data.subjectId!,
                        GroupsDetailsScreen.teacherIdKey: data.teacherId!
                      });
                    },
                    r: 0,
                    height: height / 8.2,
                    title: AppStrings().groupsCount.trans,
                    subtitle:
                        '${data.groupsCount} ${AppStrings().groups.trans}',
                    isCircle: false,
                    image: AppAssets().coursesIcon,
                    isIcon: true,
                    padding: getPadding(horizontal: 10.w, vertical: 15.h),
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(0, 2),
                          color: AppColors.black.withOpacity(0.25),
                          blurRadius: 8)
                    ]),
                10.vs,
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomListTile(
                          r: 0,
                          height: height / 10.5,
                          title: AppStrings().workingHours.trans,
                          subtitle:
                              '${data.workingHours!.toInt()} ${AppStrings().hour.trans} ',
                          isCircle: false,
                          // image: AppAssets().coursesIcon,
                          // isIcon: true,
                          padding: getPadding(horizontal: 10.w, vertical: 15.h),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 2),
                                color: AppColors.black.withOpacity(0.25),
                                blurRadius: 8)
                          ]),
                    ),
                    10.hs,
                    Expanded(
                      child: CustomListTile(
                          r: 0,
                          title: AppStrings().subscriberCount.trans,
                          height: height / 10.5,
                          subtitle:
                              '${data.subscribersCount} ${AppStrings().subscriber.trans} ',
                          isCircle: false,
                          // image: AppAssets().coursesIcon,
                          // isIcon: true,
                          padding: getPadding(horizontal: 10.w, vertical: 15.h),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 2),
                                color: AppColors.black.withOpacity(0.25),
                                blurRadius: 8)
                          ]),
                    )
                  ],
                ),
              ],
            ),
          ),
          15.vs,
        ],
      );

  void _showRateDialog(context, TeacherDetailsData data) {
    showCustomDialog(
        height: 340.h,
        context: context,
        title: AppStrings().rateNow.trans,
        // content: ,
        widget: Expanded(
          child: Column(
            children: [
              CustomTextWidget(
                text:
                    '${AppStrings().ratesCount.trans} : ${data.reviewersCount}',
                style: getMediumTextStyle(
                  fontSize: 16,
                ),
              ),
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
                      .getBlocData<ReviewTeacherCubit>()
                      .addTeachersReview(
                          model: PostRateParamsModel(
                              teacherId: data.teacherId,
                              rate: rate.toInt(),
                              createdAt: DateTime.now(),
                              createdById: AppPrefs.user!.userId!)),
                  text: AppStrings().done.trans)
            ],
          ),
        ));
  }
}
