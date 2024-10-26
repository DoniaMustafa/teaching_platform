import 'package:teaching/core/export/export.dart';

class BookingDateScreen extends StatelessWidget {
  const BookingDateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
        statusBarColor: AppColors.mainAppColor,
        child: CustomSharedFullScreen(
          isBackIcon: true,
          title: AppStrings().bookDate.trans,
          widget: Padding(
            padding: getPadding(horizontal: 20.w),
            child: Column(
              children: [
                30.vs,
                ExpansionTileDropDown(
                    onSelected: (
                      int id,
                    ) {},
                    items: [],
                    title: 'title',
                    status: ListStatus.listLoaded),
                20.vs,
                Row(
                  children: List.generate(
                    2,
                    (index) => Expanded(
                      child: RadioListTile(
                          value: 'value',
                          title: CustomTextWidget(text: 'فرد'),
                          groupValue: () {},
                          onChanged: (index) {}),
                    ),
                  ),
                ),
                10.vs,
                Row(
                  children: List.generate(
                    2,
                    (index) => Expanded(
                      child: RadioListTile(
                          value: 'value',
                          title: CustomTextWidget(text: 'فرد'),
                          groupValue: () {},
                          onChanged: (index) {}),
                    ),
                  ),
                ),
                10.vs,
                Row(
                  children: [
                    CustomIcon(
                      icon: Icons.access_time_outlined,
                    ),
                    5.hs,
                    CustomTextWidget(text: 'مدة الاشتراك'),
                  ],
                ),
                15.vs,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    4,
                    (index) => CustomCard(
                      alignment: AlignmentDirectional.center,
                      padding: getPadding(horizontal: 30.w),
                      borderWidth: 1,
                      borderColor: AppColors.mainAppColor,
                      child:
                          CustomTextWidget(text: index.isEven ? 'حصة' : 'فرد'),
                    ),
                  ),
                ),
                const Spacer(),
                CustomElevatedButton(
                    onPressed: () {}, text: AppStrings().bookDate.trans),
                20.vs,
              ],
            ),
          ),
        ));
  }
}
