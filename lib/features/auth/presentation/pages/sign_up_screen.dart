import 'package:teaching/features/auth/presentation/manager/countries_cubit.dart';

import 'package:teaching/features/auth/presentation/manager/countries_cubit.dart';

import '../../../../core/export/export.dart';
import '../../data/models/contry_response_model.dart';

mixin SignUpScreenVariables {
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController identity = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String selectedCountry = '';
  int? selected;
  List<String> countries = ['مصر', 'امارات', 'قصر', 'امارات'];
}

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
    with SignUpScreenVariables, SignUpByPhoneVariables {
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
              // BuildNextButton(
              //   onTap: () {
              //     // _formKey.currentState!.validate();
              //     // if (AppService()
              //     //     .getBlocData<ErrorCubit>()
              //     //     .errors
              //     //     .isEmpty) {
              //     if (SignUpByPhoneScreen.userType != 'Parent' &&
              //         SignUpByPhoneScreen.userType != 'lecture') {
              //       Routes.educationTypeRoute.moveTo;
              //     } else if (SignUpByPhoneScreen.userType == 'lecture') {
              //       Routes.uploadResumeRoute.moveTo;
              //     }

              // }
              // },
              //   text: SignUpByPhoneScreen.userType == 'parent'
              //       ? AppStrings().createAccount.trans
              //       : AppStrings().continuation.trans,
              // ),
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
            BlocBuilder<CountriesCubit, CubitStates>(
              builder: (context, state) {
                return Column(
                  children: [
                    ExpansionTileDropDown(
                      items: getItems(state),
                      onSelected: (int id) {},
                      title: AppStrings().country.trans,
                      status: getListStatus(state),
                    ),
                    BlocBuilder<ErrorCubit, ErrorState>(
                      builder: (context, state) {
                        return ErrorText(
                          showError: context
                              .read<ErrorCubit>()
                              .errors
                              .contains(Errors.CONFIRM_PASSWORD_ERROR),
                          text: getError[Errors.CONFIRM_PASSWORD_ERROR]!,
                        );
                      },
                    )
                  ],
                );
              },
            ),

            // 26.vs,
            // ConfirmPasswordWidget(
            //   password: password,
            //   controller: confirmPassword,
            // ),
          ],
        ),
      );

  List<CountryDataModel> getItems(CubitStates state) {
    if (state is LoadedState) return state.data;
    return [];
  }

  ListStatus getListStatus(CubitStates state) {
    if (state is FailedState) return ListStatus.listError;
    if (state is LoadedState) return ListStatus.listLoaded;
    if (state is LoadingState) return ListStatus.listLoading;
    return ListStatus.initial;
  }
}
