import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/auth/presentation/manager/countries/city_cubit.dart';
import 'package:teaching/features/auth/presentation/manager/countries/region_cubit.dart';

class BuildSignCity extends StatelessWidget {
  BuildSignCity({super.key});
  static int? cityId;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CityCubit, CubitStates>(
      builder: (context, state) {
        return Column(
          children: [
            ExpansionTileDropDown(
                items: getItems(state),
                onSelected: (int id) {
                  cityId = id;
                  context.read<RegionCubit>().getRegion(cityId: cityId!);
                },
                title: AppStrings().city.trans,
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
