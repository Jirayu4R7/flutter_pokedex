import 'package:flutter/material.dart';

class PokemonItemView extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const PokemonItemView({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: onPressed,
        child: Text(
          title,
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
    );
  }
}
