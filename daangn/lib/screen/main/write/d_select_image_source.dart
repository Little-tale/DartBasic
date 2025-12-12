import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nav_hooks/dialog/dialog.dart';

class SelectImageSourceDialog extends DialogWidget<ImageSource> {
  SelectImageSourceDialog({super.key});

  @override
  DialogState<SelectImageSourceDialog> createState() =>
      _SelectImageSourceDialogState();
}

class _SelectImageSourceDialogState
    extends DialogState<SelectImageSourceDialog> {
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: 300,
          ),
          decoration: BoxDecoration(
              color: context.backgroundColor,
              borderRadius: BorderRadius.circular(15)),
          child: _Body(widget: widget),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    required this.widget,
  });

  final SelectImageSourceDialog widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _ImageSelectedWidget(
            imageSelectedType: ImageSelectedType.camera,
            callBack: (type) {
              widget.hide(ImageSource.camera);
            }),
        const Line().pSymmetric(h: 20),
        _ImageSelectedWidget(
            imageSelectedType: ImageSelectedType.gallery,
            callBack: (type) {
              widget.hide(ImageSource.gallery);
            }),
      ],
    );
  }
}

class _ImageSelectedWidget extends StatelessWidget {
  final ImageSelectedType imageSelectedType;
  final ValueChanged<ImageSelectedType> callBack;
  const _ImageSelectedWidget(
      {required this.imageSelectedType, required this.callBack});

  @override
  Widget build(BuildContext context) {
    return Tap(
      onTap: () => callBack(imageSelectedType),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [imageSelectedType.icon, imageSelectedType.title.text.make()],
      ).p(20),
    );
  }
}

enum ImageSelectedType {
  camera,
  gallery;

  String get title {
    switch (this) {
      case camera:
        return '카메라';
      case gallery:
        return '갤러리';
    }
  }

  Icon get icon {
    switch (this) {
      case camera:
        return const Icon(Icons.camera_alt_outlined);
      case gallery:
        return const Icon(Icons.photo_outlined);
    }
  }
}
