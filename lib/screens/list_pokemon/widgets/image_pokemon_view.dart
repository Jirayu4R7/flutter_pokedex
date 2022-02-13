import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImagePokenmonView extends StatelessWidget {
  const ImagePokenmonView({
    Key? key,
    this.urlImage,
  }) : super(key: key);

  final String? urlImage;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: urlImage.toString(),
      imageBuilder: (context, imageProvider) => Container(
        width: 112.0,
        height: 112.0,
        decoration: BoxDecoration(
          image: DecorationImage(image: imageProvider, fit: BoxFit.contain),
        ),
      ),
      placeholder: (context, url) => const Text("Loading..."),
      errorWidget: (context, url, error) => const SizedBox(
        width: 112.0,
        height: 112.0,
        child: Icon(Icons.error_outline, size: 48, color: Colors.red),
      ),
    );
  }
}
