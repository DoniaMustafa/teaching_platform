import '../export/export.dart';

class CustomTextFormField extends StatefulWidget {
  final String? label;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final FormFieldValidator<String>? validator;
  final String? prefixIcon;
  final String? suffixIcon;
  final int? maxLength;

  final String? hintText;
  final TextInputType? textInputType;
  final void Function(String?)? onSaved;
  final EdgeInsetsDirectional? contentPadding;
  final int? maxLines;
  final TextStyle? textStyle;
  final Widget? suffix;
  final BoxConstraints? suffixConstraints;
  final bool isPassword;
  final bool isFill;
  final FocusNode? focusNode;
  final TextDirection? textDirection;
  final TextAlign textAlign;
  final void Function()? onEditingComplete;
  final Future<String> Function()? onTap;
  final bool enabled;
  final bool? isCirclePrefixIcon;
  final int? minLines;
  final EdgeInsetsGeometry? padding;
  final bool isShadow;
  final Color? backColor;
  final double? r;
  final double startPadding;
  final double topPadding;
  final VoidCallback? suffixOnTap;
  final Color backGroundColor;
  final void Function(String)? onChanged;
  final TextStyle? hintStyle;
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final double? height;
  final double? width;
  final Widget? prefix;
  final bool showError;
  CustomTextFormField(
      {Key? key,
      this.controller,
      this.backGroundColor = AppColors.white,
      this.focusNode,
      this.prefix,
      this.showError = false,
      this.isFill = false,
      this.startPadding = 20,
      this.padding,
      this.topPadding = 0,
      this.backColor,
      this.keyboardType = TextInputType.text,
      this.textInputAction = TextInputAction.next,
      this.hintText,
      this.validator,
      this.textAlign = TextAlign.start,
      this.onSaved,
      this.prefixIcon,
      this.textDirection,
      this.isShadow = true,
      this.isPassword = false,
      this.label,
      this.height,
      this.maxLength,
      this.width,
      this.maxLines,
      this.isCirclePrefixIcon = false,
      this.border,
      this.enabledBorder,
      this.textInputType,
      this.contentPadding,
      this.textStyle,
      this.hintStyle,
      this.minLines,
      this.suffix,
      this.suffixConstraints,
      this.onEditingComplete,
      this.onTap,
      this.onChanged,
      this.enabled = true,
      this.suffixIcon,
      this.suffixOnTap,
      this.r})
      : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool hidePassword = true;
  @override
  Widget build(BuildContext context) {
    print("build custom aga9j");
    return Container(
      margin: widget.padding,
      child: TextFormField(
        style: widget.textStyle ??
            getBoldTextStyle(
              color: AppColors.black,
              fontFamily: FontFamilies.elMessiriFamily,
              // letterSpacing: context.locale.languageCode == AppLocalizationsConstants().enLanguage ? 2 : 0,
              fontSize: getFontSize(16),
            ),
        controller: widget.controller,
        focusNode: widget.focusNode,
        maxLines: widget.isPassword ? AppConstants.one : widget.maxLines,
        keyboardType: widget.isPassword
            ? TextInputType.visiblePassword
            : widget.textInputType,
        textInputAction: widget.textInputAction,
        minLines: widget.minLines,
        obscureText: widget.isPassword && hidePassword.isTrue,
        cursorColor: AppColors.gunsmoke,
        cursorWidth: 2,
        maxLength: widget.maxLength,
        obscuringCharacter: "*",
        onTap: () async {
          String? value = await widget.onTap?.call();
        },
        enabled: widget.enabled,
        textDirection: context.read<LanguageCubit>().isEn
            ? TextDirection.ltr
            : TextDirection.rtl,
        onChanged: (String value) {
          widget.onChanged?.call(value);
        },
        decoration: InputDecoration(
            filled: widget.isFill,
            fillColor: widget.isFill.isTrue ? AppColors.white : null,
            enabledBorder: widget.enabledBorder,
            focusedBorder: widget.enabledBorder,
            contentPadding: widget.contentPadding,
            labelText: widget.label,
            prefix: widget.prefix,
            hintText: widget.hintText,
            hintFadeDuration: 20.milliseconds,
            border: widget.border,
            suffixIconConstraints: widget.suffixConstraints,
            hintStyle: widget.hintStyle ??
                getRegularTextStyle(
                  color: AppColors.darkMainAppColor,
                  fontFamily: FontFamilies.elMessiriFamily,
                  fontSize: 14,
                ),
            suffixIcon: widget.isPassword
                ? buildSuffixPassword
                : widget.suffixIcon.isNotNull
                    ? GestureDetector(
                        onTap: widget.suffixOnTap,
                        child: Padding(
                          padding: getPadding(end: 10.w, vertical: 7.h),
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: AppColors.transparent,
                            child: CustomSvg(
                              asset: widget.suffixIcon!,
                              // matchTextDirection: true,
                            ),
                          ),
                        ),
                      )
                    : null,
            prefixIcon: widget.prefixIcon.isNotNull
                ? Padding(
                    padding: getPadding(horizontal: 15, vertical: 10),
                    child: CustomSvg(
                      asset: widget.prefixIcon!,
                      // matchTextDirection: true,
                    ),
                  )
                : null),
        validator: widget.validator,
        onSaved: widget.onSaved,
        onEditingComplete: widget.onEditingComplete,
      ),
    );
  }

  get buildSuffixPassword => GestureDetector(
        onTap: () {
          setState(() {
            hidePassword = !hidePassword;
          });
        },
        behavior: HitTestBehavior.translucent,
        child: hidePassword
            ? const Icon(
                Icons.visibility,
                color: AppColors.grey,
              )
            : const Icon(
                Icons.visibility_off,
                color: AppColors.grey,
              ),
      );
}
