import 'package:teaching/core/export/export.dart';

class BuildRadioButton extends StatefulWidget {
  BuildRadioButton(
      {super.key,
      required this.groupValue,
      required this.onChanged,
      required this.items});
  String groupValue;
  Function(int) onChanged;
  final List<GenericModel> items;

  @override
  State<BuildRadioButton> createState() => _BuildRadioButtonState();
}

class _BuildRadioButtonState extends State<BuildRadioButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        widget.items.length,
        (index) => Expanded(
          child: RadioListTile(
              value: widget.items[index].title!,
              title: CustomTextWidget(
                text: widget.items[index].title!,
                style: getRegularTextStyle(fontSize: 14),
              ),
              groupValue: widget.groupValue,
              onChanged: (String? type) {
                widget.onChanged(index);
                widget.groupValue = type!;
                // widget.valueId = widget.items[index].id;
                // print(widget.valueId);
                setState(() {});
              }),
        ),
      ),
    );
  }
}
