import 'package:pokedex/utils/cap_extension.dart';

class PokemonInfoModel {
  String? name;
  String? frontImage;
  String? backImage;
  int? weight;
  int? height;

  PokemonInfoModel({
    this.name,
    this.frontImage,
    this.backImage,
    this.weight,
    this.height,
  });

  PokemonInfoModel.fromJson(Map<String, dynamic> json) {
    name = json['name'].toString().capitalizeFirstofEach;
    height = int.parse(json["height"].toString());
    weight = int.parse(json["weight"].toString());
    frontImage = json["sprites"]["front_default"];
    backImage = json["sprites"]["back_default"];
  }
}
