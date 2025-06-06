import 'package:queenbee/layers/domain/entity/chatacter.dart';
import 'dart:convert';

class CharacterDto extends Character {
  CharacterDto({
    super.id,
    super.name,
    super.status,
    super.species,
    super.type,
    super.gender,
    super.image,
    super.episode,
    super.url,
    super.created,
  });

  factory CharacterDto.fromRawJson(String str) => CharacterDto.fromMap(json.decode(str));

  String toRawJson() => json.encode(toMap());

  factory CharacterDto.fromMap(Map<String, dynamic> json) => CharacterDto(
    id: json['id'],
    name: json['name'],
    status: json['status'],
    species: json['species'],
    type: json['type'],
    gender: json['gender'],
    image: json['image'],
    episode: json['episode'] == null
        ? []
        : List<String>.from(json['episode']!.map((dynamic x) => x)),
    url: json['url'],
    created:
        json['created'] == null ? null : DateTime.parse(json['created']),
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
    'status': status,
    'species': species,
    'type': type,
    'gender': gender,
    'image': image,
    'episode': episode == null
        ? [null]
        : List<dynamic>.from(episode!.map((x) => x)),
    'url': url,
    'created': created?.toIso8601String(),
};
}