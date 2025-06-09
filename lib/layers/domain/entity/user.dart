import 'package:equatable/equatable.dart';

class User with EquatableMixin {
  User({
    this.id,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
    this.image,
    this.episode,
    this.url,
    this.created,
  });

  final int? id;
  final String? name;
  final String? status;
  final String? species;
  final String? type;
  final String? gender;
  final String? image;
  final List<String>? episode;
  final String? url;
  final DateTime? created;

  @override
  List<Object?> get props => [
    id,
    name,
    status,
    species,
    type,
    gender,
    image,
    episode,
    url,
    created,
  ];

  bool get isAlive => status == 'Alive';
}
