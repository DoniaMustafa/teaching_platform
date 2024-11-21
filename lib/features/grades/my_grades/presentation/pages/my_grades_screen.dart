import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/grades/my_grades/presentation/manager/my_grades_cubit.dart';
import 'package:teaching/features/grades/my_grades/presentation/widgets/my_grades_item.dart';
import 'package:teaching/features/parent_children/presentation/widgets/build_children_drop_down_list.dart';
import 'package:teaching/features/parent_children/presentation/widgets/build_children_list.dart';

class MyGradesScreen extends StatefulWidget {
  const MyGradesScreen({super.key});

  @override
  State<MyGradesScreen> createState() => _MyGradesScreenState();
}

class _MyGradesScreenState extends State<MyGradesScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (AppPrefs.userRole != "3") {
      context.read<MyGradesCubit>().getMyGrades();
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
        statusBarColor: AppColors.mainAppColor,
        child: CustomSharedFullScreen(
            isBackIcon: true,
            title: AppPrefs.userRole == "3"
                ? AppStrings().childrenGrades.trans
                : AppStrings().myGrades.trans,
            widget: Column(
              children: [
                20.vs,
                if (AppPrefs.userRole == "1")
                  CustomSubjectList(
                    isMyDegrees: true,
                    isCourse: false,
                  ),
                if (AppPrefs.userRole == "3")
                  BuildChildrenDropDownList(
                    isDegrees: true,
                  ),
                20.vs,
                Expanded(
                  child: BlocBuilder<MyGradesCubit, CubitStates>(
                    builder: (context, state) {
                      if (context.read<MyGradesCubit>().myDegrees.isNotNull) {
                        if (state is FailedState) {
                          return CustomErrorWidget(
                              message: state.message, onTap: () {});
                        }
                        if (state is LoadedState && state.data.isEmpty) {
                          return CustomEmptyWidget();
                        }
                        return CustomListView(
                          padding: getPadding(horizontal: 0, vertical: 10),
                          itemCount: state is LoadedState
                              ? state.data.length
                              : AppConstants.shimmerItems,
                          separatorWidget: (context, int index) =>
                              const CustomDivider(
                            height: 1,
                          ),
                          widget: (context, int index) => state is LoadedState
                              ? MyGradesItem(
                                  index: index,
                                  model: state.data[index],
                                )
                              : CustomShimmer(
                                  height: 150,
                                  width: width,
                                ),
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  ),
                )
              ],
            )));
  }
}
