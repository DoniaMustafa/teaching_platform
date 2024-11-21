import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/teacher/teachers/presentation/manager/teachers_of_student_cubit.dart';
import 'package:teaching/features/notes/presentation/manager/notes_cubit.dart';
import 'package:teaching/features/parent/presentation/manager/parents_to_request_cubit.dart';

class BuildSearchOfParents extends StatefulWidget {
  BuildSearchOfParents({
    super.key,
  });

  @override
  State<BuildSearchOfParents> createState() => _BuildSearchOfParentsState();
}

class _BuildSearchOfParentsState extends State<BuildSearchOfParents>
    with SearchVariables {
  @override
  Widget build(BuildContext context) {
    return PositionedDirectional(
      top: 50,
      end: 10,
      start: 10,
      child: BlocBuilder<ParentsToRequestCubit, CubitStates>(
        builder: (context, state) {
          return CustomTextFormField(
            border: const OutlineInputBorder(borderSide: BorderSide.none),
            enabledBorder:
                const OutlineInputBorder(borderSide: BorderSide.none),
            isFill: true,
            controller: parentController,
            onChanged: (String input) {
              parentController.text = input;

              setState(() {});
              context.read<ParentsToRequestCubit>().getParentsToAddRequest(
                  phoneNumber: parentController.text,
                  parentName: parentController.text);
            },
            boxShadow: [
              BoxShadow(
                  color: AppColors.black.withOpacity(0.20),
                  blurRadius: 4,
                  offset: const Offset(0, 4))
            ],
          );
        },
      ),
    );
  }
}
