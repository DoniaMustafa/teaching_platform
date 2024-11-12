import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/auth/presentation/manager/countries/city_cubit.dart';

class BuildSignCountry extends StatefulWidget {
  BuildSignCountry({super.key, this.isProfile = false});
  static int? selectedCountryId;
  bool isProfile;

  @override
  State<BuildSignCountry> createState() => _BuildSignCountryState();
}

class _BuildSignCountryState extends State<BuildSignCountry> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.isProfile.isTrue) {
      context.read<CityCubit>().getCities(countryId: AppPrefs.user!.countryId!);
      BuildSignCountry.selectedCountryId = AppPrefs.user!.countryId!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountriesCubit, CubitStates>(
      builder: (context, state) {
        return Column(
          children: [
            ExpansionTileDropDown(
                isEnable: widget.isProfile.isTrue ? false : true,
                items: getItems(state),
                onSelected: (int id) {
                  if (widget.isProfile.isTrue) {
                    id = AppPrefs.user!.countryId!;
                    BuildSignCountry.selectedCountryId = id;
                  } else {
                    BuildSignCountry.selectedCountryId = id;
                    context.read<CityCubit>().getCities(
                        countryId: BuildSignCountry.selectedCountryId!);
                  }
                },
                title: widget.isProfile.isTrue
                    ? AppPrefs.user!.countryName!
                    : AppStrings().country.trans,
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
    );
  }

  List<PublicDataModel> getItems(CubitStates state) {
    if (state is LoadedState) return state.data;
    return [];
  }

  ListStatus getListStatus(CubitStates state) {
    if (state is FailedState) return ListStatus.listError;
    if (state is LoadedState) return ListStatus.listLoaded;
    return ListStatus.listLoading;
  }
}
