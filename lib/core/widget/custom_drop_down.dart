import 'package:teaching/core/enums.dart';

import '../export/export.dart';

class ExpansionTileDropDown<T> extends StatefulWidget {
  final void Function(int id) onSelected;
  final List<T> items;
  final ListStatus status;
  final String title;
  final Color? borderColor;
  final TextStyle? titleStyle;
  const ExpansionTileDropDown({
    required this.onSelected,
    required this.items,
    required this.title,
    required this.status,
    this.borderColor,
    this.titleStyle,
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
          color: AppColors.transparent,
          borderRadius: BorderRadius.circular(19.h),
          boxShadow: const [
            BoxShadow(
                color: AppColors.transparent, spreadRadius: 1, blurRadius: 1)
          ]),
      child: ExpansionTile(
          maintainState: true,
          key: GlobalKey(),
          /* expansion */
          visualDensity: VisualDensity.compact,
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
            side: BorderSide(color: AppColors.borderColor),
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
              Text(
                activeText.isNotEmpty ? activeText : widget.title,
                style: widget.titleStyle ??
                    getRegularTextStyle(
                      color: AppColors.darkMainAppColor,
                      fontSize: 14,
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
        activeText = widget.items[index].name;
        widget.onSelected(widget.items[index].id);
        isExpanded = false;
        setState(() {});
      },
      child: Container(
        padding: getPadding(vertical: 10, horizontal: 10),
        margin: getMargin(horizontal: 20, bottom: 15),
        decoration: BoxDecoration(
          color: activeText == widget.items[index].name
              ? AppColors.primaryColor
              : AppColors.grey.withOpacity(0.1),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.items[index].name,
              style: getRegularTextStyle(
                fontSize: 15,
                color: activeText == widget.items[index].name
                    ? AppColors.white
                    : null,
              ),
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ));
  get getTrailingWidget {
    if (widget.status == ListStatus.listError) {
      return const Icon(Icons.wifi_off_outlined);
    } else if (widget.status == ListStatus.listLoaded) {
      if (widget.items.isNotEmpty) {
        if (isExpanded.isTrue) {
          return const Icon(
            Icons.keyboard_arrow_down_outlined,
            color: AppColors.black,
          );
        } else {
          return const Icon(
            Icons.keyboard_arrow_up_outlined,
            color: AppColors.black,
          );
        }
      } else {
        return const SizedBox.shrink();
      }
    }
    return _buildLoadingTrailingWidget;
  }

  get _buildLoadingTrailingWidget => const SizedBox(
        height: 8,
        width: 8,
        child: CircularProgressIndicator(
          color: AppColors.darkMainAppColor,
        ),
      );
}
