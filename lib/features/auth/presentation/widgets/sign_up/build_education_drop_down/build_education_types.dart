import '../../../../../../core/export/export.dart';

class BuildEducationMaterial extends StatefulWidget {
  BuildEducationMaterial({super.key});

  @override
  State<BuildEducationMaterial> createState() => _BuildEducationMaterialState();
}

class _BuildEducationMaterialState extends State<BuildEducationMaterial> {
  List<String> eduType = [
    'ابتدائي',
    'اعدادي',
    'ثانوي',
  ];

  String? eduTypeSelected;

  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      ExpansionTileDropDown(
      items: eduType,
      onSelected: (int id) {},
      title: AppStrings().material.trans,
      status:ListStatus.listLoaded,
    )

      ],
    );
  }
}
