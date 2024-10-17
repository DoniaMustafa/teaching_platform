import '../export/export.dart';

class BuildRatingBar extends StatefulWidget {
  BuildRatingBar(
      {super.key,
      this.isIgnoreRate = false,
      this.itemSize,
      this.itemCount,
      this.onRate,
      this.rate});
  final double? itemSize;
  Function(double)? onRate;
  final int? itemCount;
  final bool isIgnoreRate;
  double? rate;
  @override
  State<BuildRatingBar> createState() => _BuildRatingBarState();
}

class _BuildRatingBarState extends State<BuildRatingBar> {
  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: widget.rate!,
      minRating: 0, ignoreGestures: widget.isIgnoreRate,
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
        if (widget.isIgnoreRate.isTrue) {
          widget.rate = rating;
          debugPrint('rate >> ${widget.rate}');
        } else {
          widget.onRate!(rating);
          debugPrint('rating >> $rating');
        }
        setState(() {});
      },
    );
  }
}
