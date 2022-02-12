import 'package:flutter/material.dart';

class ImagePokenmonView extends StatelessWidget {
  const ImagePokenmonView({
    Key? key,
    this.urlImage,
  }) : super(key: key);

  final String? urlImage;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      urlImage.toString(),
      width: 112.0,
      height: 112.0,
      fit: BoxFit.contain,
      errorBuilder:
          (BuildContext context, Object exception, StackTrace? stackTrace) {
        return const SizedBox(
          width: 112.0,
          height: 112.0,
          child: Icon(Icons.error_outline, size: 48, color: Colors.red),
        );
      },
    );
  }
}
