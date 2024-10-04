import '../../../../../../core/export/export.dart';

mixin QualificationEducationVariables {
  List<String> qualification = ['خريج جامعي', 'طالب'];

  String qualified = '';

  int? selected;
}

class BuildQualificationEducationType extends StatefulWidget {
  BuildQualificationEducationType({super.key});

  @override
  State<BuildQualificationEducationType> createState() =>
      _BuildQualificationEducationTypeState();
}

class _BuildQualificationEducationTypeState
    extends State<BuildQualificationEducationType>
    with QualificationEducationVariables, SignUpByPhoneVariables  {
  @override
  Widget build(BuildContext context) {
    return ExpansionTileDropDown(
      items: qualification,
      onSelected: (int id) {},
      title: AppStrings().qualificationEducation.trans,
      status:ListStatus.listLoaded,
    );
  }
}
