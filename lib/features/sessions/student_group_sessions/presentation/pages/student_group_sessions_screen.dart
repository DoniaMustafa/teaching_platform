import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/group/groups_details/presentation/widgets/build_group_details_component.dart';
import 'package:teaching/features/group/groups_details/presentation/widgets/group_details_shimmer.dart';
import 'package:teaching/features/sessions/student_group_sessions/data/models/sessions_of_group_response_model.dart';
import 'package:teaching/features/sessions/student_group_sessions/presentation/manager/sessions_of_group_cubit.dart';
import 'package:teaching/features/sessions/student_group_sessions/presentation/widgets/build_sessions_of_group.dart';
import 'package:teaching/features/sessions/student_group_sessions/presentation/widgets/build_sessions_tab_bar.dart';

class StudentGroupSessionsScreen extends StatelessWidget {
  StudentGroupSessionsScreen({super.key});
  static const String groupDetailsKey = 'groupDetailsKey';

  GroupDetailsDataModel? model;
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? data = getArguments(context);
    if (data.isNotNull) {
      model = data![StudentGroupSessionsScreen.groupDetailsKey];
    }
    return CustomBackground(
        statusBarColor: AppColors.mainAppColor,
        child: CustomSharedFullScreen(
          isBackIcon: true,
          title: AppStrings().groupDetails.trans,
          widget: Column(
            children: [
              20.vs,
              BuildGroupDetailsHeaderComponent(
                model: model!,
              ),
              20.vs,
              const BuildSessionsTabBar(),
              20.vs,
              Expanded(
                child: BlocBuilder<SessionsOfGroupCubit, CubitStates>(
                  builder: (context, state) {
                    if (state is FailedState) {
                      return CustomErrorWidget(
                          message: state.message,
                          onTap: () {
                            // context
                            //   .read<GroupDetailsCubit>()
                            //   .getGroupDetails(teacherId: 94);
                          });
                    } else if (state is LoadedState && state.data.isEmpty) {
                      return CustomEmptyWidget();
                    } else if (state is LoadedState) {
                      return BuildSessionsOfGroup(
                        model: state.data,
                      );
                    }
                    return SingleChildScrollView(
                      child: Column(
                        children: List.generate(
                          6,
                          (index) => Padding(
                            padding: getPadding(horizontal: 10.w, bottom: 10.h),
                            child: CustomShimmer.fromRectangle(
                              width: width,
                              height: 80.h,
                              borderRadius: BorderRadiusDirectional.circular(5),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
