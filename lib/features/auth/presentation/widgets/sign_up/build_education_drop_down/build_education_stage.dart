
import '../../../../../../core/export/export.dart';

class BuildEducationStage extends StatelessWidget {
   BuildEducationStage({super.key});
  List<String >stage=[];

  @override
  Widget build(BuildContext context) {
    return ExpansionTileDropDown(
      items: stage,
      onSelected: (int id) {},
      title: AppStrings().stage.trans,
      status:ListStatus.listLoaded,
    );

      }
}
