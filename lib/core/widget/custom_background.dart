import 'package:flutter/services.dart';
import 'package:teaching/config/routes/app_routes_helper.dart';

import '../export/export.dart';

class CustomBackground extends StatelessWidget {
  final Widget child;
  final bool showPadding;
  final Color statusBarColor;
  final bool extendBody;
  final Widget? widget;
  final bool showBack;
  final bool showSafeArea;
  final Color? backgroundColor;
  final Color? appbarColor;
  final Drawer? drawer;
  final Widget? bottomNavigationBar;
  final bool showAppbar;
  final bool showTitle;
  final EdgeInsetsGeometry? padding;
  final Key? scaffoldKey;
  const CustomBackground({
    required this.child,
    this.showPadding = true,
    this.extendBody = false,
    this.appbarColor,
    this.bottomNavigationBar,
    this.showBack = false,
    this.showTitle = false,
    this.showAppbar = false,
    this.showSafeArea = true,
    this.backgroundColor,
    this.widget,
    this.drawer,
    this.padding,
    this.scaffoldKey,
    this.statusBarColor = AppColors.white,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: statusBarColor,
        statusBarBrightness: statusBarColor.isEqualTo(AppColors.white) ||
                statusBarColor.isEqualTo(AppColors.fillColor)
            ? Brightness.dark
            : Brightness.light,
        statusBarIconBrightness: statusBarColor.isEqualTo(AppColors.white) ||
                statusBarColor.isEqualTo(AppColors.transparent) ||
                statusBarColor.isEqualTo(AppColors.fillColor)
            ? Brightness.dark
            : Brightness.light,
      ),
      child: Scaffold(
          drawer: drawer, drawerEnableOpenDragGesture: false,
          backgroundColor: backgroundColor,
          key: scaffoldKey,
          appBar: showAppbar.isTrue
              ? AppBar(
                  backgroundColor: appbarColor,
                  automaticallyImplyLeading: false,
                  titleSpacing: 0,
                  title: widget.isNotNull ? widget : const SizedBox.shrink(),
                  leading: showBack.isTrueGetWidget(GestureDetector(
                    onTap: () => pop(),
                    child: CustomIcon(
                      icon: Icons.arrow_back,
                      size: 20,
                      color: backgroundColor.isNotNull
                          ? AppColors.white
                          : AppColors.primaryColor,
                    ),
                    // child: CustomCircleWidget(
                    //   height: 20.h,
                    //   color: AppColors.primaryColor.withOpacity(0.4),
                    //   margin: getMargin(all: 17.w),
                    //   width: 27.h,
                    //   alignment: AlignmentDirectional.center,
                    //   padding: getPadding(end: 1.w),
                    //   radius: 5.r,
                    //   child:
                    // ),
                  )),
                )
              : null,
          extendBody: extendBody,
          body: buildChild,
          bottomNavigationBar: bottomNavigationBar),
    );
  }

  get buildChild => showSafeArea.isTrueGetWidgetOrAnotherWidget(
      SafeArea(child: child), child);
}
