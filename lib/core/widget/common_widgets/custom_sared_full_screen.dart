import 'package:teaching/core/widget/common_widgets/build_shared_app_bar.dart';
import 'package:teaching/core/widget/common_widgets/custom_shared_body.dart';

import '../../export/export.dart';

class CustomSharedFullScreen extends StatelessWidget {
  const CustomSharedFullScreen(
      {super.key,
      required this.title,
      required this.widget,
      this.isBackIcon = false});
  final String title;
  final bool? isBackIcon;

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        BuildSharedAppBar(
          title: title,
          isBackIcon: isBackIcon!,
        ),
        CustomSharedBody(
          widget: widget,
        )
      ],
    );
  }
}
