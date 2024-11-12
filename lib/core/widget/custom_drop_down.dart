import 'package:teaching/core/enums.dart';

import '../export/export.dart';

class ExpansionTileDropDown<T> extends StatefulWidget {
  final void Function(int id) onSelected;
  final List<T> items;
  final bool isChildren;
  final ListStatus status;
  final String title;
  final List<int>? ids;
  final Color? borderColor;
  final Color? color;
  final bool isActiveText;
  final bool isEnable;
  final Color? unselectedColor;
  final TextStyle? titleStyle;
  final List<BoxShadow>? boxShadow;
  const ExpansionTileDropDown({
    required this.onSelected,
    required this.items,
    required this.title,
    required this.status,
    this.borderColor,
    this.ids,
    this.isEnable = true,
    this.isChildren = false,
    this.isActiveText = true,
    this.unselectedColor,
    this.boxShadow,
    this.titleStyle,
    this.color,
    super.key,
  });

  @override
  State<ExpansionTileDropDown> createState() => _ExpansionTileDropDownState();
}

class _ExpansionTileDropDownState extends State<ExpansionTileDropDown> {
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
          // leading: widget.leadingWidget.isNotNull ? widget.leadingWidget : null,
          /* expansion */
          visualDensity: VisualDensity.compact,
          dense: true,
          initiallyExpanded: isExpanded,
          /*padding*/ enabled: widget.isEnable,
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

          title: CustomTextWidget(
            text: widget.isActiveText.isTrue
                ? activeText.isNotEmpty
                    ? activeText
                    : widget.title
                : widget.title,
            style: widget.titleStyle ??
                getRegularTextStyle(
                  color: AppColors.darkMainAppColor,
                  fontSize: 16,
                ),
            lines: 1,
            overflow: TextOverflow.ellipsis,
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

        activeText = widget.isChildren.isTrue
            ? widget.items[index].studentName
            : widget.items[index].name;

        widget.onSelected(widget.isChildren.isTrue
            ? widget.items[index].studentId
            : widget.items[index].id);
        // if (widget.isActiveText.isFalse) {
        //   if (widget.ids!.contains(widget.items[index].id)) {
        //     widget.ids!.remove(widget.items[index].id);
        //   } else {
        //     widget.ids!.add(widget.items[index].id);
        //   }
        // }
        widget.isActiveText.isTrue ? isExpanded = false : isExpanded = true;
        setState(() {});
      },
      child: Container(
        padding: getPadding(vertical: 10, horizontal: 10),
        margin: getMargin(horizontal: 20, bottom: 15),
        decoration: BoxDecoration(
          color: widget.isActiveText.isFalse &&
                  widget.ids!.contains(widget.items[index].id).isTrue
              ? AppColors.mainAppColor
              : activeText ==
                      (widget.isChildren.isTrue
                          ? widget.items[index].studentName
                          : widget.items[index].name)
                  ? AppColors.mainAppColor
                  : widget.unselectedColor ?? AppColors.grey.withOpacity(0.1),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: CustomTextWidget(
                text: widget.isChildren.isTrue
                    ? widget.items[index].studentName
                    : widget.items[index].name,
                style: getRegularTextStyle(
                  fontSize: 15,
                  color: widget.isActiveText.isFalse &&
                          widget.ids!.contains(widget.items[index].id).isTrue
                      ? AppColors.white
                      : activeText ==
                              (widget.isChildren.isTrue
                                  ? widget.items[index].studentName
                                  : widget.items[index].name)
                          ? AppColors.white
                          : null,
                ),
                align: TextAlign.center,
              ),
            )
          ],
        ),
      ));
  get getTrailingWidget {
    if (widget.status == ListStatus.listError) {
      return const Icon(Icons.wifi_off_outlined);
    } else if (widget.status == ListStatus.listLoaded) {
      if (widget.items.isNotEmpty) {
        if (isExpanded.isTrue) {
          return const CustomIcon(
            icon: Icons.keyboard_arrow_down_outlined,
            color: AppColors.black,
            size: 17,
          );
        } else {
          return const CustomIcon(
            icon: Icons.keyboard_arrow_up_outlined,
            color: AppColors.black,
            size: 17,
          );
        }
      }
      if (isExpanded.isTrue) {
        return const CustomIcon(
          icon: Icons.keyboard_arrow_down_outlined,
          color: AppColors.black,
          size: 17,
        );
      } else {
        return const CustomIcon(
          icon: Icons.keyboard_arrow_up_outlined,
          color: AppColors.black,
          size: 17,
        );
      }
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
}
