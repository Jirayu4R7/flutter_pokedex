import 'package:flutter/material.dart';

class BottomSheetView extends StatefulWidget {
  final Widget content;

  const BottomSheetView({
    Key? key,
    required this.content,
  }) : super(key: key);

  @override
  State<BottomSheetView> createState() => _BottomSheetViewState();
}

class _BottomSheetViewState extends State<BottomSheetView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        height: 260.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 4.0,
              width: 112.0,
              margin: const EdgeInsets.only(
                top: 8.0,
                bottom: 16.0,
              ),
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(
                  Radius.circular(96.0),
                ),
              ),
            ),
            widget.content
          ],
        ),
      ),
    );
  }
}
