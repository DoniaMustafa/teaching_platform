import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/courses_groups/presentation/manager/coures_group_operation_cubit.dart';
import 'package:teaching/features/home/presentation/manager/groups_cubit.dart';

import '../manager/public_coures_group_cubit.dart';

class CustomSubjectList extends StatelessWidget {
  const CustomSubjectList({super.key, this.isPublicTeacher = false});
  final bool? isPublicTeacher;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 1.7 / 0.5,
        // height: 130.h,
        child: BlocBuilder<SubjectsCubit, CubitStates>(
          builder: (context, state) {
            if (state is FailedState) {
              return const SizedBox.shrink();
            }
            if (state is LoadedState && state.data.isEmpty) {
              return const SizedBox.shrink();
            }
            return CustomListView(
                padding: getPadding(top: 20.h, start: 10.w),
                itemCount: state is LoadedState
                    ? state.data.length
                    : AppConstants.shimmerItems,
                widget: (context, index) => state is LoadedState
                    ? _buildItem(state.data[index])
                    : Padding(
                        padding: getPadding(end: 5.w),
                        child: CustomShimmer.fromRectangle(
                          height: 120.h,
                          width: 125.w,
                        ),
                      ));
          },
        ));
  }

  _buildItem(PublicDataModel model) => GestureDetector(
        onTap: () {
          if (isPublicTeacher.isTrue) {
            AppService()
                .getBlocData<PublicCouresGroupCubit>()
                .getPublicGroupsCourses(subjectId: model.id);
          } else {
            if (AppService()
                    .getBlocData<CoursesGroupOperationCubit>()
                    .publicTapIndex ==
                0) {
              AppService()
                  .getBlocData<CoursesCubit>()
                  .getCourser(subjectId: model.id);
            } else {
              AppService()
                  .getBlocData<GroupsCubit>()
                  .getGroups(subjectId: model.id);
            }
          }
        },
        child: Column(
          children: [
            Expanded(
              child: CustomCard(
                  margin: getMargin(
                    horizontal: 5.w,
                  ),
                  backgroundColor: AppColors.mainAppColor.withOpacity(0.9),
                  padding: getPadding(vertical: 20.h, horizontal: 20.w),
                  child: CustomNetworkImage.rectangle(
                    imageUrl: '${EndPoints.url}${model.image!}',
                    // height: 40.h,
                    // width: 40.w,
                  )),
            ),
            5.vs,
            CustomTextWidget(
              text: model.name!,
              style: getRegularTextStyle(
                fontSize: 16,
              ),
            )
          ],
        ),
      );
}
