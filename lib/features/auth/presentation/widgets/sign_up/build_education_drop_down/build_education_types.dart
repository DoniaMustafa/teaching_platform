import 'package:teaching/features/auth/presentation/manager/education/program/prgram_cubit.dart';

import '../../../../../../core/export/export.dart';
import '../../../../data/models/contry_response_model.dart';
import '../../../manager/education/education_cubit.dart';

class BuildEducationMaterial extends StatefulWidget {
  BuildEducationMaterial({super.key, this.eduId, this.isProfile = false});
  bool isProfile;
  int? eduId;
  @override
  State<BuildEducationMaterial> createState() => _BuildEducationMaterialState();
}

class _BuildEducationMaterialState extends State<BuildEducationMaterial> {
  int selected = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.isProfile.isTrue) {
      context.read<ProgramCubit>().getEducationPrograms(id: widget.eduId!);
      context.read<EducationCubit>().typeId=widget.eduId!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EducationCubit, EducationState>(
      builder: (context, state) {
        return Column(
          children: [
            ExpansionTileDropDown(
              isEnable: widget.isProfile.isTrue ? false : true,
              items: getItems(state),
              onSelected: (int id) {
                if (widget.isProfile.isTrue) {
                  id = widget.eduId!;
                  context.read<EducationCubit>().typeId = id;
                } else {
                  context.read<EducationCubit>().typeId = id;
                  print(context.read<EducationCubit>().typeId);
                  context.read<ProgramCubit>().getEducationPrograms(
                      id: context.read<EducationCubit>().typeId!);
                }
              },
              title: widget.isProfile.isTrue
                  ? AppPrefs.user!.educationTypeName!
                  : AppStrings().eduType.trans,
              status: getListStatus(state)!,
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
    );
  }

  List<PublicDataModel> getItems(EducationState state) {
    if (state is EducationTypeLoadedState) return state.data;
    return [];
  }

  ListStatus? getListStatus(EducationState state) {
    if (state is EducationTypeFailureState) return ListStatus.listError;
    // if (state is EducationTypeLoadedState) return ListStatus.listLoaded;
    if (state is EducationTypeLoadingState) return ListStatus.listLoading;
    return ListStatus.listLoaded;
  }
}
