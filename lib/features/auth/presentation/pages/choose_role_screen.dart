import 'package:teaching/features/auth/presentation/widgets/choose_role/build_choose_role_list.dart';

import '../../../../core/export/export.dart';

class ChooseRoleScreen extends StatelessWidget {
  const ChooseRoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
        showSafeArea: true,
        statusBarColor: AppColors.appBarTitleColor,
        child: Column(
          children: [
            const BuildChooseRoleAppBar(),
            48.vs,
            Expanded(
                child: BuildChooseRoleList(
              data: AppListsConstant.roles,
              itemCount: AppListsConstant.roles.length,
              onTap: (index) {
                if (AppListsConstant.roles[index].role == AppStrings().course) {
                  Routes.chooseProfessionalCourseRoute.moveTo;
                } else {
                  Routes.signUpPyPhoneRoutes.moveToWithArgs({
                    SignUpByPhoneScreen.userTypeKey:
                        AppListsConstant.roles[index].role,
                    // SignUpByPhoneScreen.userTypeIdKey:
                    //     AppListsConstant.roles[index].id,
                    SignUpByPhoneScreen.userTypeStringKey:
                        AppListsConstant.roles[index].title
                  });
                }
              },
            )),
          ],
        ));
  }
}
