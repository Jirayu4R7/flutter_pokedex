import 'package:get/get_utils/src/extensions/string_extensions.dart';

extension CapExtension on String {
  String get capitalizeFirstofEach =>
      split(" ").map((str) => str.capitalize).join(" ");
}
