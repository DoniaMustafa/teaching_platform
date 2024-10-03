import 'package:teaching/features/schedule/presentation/widgets/build_schedule_item.dart';

import '../../../../core/export/export.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSharedFullScreen(
        title: AppStrings().schedule.trans, widget: BuildScheduleItem()
        // CustomListView(
        //     axisDirection: Axis.vertical,
        //     shrinkWrap: true,
        //     itemCount: 20,
        //     widget: (context, index) => BuildScheduleItem()),
        );
  }
}
