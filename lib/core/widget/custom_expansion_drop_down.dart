import 'package:teaching/core/enums.dart';

import '../export/export.dart';

class CustomExpansionDropDown<T> extends StatefulWidget {
  final void Function(int id, int index) onSelected;
  final List<T> items;
  final ListStatus status;
  final String title;
  final String? subTitle;
  final bool? isSubscribed;
  final String? price;
  final String? discount;
  final String? currency;
  final String? currencyItem;
  final String? asset;
  final bool isFree;
  final Color? borderColor;
  final VoidCallback? onSubscribeCourse;
  final Function(int id, int index)? onSubscribeLesson;
  final Color? color;
  final Color? unselectedColor;
  final List<CourseLesson>? lesson;
  final TextStyle? titleStyle;
  final List<BoxShadow>? boxShadow;
  final Widget? leadingWidget;
  const CustomExpansionDropDown({
    required this.onSelected,
    required this.items,
    required this.title,
    required this.status,
    this.asset,
    this.currency,
    this.currencyItem,
    this.onSubscribeCourse,
    this.borderColor,
    this.onSubscribeLesson,
    this.subTitle,
    this.discount,
    this.isFree = true,
    this.price,
    this.lesson,
    this.isSubscribed = false,
    this.unselectedColor,
    this.leadingWidget,
    this.boxShadow,
    this.titleStyle,
    this.color,
    super.key,
  });

  @override
  State<CustomExpansionDropDown> createState() => _ExpansionTileDropDownState();
}

