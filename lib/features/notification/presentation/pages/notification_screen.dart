import 'package:teaching/core/widget/common_widgets/custom_sared_full_screen.dart';
import 'package:teaching/features/notification/presentation/widgets/build_notification_item.dart';
import '../../../../core/export/export.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  CustomSharedFullScreen(
      title: AppStrings().notificationTitle.trans,
      widget:CustomListView(
          axisDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: 20,
          widget: (context, index) => BuildNotificationItem()),
    );
  }
}
