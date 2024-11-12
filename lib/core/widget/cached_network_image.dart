import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:teaching/core/utils/app_assets.dart';

import '../export/export.dart';

class CustomNetworkImage extends StatelessWidget {
  String? imageUrl;
  String? defaultAsset;
  double? bordWidth;
  double? height;
  double? width;
  double? radius;
  bool? isCircle;
  EdgeInsetsGeometry? padding;
  CustomNetworkImage._internal();
  CustomNetworkImage.circular(
      {this.radius,
      required this.imageUrl,
      this.bordWidth,
      this.defaultAsset,
      super.key})
      : isCircle = true;
  CustomNetworkImage.rectangle(
      {this.height,
      this.width,
      this.radius,
      required this.imageUrl,
      this.bordWidth,
      this.defaultAsset,
      this.padding,
      super.key})
      : isCircle = false;

  @override
  Widget build(BuildContext context) {
    return isCircle!.isTrue ? buildCircularImage : buildRectangleImage;
  }

  get buildCircularImage => Container(
        height: radius,
        width: radius,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: bordWidth.isNotNull
                ? Border.all(width: bordWidth!, color: AppColors.white)
                : null),
        // radius: radius,
        child: imageUrl.validateNetworkAsset && imageUrl!.contains("svg").isTrue
            ? SvgPicture.network(
                imageUrl!,
                fit: BoxFit.fill,
                height: radius,
                width: radius,
              )
            : imageUrl.validateNetworkAsset
                ? CachedNetworkImage(
                    imageUrl: imageUrl!,
                    width: radius,
                    height: radius,
                    fit: BoxFit.fill,
                    placeholder: (context, url) => Center(
                      child: Lottie.asset(AppAssets().imageLoading),
                    ),
                    errorWidget: (context, url, error) =>
                        buildDefaultCircularAsset(defaultAsset),
                  )
                : buildDefaultCircularAsset(imageUrl),
      );
  get buildRectangleImage => Container(
        height: height,
        width: width,
        padding: padding,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          borderRadius:
              radius.isNotNull ? BorderRadius.circular(radius!) : null,
          border: bordWidth.isNotNull
              ? Border.all(width: bordWidth!, color: AppColors.white)
              : null,
        ),
        // radius: radius,
        child: imageUrl.validateNetworkAsset && imageUrl!.contains("svg").isTrue
            ? SvgPicture.network(
                imageUrl!,
                fit: BoxFit.fill,
              )
            : imageUrl.validateNetworkAsset
                ? CachedNetworkImage(
                    imageUrl: imageUrl!,
                    width: width,
                    fit: BoxFit.fill,

                    height: height,
                    // fit: BoxFit.fill,
                    placeholder: (context, url) => Center(
                      child: Lottie.asset(AppAssets().imageLoading),
                    ),
                    errorWidget: (context, url, error) =>
                        buildRectangleAsset(defaultAsset),
                  )
                : buildRectangleAsset(imageUrl),
      );
  buildDefaultCircularAsset(String? asset) => Container(
        color: AppColors.mainAppColor,
        child: asset.isNotNull
            ? asset.validateNetworkAsset && asset!.contains("svg").isTrue
                ? SvgPicture.asset(
                    asset,
                    height: radius,
                    width: radius,
                    fit: BoxFit.fill,
                  )
                : asset.validateNetworkAsset
                    ? CachedNetworkImage(imageUrl: asset!)
                    : Container(
                        height: radius,
                        width: radius,
                        decoration: BoxDecoration(
                            // color: AppColors.mainAppColor,
                            image: DecorationImage(
                                image: AssetImage(defaultAsset!),
                                fit: BoxFit.fill)),
                      )
            : Container(
                height: radius,
                width: radius,
                decoration: BoxDecoration(
                    // color: AppColors.mainAppColor,
                    image: DecorationImage(
                        image: AssetImage(defaultAsset!), fit: BoxFit.fill)),
              ),
      );
  buildRectangleAsset(String? asset) => Container(
        // color: AppColors.primaryColor,
        child: asset.isNotNull
            ? asset.validateNetworkAsset && asset!.contains("svg").isTrue
                ? SvgPicture.asset(
                    asset,
                    height: height,
                    width: width,
                    fit: BoxFit.fill,
                  )
                : asset.validateNetworkAsset
                    ? CachedNetworkImage(imageUrl: asset!)
                    : Container(
                        height: height,
                        width: width,
                        decoration: BoxDecoration(
                            // color: AppColors.primaryColor,
                            image: DecorationImage(
                                image: AssetImage(asset!), fit: BoxFit.fill)),
                      )
            : Container(
                height: height,
                width: width,
                decoration: BoxDecoration(
                    // color: AppColors.mainAppColor,
                    image: DecorationImage(
                        image: AssetImage(defaultAsset!), fit: BoxFit.fill)),
              ),
      );
}
