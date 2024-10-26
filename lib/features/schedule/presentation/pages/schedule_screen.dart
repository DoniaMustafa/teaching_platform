import 'package:teaching/features/schedule/presentation/manager/schedule_cubit.dart';
import 'package:teaching/features/schedule/presentation/widgets/build_schedule_selected_date.dart';

import '../../../../core/export/export.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSharedFullScreen(
        title: AppStrings().schedule.trans,
        widget: Column(
          children: [
            BuildScheduleSelectedDate(),
            Expanded(
                child: BlocBuilder<ScheduleCubit,CubitStates>(
                  builder: (context, state) {
                    if(state is FailedState){
                      return CustomErrorWidget(message: state.message, onTap:(){});
                    }
                    if(state is LoadedState && state.data.isEmpty){
                      return CustomEmptyWidget();
                    }

                    return CustomListView(
                        separatorWidget: (context, int index) => 15.vs,
                        itemCount: 5,
                        widget: (context, int index) =>
                            Row(
                              children: [
                                CustomCircleWidget(
                                  padding: getPadding(all: 0),
                                  width: 35.w,
                                  height: 35.h,
                                  alignment: AlignmentDirectional.center,
                                  child: CustomTextWidget(
                                    text: '${index + 1}',
                                    style: getRegularTextStyle(
                                        fontSize: 16, color: AppColors.white),
                                  ),
                                ),
                                10.hs,
                                Expanded(
                                  child: CustomCard(
                                    padding:
                                    getPadding(start: 20.w, vertical: 15.h),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                      children: [
                                        CustomTextWidget(
                                          text: 'من 20:30 الي 22:30',
                                          style: getSemiboldTextStyle(
                                              fontSize: 16,
                                              color: AppColors.black),
                                        ),
                                        5.vs,
                                        CustomTextWidget(
                                          text: 'لغة عربيه مجموعه عربي',
                                          style: getMediumTextStyle(
                                              fontSize: 14,
                                              color: AppColors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ));
                  },
                ))
          ],
        ));
  }
}
