import 'package:easy_localization/easy_localization.dart';
import 'package:teaching/core/helper/toast_healper.dart';
import 'package:teaching/features/parent_children/presentation/widgets/build_children_drop_down_list.dart';
import 'package:teaching/features/parent_children/presentation/widgets/build_children_list.dart';
import 'package:teaching/features/schedule/presentation/manager/schedule_cubit.dart';

import '../../../../core/export/export.dart';

class BuildScheduleSelectedDate extends StatefulWidget {
  const BuildScheduleSelectedDate({super.key});

  @override
  State<BuildScheduleSelectedDate> createState() =>
      _BuildScheduleSelectedDateState();
}

class _BuildScheduleSelectedDateState extends State<BuildScheduleSelectedDate> {
  DateTime? pickedDate;
  late String pickedNow;
  late String date;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // pickedDate = DateTime.now();
    date = DateFormat("EEE M/d/y").format(DateTime.now());
    pickedNow = DateFormat("M/d/y").format(DateTime.now());
    if (AppPrefs.userRole == "1") {
      AppService()
          .getBlocData<ScheduleCubit>()
          .getSchedule(selectedDay: pickedNow);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.topCenter,
      child: CustomCard(
        boxShadow: [
          BoxShadow(
              color: AppColors.borderColor2.withOpacity(0.5),
              blurRadius: 5,
              offset: Offset(0.2, 0.5))
        ],
        margin: getMargin(horizontal: 10.w, top: 30.h, bottom: 20.h),
        radius: 10.r,
        borderColor: AppColors.borderColor2,
        borderWidth: 0.5,
        padding: getPadding(start: 15.w, end: 20.w, vertical: 20.h),
        child: Row(
          children: [
            CustomTextWidget(
              text: AppStrings().schedule.trans,
              style: getRegularTextStyle(
                height: 1,
                fontSize: 16,
                color: AppColors.black,
              ),
            ),
            5.hs,
            CustomTextWidget(
              text: date,
              style: getRegularTextStyle(
                fontSize: 16,
                color: AppColors.black,
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () async {
                pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2060),
                    selectableDayPredicate: (DateTime? dateTime) {
                      return true;
                    });

                pickedNow = DateFormat("M/d/y").format(pickedDate!);
                date = DateFormat("EEE M/d/y").format(pickedDate!);
                if (pickedDate.isNotNull) {
                  if (AppPrefs.userRole == "1" || AppPrefs.userRole == "7") {
                    AppService()
                        .getBlocData<ScheduleCubit>()
                        .getSchedule(selectedDay: pickedNow);
                  } else if (AppPrefs.userRole == "3") {
                    if (BuildChildrenDropDownList.childrenId == null) {
                      ToastHelper.buildToast(
                          text: 'الرجاء اختار الابن اولا',
                          tColor: ToastColors.ERROR);
                    } else {
                      AppService().getBlocData<ScheduleCubit>().getSchedule(
                          selectedDay: pickedNow,
                          studentId: BuildChildrenDropDownList.childrenId);
                    }
                  }
                }
                print(pickedDate);

                setState(() {});
              },
              child: const CustomIcon(
                icon: Icons.date_range,
                size: 25,
                color: AppColors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
