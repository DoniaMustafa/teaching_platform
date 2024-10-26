import '../../../../core/export/export.dart';

class BuildNews extends StatelessWidget {
  const BuildNews({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: CustomListView( axisDirection: Axis.horizontal,
        separatorWidget: (context, index) => SizedBox(
          width: 20.w,
        ),
        itemCount: AppListsConstant.listOfStudentCategories.length,
        widget: (context, index) => CustomCard(
            boxShadow: [
              BoxShadow(
                  color: AppColors.black.withOpacity(0.1),
                  offset: Offset(0, 2),
                  blurRadius: 5),
            ],
            radius: 50.r,
            height: 20.h,
            width: 80.w,
            borderWidth: 1,borderColor: AppColors.textGrayColor1.withOpacity(0.2),
            // padding: getPadding(all: 15),
            backgroundColor: AppColors.white,
            child: Container()),
      ),
    );
  }
}
