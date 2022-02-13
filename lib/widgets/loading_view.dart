import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  final bool? isLoading;

  const LoadingView({
    Key? key,
    this.isLoading = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isLoading!) {
      return Container(
        margin: const EdgeInsets.all(8.0),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return const SizedBox.shrink();
  }
}
