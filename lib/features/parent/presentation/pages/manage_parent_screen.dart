import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/parent/presentation/manager/parents_cubit.dart';
import 'package:teaching/features/parent/presentation/manager/parents_operation_cubit.dart';
import 'package:teaching/features/parent/presentation/manager/student_request_parents_cubit.dart';
import 'package:teaching/features/parent/presentation/widgets/build_parent_list.dart';
import 'package:teaching/features/parent/presentation/widgets/build_requests_of_parent_list.dart';

class ParentsScreen extends StatefulWidget {
  const ParentsScreen({super.key});

  @override
  State<ParentsScreen> createState() => _ParentsScreenState();
}

class _ParentsScreenState extends State<ParentsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((data) {
      context.read<ParentsCubit>().getParents();
      context.read<StudentRequestParentsCubit>().getRequestOfParents();
    });
  }

  Widget build(BuildContext context) {
    return CustomBackground(
      statusBarColor: AppColors.mainAppColor,
      child: CustomSharedFullScreen(isBackIcon: true,
        title: AppStrings().parent.trans,
        // anotherWidget: BuildCoursesAndGroupsSearchWidget(),
        widget: Column(
          children: [
            20.vs,
            _buildTabBar,
            _buildListOfParent,
            CustomElevatedButton(
                margin: getPadding(horizontal: 70.w),
                onPressed: () {
                  Routes.addParentRoute.moveTo;
                },
                text: AppStrings().addParent.trans),
          ],
        ),
      ),
    );
  }

  get _buildTabBar => BlocBuilder<ParentsOperationCubit, CubitStates>(
        builder: (context, state) {
          return CustomTabBar(
              onTap: (index) => context
                  .read<ParentsOperationCubit>()
                  .onChangeParentsIndex(index),
              text: AppListsConstant.parents,
              selectedIndex: context.read<ParentsOperationCubit>().parentsIndex
              // : context.read<CoursesGroupOperationCubit>().tapIndex,
              );
        },
      );
  get _buildListOfParent => Expanded(
        child: BlocBuilder<ParentsOperationCubit, CubitStates>(
          builder: (context, state) {
            if (context.read<ParentsOperationCubit>().parentsIndex == 0) {
              return const BuildParentList();
            } else {
              return const BuildRequestsOfParentList();
            }
          },
        ),
      );
}
