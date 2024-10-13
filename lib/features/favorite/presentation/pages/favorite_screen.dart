import 'package:teaching/core/export/export.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
        showBack: true,
        statusBarColor: AppColors.statusBarColor,
        showSafeArea: true,
        backgroundColor: AppColors.white,
        appbarColor: AppColors.mainAppColor,
        widget: CustomTextWidget(
          text: 'My Favorite',
          style: getSemiboldTextStyle(color: AppColors.white, fontSize: 20),
        ),
        showAppbar: true,
        child: CustomListView(
          itemCount: 5,
          axisDirection: Axis.vertical,
          scroll: const BouncingScrollPhysics(),
          widget: (context, index) => CustomListTile(
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 2),
                  color: AppColors.black.withOpacity(0.25),
                  blurRadius: 8)
            ],
            isCircle: false,
            title: 'title title',
            subtitle: 'subtitle',
            spacer: 10,
            isIcon: false,
            image: '',
          ),
          separatorWidget: (context, index) => 15.vs,
        ));
  }
}
