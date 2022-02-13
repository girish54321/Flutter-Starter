import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class AppNetWorkIamge extends StatelessWidget {
  final String imageUrl;
  final double? radius;
  final BoxFit? boxFit;
  const AppNetWorkIamge(
      {Key? key, required this.imageUrl, this.radius, this.boxFit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 4),
          image: DecorationImage(
            image: imageProvider,
            fit: boxFit ?? BoxFit.cover,
          ),
        ),
      ),
      // placeholder: (context, url) => const AppPlaceholder(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}

class AppPlaceholder extends StatelessWidget {
  const AppPlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Container(
          height: 50,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/image/icon_color.png'),
                fit: BoxFit.fitHeight),
          ),
        ),
      ),
    );
  }
}
