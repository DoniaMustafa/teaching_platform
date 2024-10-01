import 'package:teaching/features/auth/presentation/widgets/choose_role/build_choose_role_list.dart';

import '../../../../core/export/export.dart';

class ChooseProfessionalCoursesScreen extends StatelessWidget {
  const ChooseProfessionalCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
        statusBarColor: AppColors.mainAppColor,
        child: Column(
          children: [
            const BuildChooseRoleAppBar(),
            40.vs,
            Expanded(
                child: BuildChooseRoleList(
              data: AppListsConstant.coursesRole,
              itemCount: AppListsConstant.coursesRole.length,
              onTap: (index) => Routes.signUpPyPhoneRoutes.moveToWithArgs({
                SignUpByPhoneScreen.userTypeKey:
                    AppListsConstant.coursesRole[index].role,
                SignUpByPhoneScreen.userTypeStringKey:
                    AppListsConstant.coursesRole[index].title,
              }),
            ))
          ],
        ));
  }
}