class _ExpansionTileDropDownState extends State<CustomExpansionDropDown> {
  int? selectedCountryId;
  String activeText = '';
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: widget.color ?? AppColors.transparent,
          borderRadius: BorderRadius.circular(19.h),
          boxShadow: widget.boxShadow ??
              const [
                BoxShadow(
                    color: AppColors.transparent,
                    spreadRadius: 1,
                    blurRadius: 1)
              ]),
      child: ExpansionTile(
          maintainState: true,
          key: GlobalKey(),
          // leading: widget.leadingWidget,
          /* expansion */
          visualDensity: VisualDensity.standard,
          dense: true,
          initiallyExpanded: isExpanded,
          /*padding*/
          tilePadding: getPadding(horizontal: 15.w, vertical: 7),
          childrenPadding: getPadding(vertical: 10.h),
          /*colors*/
          onExpansionChanged: (value) {
            isExpanded = value;
            print(isExpanded);
            setState(() {});
          },
          iconColor: AppColors.iconsGray,
          collapsedIconColor: AppColors.iconsGray,
          backgroundColor:
              AppColors.transparent, //whole widget color while expanding
          trailing: getTrailingWidget,
          collapsedBackgroundColor: AppColors.transparent, //collapse color
          minTileHeight: 0, //make min height 0
          // childrenPadding: getPadding(horizontal: 100),
          /*shapes*/
          collapsedShape: RoundedRectangleBorder(
            side:
                BorderSide(color: widget.borderColor ?? AppColors.borderColor),
            borderRadius: BorderRadius.circular(10.r),
          ), //collapse shape
          shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: widget.borderColor ?? AppColors.borderColor,
              ),
              borderRadius: BorderRadius.circular(
                  19.h)), //the whole widget shape while expanding

          title: Row(
            children: [
              if (widget.asset.isNotNull)
                SizedBox(
                  width: 60.w,
                  height: 48.h,
                  child: CustomSvg(asset: widget.asset!),
                ),
              10.hs,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                      text: activeText.isNotEmpty ? activeText : widget.title,
                      style: widget.titleStyle ??
                          getRegularTextStyle(
                            color: AppColors.darkMainAppColor,
                            fontSize: 16,
                          ),
                      lines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (widget.subTitle.isNotNull)
                      CustomTextWidget(
                        text: widget.subTitle!,
                        style: getRegularTextStyle(
                            fontSize: 14, color: AppColors.subTitleColor),
                      ),
                    if (widget.isSubscribed.isFalse) 5.vs,
                    if (widget.isSubscribed.isFalse)
                      Row(
                        children: [
                          CustomTextWidget(
                            text: widget.discount != '0.0'
                                ? '${widget.discount.toString()} ${widget.currency}'
                                : '${widget.price.toString()} ${widget.currency}',
                            style:
                                getBoldTextStyle(color: AppColors.mainAppColor),
                          ),
                          5.hs,
                          if (widget.discount != '0.0')
                            CustomTextWidget(
                              text:
                                  '${widget.price.toString()} ${widget.currency}',
                              style: getMediumTextStyle(
                                  fontSize: 14,
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor: AppColors.red,
                                  color: AppColors.profileDivider),
                            ),
                        ],
                      ),
                  ],
                ),
              ),
            ],
          ),
          children: List.generate(
            widget.items.length,
            (index) => buildExpandedItem(index),
          )),
    );
  }

  buildExpandedItem(int index) => GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        debugPrint("selected");

        widget.onSelected(widget.items[index].lessonId, index);
        isExpanded = false;
        setState(() {});
      },
      child: Container(
        padding: getPadding(vertical: 10, horizontal: 10),
        margin: getMargin(horizontal: 20, bottom: 15),
        decoration: const BoxDecoration(
          // color: AppColors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomCircleWidget(
              width: 30,
              height: 30,
              alignment: AlignmentDirectional.center,
              radius: 50,
              padding: getPadding(all: 0),
              child: CustomTextWidget(
                text: '${index + 1}',
                style:
                    getSemiboldTextStyle(fontSize: 16, color: AppColors.white),
              ),
            ),
            10.hs,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(
                    text: widget.items[index].lessonTitle,
                    lines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: getMediumTextStyle(
                      fontSize: 16,
                    ),
                  ),
                  3.vs,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CustomTextWidget(
                          text:
                              '${widget.items[index].videosCount.toString()} ${AppStrings().video.trans}',
                          style: getMediumTextStyle(
                            fontSize: 14,
                          )),
                      5.hs,
                      if (widget.lesson![index].isSubscribed.isFalse &&
                          widget.lesson![index].free.isFalse)
                        CustomTextWidget(
                          text:
                              '${widget.lesson![index].price.toString()} ${widget.lesson![index].currency!.contains("جنيه مصرى").isTrue ? AppStrings().egp.trans : ''}',
                          style: getRegularTextStyle(
                              fontSize: 14, color: AppColors.mainAppColor),
                        ),
                    ],
                  ),
                ],
              ),
            ),
            if (widget.isSubscribed.isFalse &&
                widget.lesson![index].free.isTrue)
              CustomTextWidget(
                text: AppStrings().free.trans,
                style: getRegularTextStyle(
                    fontSize: 16, color: AppColors.mainAppColor),
              ),
            if (widget.lesson![index].isSubscribed.isFalse &&
                widget.lesson![index].free.isFalse)
              GestureDetector(
                  onTap: () {
                    widget.onSubscribeLesson!(
                        widget.lesson![index].lessonId!, index);
                    print(widget.lesson![index].lessonId!);
                    print(index);
                  },
                  child: CustomTextWidget(text: AppStrings().subscribe.trans)),
            if (widget.lesson![index].isSubscribed.isTrue ||
                widget.lesson![index].free.isTrue)
              const CustomIcon(
                icon: Icons.play_circle_fill,
                color: AppColors.mainAppColor,
              )
          ],
        ),
      ));
  get getTrailingWidget {
    if (widget.status == ListStatus.listError) {
      return const Icon(Icons.wifi_off_outlined);
    } else if (widget.status == ListStatus.listLoaded) {
      if (widget.items.isNotEmpty) {
        if (widget.isSubscribed.isTrue) {
          if (isExpanded.isTrue) {
            return const CustomIcon(
              icon: Icons.keyboard_arrow_down_outlined,
              color: AppColors.black,
              size: 20,
            );
          } else {
            return const CustomIcon(
              icon: Icons.keyboard_arrow_up_outlined,
              color: AppColors.black,
              size: 20,
            );
          }
        } else if (widget.isSubscribed.isFalse) {
          if (isExpanded.isTrue) {
            return _buildSubscriptionTrailingWidgets(
                icon: Icons.keyboard_arrow_down_outlined);
          } else {
            return _buildSubscriptionTrailingWidgets(
                icon: Icons.keyboard_arrow_up_outlined);
          }
        }
      } else if (widget.items.isEmpty) {
        if (widget.isSubscribed.isFalse) {
          if (isExpanded.isTrue) {
            return _buildSubscriptionTrailingWidgets(
                icon: Icons.keyboard_arrow_down_outlined);
          } else {
            return _buildSubscriptionTrailingWidgets(
                icon: Icons.keyboard_arrow_up_outlined);
          }
        }
      }

      return const SizedBox.shrink();
    } else if (widget.status == ListStatus.listLoading) {
      return _buildLoadingTrailingWidget;
    }
    return ListStatus.listLoaded;
  }

  get _buildLoadingTrailingWidget => const SizedBox(
        height: 8,
        width: 8,
        child: CircularProgressIndicator(
          color: AppColors.darkMainAppColor,
        ),
      );

  Widget _buildSubscriptionTrailingWidgets({required IconData icon}) =>
      SizedBox(
        width: context.read<LanguageCubit>().isEn ? 95.w : 80.w,
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: widget.onSubscribeCourse,
                child: CustomTextWidget(
                  text: AppStrings().subscribe.trans,
                  style: getMediumTextStyle(
                      fontSize: context.read<LanguageCubit>().isEn ? 14 : 18),
                  lines: 1,
                  textScalar: const TextScaler.linear(1),
                ),
              ),
            ),
            5.hs,
            CustomIcon(
              icon: icon,
              color: AppColors.black,
              size: 20,
            ),
          ],
        ),
      );
}
