
import '../../../../../core/export/export.dart';

class BuildAttachmentsWidget extends StatelessWidget {
  const BuildAttachmentsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomListView(
        shrinkWrap: true,
        axisDirection: Axis.vertical,
        itemCount: 5,
        separatorWidget: (context, index) => 20.vs,
        widget: (context, index) => _buildItem);
  }

  get _buildItem => CustomCard(

        boxShadow: [
          BoxShadow(
              color: AppColors.black.withOpacity(0.25),
              offset: Offset(0, 4),
              blurRadius: 4)
        ],
        padding: getPadding(horizontal: 10.w, vertical: 10.h),
        child: Row(
          children: [
            CustomNetworkImage.rectangle(
              imageUrl:
                  'https://e7.pngegg.com/pngimages/103/322/png-clipart-black-video-logo-video-icon-video-icon-angle-white-thumbnail.png',
              width: 50.w,
              height: 55.h,
            ),
            10.hs,
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextWidget(
                  text: 'الدرس الاول ',
                  style: getMediumTextStyle(fontSize: 18),
                ),
                CustomTextWidget(
                  text: '40 صفحة',
                  style: getRegularTextStyle(fontSize: 14),
                ),
              ],
            ))
          ],
        ),
      );
}
