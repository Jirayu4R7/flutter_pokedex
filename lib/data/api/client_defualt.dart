import 'package:dio/dio.dart';
import 'package:pokedex/data/config/config.dart';
import 'package:pokedex/data/helper/logging.dart';

class ClientDefualt {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: BASE_URL,
      headers: {"Accept": "application/json"},
    ),
  )..interceptors.add(
      Logging(),
    );
}
