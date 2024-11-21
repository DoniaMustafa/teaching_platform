import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/parent_children/presentation/manager/children_operation_cubit.dart';
import 'package:teaching/features/parent_children/presentation/manager/parent_children_cubit.dart';
import 'package:teaching/features/parent_children/presentation/widgets/build_children_drop_down_list.dart';
import 'package:teaching/features/parent_children/presentation/widgets/build_children_list.dart';
import 'package:teaching/features/parent_children/presentation/widgets/build_children_requstes_list.dart';
import 'package:teaching/features/teacher/teachers/presentation/manager/follwing_teachers_cubit.dart';

class FollowingTeachersScreen extends StatefulWidget {
  const FollowingTeachersScreen({super.key});

  @override
  State<FollowingTeachersScreen> createState() =>
      _FollowingTeachersScreenState();
}

class _FollowingTeachersScreenState extends State<FollowingTeachersScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<FollowingTeachersCubit>().getFollowingTeachers();
  }

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
        statusBarColor: AppColors.mainAppColor,
        child: CustomSharedFullScreen(
            title: AppStrings().followingTeachers.trans,
            isBackIcon: true,
            widget: BlocBuilder<FollowingTeachersCubit, CubitStates>(
                builder: (context, state) {
              if (state is FailedState) {
                return CustomErrorWidget(
                    message: state.message,
                    onTap: () {
                      context
                          .read<FollowingTeachersCubit>()
                          .getFollowingTeachers();
                    });
              }
              if (state is LoadedState && state.data.isEmpty) {
                return const CustomEmptyWidget();
              }
              return _buildListChildren(state);
            })));
  }

  Widget _buildListChildren(CubitStates state) => CustomListView(
      separatorWidget: (context, index) => 20.vs,
      padding: getPadding(top: 30.h, horizontal: 15.w),
      itemCount:
          state is LoadedState ? state.data.length : AppConstants.nShimmerItems,
      widget: (context, index) => state is LoadedState
          ? CustomListTile(
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 4),
                    blurRadius: 5,
                    color: AppColors.black.withOpacity(0.25))
              ],
              widget: GestureDetector(
                onTap: () {
                  // context.read<DeleteStudentCubit>().addStudentRequest(
                  //     studentId: state.data[index].studentId);
                },
                child: CustomCard(
                  padding: getPadding(vertical: 5.h, horizontal: 8.w),
                  backgroundColor: AppColors.red,
                  child: const CustomIcon(
                    icon: Icons.delete,
                    color: AppColors.white,
                  ),
                ),
              ),
              title: state.data[index].teacherName,
              padding: getPadding(horizontal: 20.w, vertical: 15.h),
              dividerHeight: height / 9,
              r: 0,
              image: '${EndPoints.url}${state.data[index].profileImage}',
              radius: 60.r,
              spacer: 8.w,
              isBorder: false,
            )
          : CustomShimmer(
              width: width,
              height: 60.h,
              borderRadius: BorderRadiusDirectional.circular(10.r),
            ));
}
