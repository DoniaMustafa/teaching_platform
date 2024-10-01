import 'package:teaching/core/enums.dart';

import '../../../../../../core/export/export.dart';

class BuildEducationCurriculum extends StatelessWidget {
   BuildEducationCurriculum({super.key});
List<String >curriculum=[];
  @override
  Widget build(BuildContext context) {
    return ExpansionTileDropDown(
     items: curriculum,
      onSelected: (int id) {},
      title: AppStrings().curriculum.trans,
      status:ListStatus.listLoaded,
      // onChanged: (curriculum) {}
    );
  }
}
