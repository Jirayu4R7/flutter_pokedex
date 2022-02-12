import 'package:flutter/material.dart';

import 'image_pokemon_view.dart';

class PokemonDetailView extends StatelessWidget {
  final String? name, frontImage, backImage;
  final int? weight, height;

  const PokemonDetailView(
      {Key? key,
      this.name,
      this.frontImage,
      this.backImage,
      this.weight,
      this.height})
      : super(key: key);

  Widget _renderDetail({required String title, required String detail}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          detail,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            name.toString(),
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(
            height: 8.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ImagePokenmonView(urlImage: frontImage),
              ImagePokenmonView(urlImage: backImage),
            ],
          ),
          const SizedBox(
            height: 24.0,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _renderDetail(
                title: "Weight:",
                detail: weight.toString(),
              ),
              const SizedBox(
                width: 16.0,
              ),
              _renderDetail(
                title: "Height:",
                detail: height.toString(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
