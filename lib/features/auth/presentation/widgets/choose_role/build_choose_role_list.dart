import '../../../../../core/export/export.dart';

class BuildChooseRoleList extends StatelessWidget {
  const BuildChooseRoleList(
      {super.key,
      required this.itemCount,
      required this.data,
      required this.onTap});
  final int itemCount;
  final void Function(int) onTap;
  final List<GenericModel> data;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const NeverScrollableScrollPhysics(),
      slivers: [
        SliverGrid(
          delegate: SliverChildBuilderDelegate(
              (context, index) => _buildRoleItem(data[index], index),
              childCount: itemCount),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 1.5 / 1.5),
        )
      ],
    );
  }

  Widget _buildRoleItem(GenericModel model, int index) => GestureDetector(
        onTap: () => onTap(index),
        child: Column(
          children: [
            CustomCard(
              borderColor: AppColors.divider.withOpacity(0.1),
              borderWidth: 1,
              height: 120.h,
              width: 118.w,
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 4),
                    color: AppColors.black.withOpacity(0.1),
                    blurRadius: 4)
              ],
              child: CustomNetworkImage.rectangle(
                  defaultAsset: '',
                  padding: getPadding(all: 22),
                  imageUrl: model.image!),
            ),
            17.vs,
            CustomTextWidget(
              text: model.title!,
              style:
                  getBoldTextStyle(fontSize: 16, color: AppColors.mainAppColor),
            )
          ],
        ),
      );
}
