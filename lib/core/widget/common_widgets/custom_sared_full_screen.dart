import 'package:teaching/core/widget/common_widgets/build_shared_app_bar.dart';
import 'package:teaching/core/widget/common_widgets/custom_shared_body.dart';

import '../../export/export.dart';

class CustomSharedFullScreen extends StatelessWidget {
  const CustomSharedFullScreen(
      {super.key,
        this.anotherWidget,
      required this.title,
      required this.widget,
      this.isBackIcon = false});
  final String title;
  final bool? isBackIcon;

  final Widget widget;
  final Widget? anotherWidget;
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      alignment: AlignmentDirectional.center,
      children: [
        BuildSharedAppBar(
          title: title,
          isBackIcon: isBackIcon!,
        ),
        Container(
          padding:  EdgeInsets.only(top:anotherWidget.isNotNull?20.h:0),
          child: CustomSharedBody(
            widget: widget,topMargin:anotherWidget.isNotNull?75.h:null ,
          ),
        ),
        if(anotherWidget.isNotNull)
          anotherWidget!,
      ],
    );
  }
}
