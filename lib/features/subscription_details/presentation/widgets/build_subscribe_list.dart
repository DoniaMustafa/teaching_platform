import '../../../../core/export/export.dart';
import '../../../../core/widget/custom_expansion_drop_down.dart';

class BuildSubscribeList extends StatelessWidget {
  const BuildSubscribeList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomListView(
          padding: getPadding(vertical: 20.h),
          itemCount: 10,
          shrinkWrap: true,
          axisDirection: Axis.vertical,
          scroll: const BouncingScrollPhysics(),
          separatorWidget: (context, index) => 15.vs,
          widget: (context, index) => _buildItem()),
    );
  }

  Widget _buildItem() => CustomExpansionDropDown(
        onSelected: (int id, int index) {},
        color: AppColors.white,
        borderColor: AppColors.transparent,
        asset: AppAssets().professionalCourses,
        isFree: false,
        items: [],
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 4),
              color: AppColors.black.withOpacity(0.25),
              blurRadius: 4)
        ],
        isSubscribed: true,
        subTitle: '10 Subscribe',
        title: 'Subscribe',
        status: ListStatus.listLoaded,
      );
}
