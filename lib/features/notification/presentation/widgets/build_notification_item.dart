import 'package:teaching/features/notification/data/models/notification_response_model.dart';
import 'package:teaching/features/notification/presentation/manager/notification_operation_cubit.dart';

import '../../../../core/export/export.dart';
import '../manager/notification_cubit.dart';

class BuildNotificationItem extends StatelessWidget {
  BuildNotificationItem({super.key, required this.model, required this.index});

  final NotificationDataModel model;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.topCenter,
      child: BlocBuilder<NotificationOperationCubit, CubitStates>(
        builder: (context, state) {
          // context.read<NotificationCubit>().isRead ;
          // print(context.read<NotificationCubit>().isRead);
          return GestureDetector(
            onTap: () => context
                .read<NotificationOperationCubit>()
                .getMarkNotificationAsRead(id: model.id!, index: index),
            child: CustomCard(
                backgroundColor: context
                        .read<NotificationOperationCubit>()
                        .isRead[index]
                        .isTrue
                    ? AppColors.white
                    : AppColors.unreadeGreyColor,
                margin: getMargin(
                  horizontal: 10.w,
                ),
                radius: 10.r,
                borderColor: AppColors.borderColor2,
                borderWidth: 0.5,
                padding: getPadding(horizontal: 15.w, vertical: 15.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomTextWidget(
                      text: model.createdAt!,
                      style: getRegularTextStyle(
                        height: 1,
                        fontSize: 12,
                        color: AppColors.mainAppColor,
                      ),
                    ),
                    8.vs,
                    CustomTextWidget(
                      text: model.text!,
                      // lines: null,
                      softWrap: true,
                      style: getRegularTextStyle(
                        fontSize: 14,
                        height: 1.4,
                        color: AppColors.black,
                      ),
                    ),
                  ],
                )),
          );
        },
      ),
    );
  }
}
