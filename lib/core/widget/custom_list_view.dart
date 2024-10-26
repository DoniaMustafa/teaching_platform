import 'package:teaching/core/widget/custom_divider.dart';

import '../export/export.dart';

class CustomListView extends StatelessWidget {
  const CustomListView(
      {super.key,
      required this.itemCount,
      required this.widget,
      this.shrinkWrap = false,
      this.padding,
        this.scroll=const BouncingScrollPhysics(),
      this.axisDirection = Axis.vertical,
      this.separatorWidget});
  final int itemCount;
  final Axis? axisDirection;
  final Widget? Function(BuildContext context, int index) widget;
  final Widget Function(BuildContext context, int index)? separatorWidget;
  final bool? shrinkWrap;
  final ScrollPhysics? scroll;
  final EdgeInsetsDirectional? padding;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        scrollDirection: axisDirection!,
        // primary: true,
        shrinkWrap: shrinkWrap!,
        physics:scroll ,
        padding: padding ?? getPadding(all: 10),
        itemBuilder: widget,
        separatorBuilder:
            separatorWidget ?? (context, index) => SizedBox.shrink(),
        itemCount: itemCount);
  }
}
