
import 'package:teaching/core/export/export.dart';
import 'package:teaching/core/widget/setting_item.dart';

class FilePickerDialog extends StatelessWidget {
  final bool isSelected;

  FilePickerDialog({this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isSelected)
            SettingItemWidget(
              title: AppStrings().removeImage,
              titleTextStyle: getRegularTextStyle(),
              leading: Icon(Icons.close, color: AppColors.primaryColor),
              onTap: () {
                pop(FileTypes.REMOVE);
              },
            ),
          SettingItemWidget(
            title: AppStrings().camera,
            titleTextStyle: getRegularTextStyle(),
            leading: Icon(Icons.camera_alt, color: AppColors.primaryColor),
            onTap: () {
              pop(FileTypes.CAMERA);
            },
          ),
          SettingItemWidget(
            title: AppStrings().gallery,
            titleTextStyle: getRegularTextStyle(),
            leading: const Icon(Icons.photo_library, color: AppColors.primaryColor),
            onTap: () {
              pop(FileTypes.GALLERY);
            },
          ),
        ],
      ),
    );
  }
}
