import 'package:teaching/features/auth/presentation/manager/countries/countries_cubit.dart';
import 'package:teaching/features/auth/presentation/manager/education/education_cubit.dart';
import 'package:teaching/features/auth/presentation/manager/user_cubit/user_cubit.dart';
import 'package:teaching/features/auth/presentation/pages/verification_screen.dart';
import '../../../../core/export/export.dart';
import '../../data/models/contry_response_model.dart';

mixin SignUpScreenVariables {
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController identity = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  int? selectedCountryId;
  List<String> countries = ['مصر', 'امارات', 'قصر', 'امارات'];
}

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});
  static const String phoneKey = 'phoneKey';
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
    with SignUpScreenVariables {
  String phone = 'phone';

  @override
  void initState() {
    super.initState();
    context.read<CountriesCubit>().getCountries();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? data = getArguments(context);
    if (data.isNotNull) {
      phone = data![SignUpScreen.phoneKey];
    }
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
              120.vs,

              if (SignUpByPhoneScreen.userType != 'Parent')
                BuildNextButton(
                  onTap: () {
                    print(name.text);
                    print(VerificationScreen.phone);
                    print(email.text);
                    print(password.text);
                    print(selectedCountryId.toString());
                    _formKey.currentState!.validate();
                    if (AppService().getBlocData<ErrorCubit>().errors.isEmpty) {
                      AppService().getBlocData<UserCubit>().register(
                          stepsNo: 2,
                          user: UserModel(
                              phoneNumber: VerificationScreen.phone,
                              name: name.text,
                              email: email.text,
                              password: password.text,
                              countryId: selectedCountryId.toString()));

                      // if (SignUpByPhoneScreen.userType != AppStrings().parent &&
                      //     SignUpByPhoneScreen.userType !=
                      //         AppStrings().professionalLecturer) {
                      //   Routes.educationTypeRoute.moveTo;
                      // } else if (SignUpByPhoneScreen.userType ==
                      //         AppStrings().professionalLecturer ||
                      //     SignUpByPhoneScreen.userType ==
                      //         AppStrings().teacher) {
                      //   Routes.uploadResumeRoute.moveTo;
                      // }
                    }
                  },
                  text: SignUpByPhoneScreen.userType == 'Parent'
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
            BlocBuilder<CountriesCubit, CountriesState>(
              builder: (context, state) {
                return Column(
                  children: [
                    ExpansionTileDropDown(
                        items: getItems(state),
                        onSelected: (int id) {
                          selectedCountryId = id;
                          // context.read<EducationCubit>().getEducationPrograms(id: id);
                        },
                        title: AppStrings().country.trans,
                        status: getListStatus(state)),
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

  List<PublicDataModel> getItems(CountriesState state) {
    if (state is CountriesLoadedState) return state.date;
    return [];
  }

  ListStatus getListStatus(CountriesState state) {
    if (state is CountriesErrorState) return ListStatus.listError;
    if (state is CountriesLoadedState) return ListStatus.listLoaded;
    return ListStatus.listLoading;
  }
}
