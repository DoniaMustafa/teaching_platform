import '../export/export.dart';

class BuildRatingBar extends StatefulWidget {
  BuildRatingBar({super.key, this.itemSize, this.itemCount, this.rate});
  final double? itemSize;

  final int? itemCount;

  double? rate;
  @override
  State<BuildRatingBar> createState() => _BuildRatingBarState();
}

class _BuildRatingBarState extends State<BuildRatingBar> {
  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: 0,
      minRating:0,
      direction: Axis.horizontal,
      // allowHalfRating: f,
      itemSize: widget.itemSize!,
      itemCount: widget.itemCount!,
      // itemPadding: getPadding(horizontal: 2.w),
      itemBuilder: (context, _) => const CustomIcon(
        icon: Icons.star,
        color: AppColors.accentYellow,
      ),
      onRatingUpdate: (rating) {
        setState(() {
          widget.rate = rating;
          debugPrint('rate >> ${widget.rate}');
        });
      },
    );
  }
}
