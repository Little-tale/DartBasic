import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';

class SelectImageButton extends StatelessWidget {
  const SelectImageButton({
    super.key,
    required this.onTap,
    required this.imageList,
  });

  final VoidCallback onTap;
  final List<String> imageList;

  @override
  Widget build(BuildContext context) {
    return Tap(
      onTap: onTap,
      child: SizedBox(
        width: 80,
        height: 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.camera_alt),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: imageList.length.toString(),
                  style: const TextStyle(color: Colors.orange)),
              const TextSpan(text: '/10')
            ])),
          ],
        ).box.rounded.border(color: Colors.grey).make(),
      ),
    );
  }
}
