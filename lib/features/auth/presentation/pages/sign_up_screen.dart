import '../../../../core/export/export.dart';

mixin SignUpScreenVariables {
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController identity = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String selectedCountry = '';
  int? selected;
  List<String>countries=['مصر','امارات','قصر','امارات'];
}

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
    with SignUpScreenVariables {
  @override
  Widget build(BuildContext context) {
    return BuildBackgroundWithAppBar(
      userType: SignUpByPhoneScreen.userType,
      child: _buildBody(context),
    );
  }

  Widget _buildBody(context) => Padding(
        padding: getPadding(horizontal: 13.w),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              3.vs,
              CustomImageWidget(
                asset: AppAssets().students,
                width: 170.w,
                height: 190.h,
              ),
              // 5.vs,
              _buildInputForms,
              200.vs,

              // if (SignUpByPhoneScreen.userType != 'parent')
              BuildNextButton(
                onTap: () {
                  // _formKey.currentState!.validate();
                  // if (AppService()
                  //     .getBlocData<ErrorCubit>()
                  //     .errors
                  //     .isEmpty) {
                  if (SignUpByPhoneScreen.userType != 'parent' &&
                      SignUpByPhoneScreen.userType != 'lecture') {
                    Routes.educationTypeRoute.moveTo;
                  } else if (SignUpByPhoneScreen.userType == 'lecture') {
                    Routes.uploadResumeRoute.moveTo;
                  }

                  // }
                },
                text: SignUpByPhoneScreen.userType == 'parent'
                    ? AppStrings().createAccount.trans
                    : AppStrings().continuation.trans,
              ),
              40.vs,
            ],
          ),
        ),
      );

  get _buildInputForms => Form(
        key: _formKey,
        child: Column(
          children: [
            NameWidget(
              controller: name,
            ),
            26.vs,
            PasswordWidget(
              controller: password,
            ),

            26.vs,
            EmailWidget(
              controller: email,
            ),
            26.vs,
            ExpansionTileDropDown(
              items: countries,
              onSelected: (int id) {},
              title: AppStrings().country.trans,
              status:ListStatus.listLoaded,
            ),

            // 26.vs,
            // ConfirmPasswordWidget(
            //   password: password,
            //   controller: confirmPassword,
            // ),
          ],
        ),
      );
}
