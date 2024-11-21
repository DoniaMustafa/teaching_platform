import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/parent/presentation/manager/parents_to_request_cubit.dart';
import 'package:teaching/features/parent/presentation/widgets/build_search_of_parents.dart';

import '../../widgets/build_parent_item.dart';

class AddParentScreen extends StatefulWidget {
  const AddParentScreen({super.key});

  @override
  State<AddParentScreen> createState() => _AddParentScreenState();
}

class _AddParentScreenState extends State<AddParentScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ParentsToRequestCubit>().getParentsToAddRequest();
  }

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      statusBarColor: AppColors.mainAppColor,
      child: CustomSharedFullScreen(
        isBackIcon: true,
        anotherWidget: BuildSearchOfParents(),
        title: AppStrings().parents.trans,
        widget: Column(
          children: [
            40.vs,
            Expanded(
              child: BlocBuilder<ParentsToRequestCubit, CubitStates>(
                builder: (context, state) {
                  if (state is FailedState) {
                    return Center(
                      child: CustomErrorWidget(
                        onTap: () {
                          // context.read<ParentsCubit>().g();
                        },
                        message: state.message,
                      ),
                    );
                  }
                  if (state is LoadedState && state.data.isEmpty) {
                    return Center(child: const CustomEmptyWidget());
                  }
                  return CustomListView(
                      itemCount: state is LoadedState
                          ? state.data.length
                          : AppConstants.shimmerItems,
                      // shrinkWrap: true,
                      separatorWidget: (BuildContext context, int index) =>
                          20.vs,
                      axisDirection: Axis.vertical,
                      widget: (BuildContext context, int index) =>
                          state is LoadedState
                              ? CustomListTile(padding: getPadding(vertical: 15.h,horizontal: 20.w),
                                  isDivider: false,
                                  radius: 50.r,
                                  title: state.data[index].name,
                                  image:
                                      '${EndPoints.url}${state.data[index].profileImage}',
                                  onTap: () {
                                    // AppService()
                                    //     .getBlocData<TeacherDetailsCubit>()
                                    //     .getTeacherDetails(
                                    //     model: TeacherModel(
                                    //         teacherId: state.data[index].id!));
                                    // Routes.parentsDetailsRoute.moveTo;
                                  },
                                )
                              : CustomShimmer.fromRectangle(
                                  width: width,
                                  height: 90,
                                ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
