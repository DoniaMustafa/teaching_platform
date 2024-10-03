import '../../../../core/export/export.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSharedFullScreen(
      title: AppStrings().chat.trans,
      widget: Column(
        children: [


        ],
      ),
      // CustomListView(
      //     axisDirection: Axis.vertical,
      //     shrinkWrap: true,
      //     itemCount: 20,
      //     widget: (context, index) => BuildScheduleItem()),
    );
  }
}
