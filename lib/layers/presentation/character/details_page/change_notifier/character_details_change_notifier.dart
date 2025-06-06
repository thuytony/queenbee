import 'package:flutter/foundation.dart';
import 'package:queenbee/layers/domain/entity/chatacter.dart';

class CharacterDetailsChangeNotifier extends ChangeNotifier {
  CharacterDetailsChangeNotifier({required this.character});

  final Character character;
}
