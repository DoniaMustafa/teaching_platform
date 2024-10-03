import 'package:teaching/core/widget/common_widgets/build_shared_app_bar.dart';
import 'package:teaching/core/widget/common_widgets/custom_shared_body.dart';

import '../../export/export.dart';

class CustomSharedFullScreen extends StatelessWidget {
  const CustomSharedFullScreen({super.key, required this.title, required this.widget});
  final String title;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        BuildSharedAppBar(title:  title,),
          CustomSharedBody(widget:widget ,)
      ],
    );
  }
}
