import 'package:flutter/cupertino.dart';
import 'package:grape_customer_app/domain/core/l10n/app_localizations.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';

class ImageChooserDialog {
  showImageChooserDialog({
    required VoidCallback takePhotoCallback,
    required VoidCallback selectPhotoCallback,
    required BuildContext context,
  }) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            onPressed: takePhotoCallback,
            child: BaseText(
              text: AppLocalizations.of(context).takePhoto,
            ),
          ),
          CupertinoActionSheetAction(
            onPressed: selectPhotoCallback,
            child: BaseText(
              text: AppLocalizations.of(context).galleryPhoto,
            ),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          child: BaseText(
            text: AppLocalizations.of(context).cancle,
            fontSize: 18,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
