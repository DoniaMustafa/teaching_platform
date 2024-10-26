import 'package:teaching/core/widget/common_widgets/custom_sared_full_screen.dart';
import 'package:teaching/features/notification/presentation/manager/notification_cubit.dart';
import 'package:teaching/features/notification/presentation/widgets/build_notification_item.dart';
import '../../../../core/export/export.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSharedFullScreen(
      title: AppStrings().notificationTitle.trans,
      widget: BlocBuilder<NotificationCubit, CubitStates>(
        builder: (context, state) {
          if (state is FailedState) {
            return CustomErrorWidget(message: state.message, onTap: () {});
          }
          if (state is LoadedState && state.data.isEmpty) {
            return const CustomEmptyWidget();
          }
          return CustomListView(
              axisDirection: Axis.vertical,
              shrinkWrap: true,
              separatorWidget: (context, index) => 20.vs,
              itemCount: state is LoadedState
                  ? state.data.length
                  : AppConstants.shimmerItems,
              widget: (context, index) => state is LoadedState
                  ? BuildNotificationItem(index: index

                ,
                      model: state.data[index],
                    )
                  : CustomShimmer.fromRectangle(
                      width: width,
                      height: 80.h,
                    ));
        },
      ),
    );
  }
}
