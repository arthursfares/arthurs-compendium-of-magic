import 'package:arthurs_compendium_of_magic/models/spellcaster_model.dart';
import 'package:flutter/widgets.dart';

class SpellcasterListModel extends ChangeNotifier {
  final List<SpellcasterModel> _spellcasters = <SpellcasterModel>[
    SpellcasterModel(
      'Nick Cage',
      Image.asset('assets/images/nic-cage.png'),
      'Bard',
      11,
      '"I\'m going to steal the Declaration of Independence"',
    ),
    SpellcasterModel(
      'John Carmack',
      Image.asset('assets/images/john-carmack.png'),
      'Wizard',
      19,
      'Time traveling interdimensional over genius and actual rocket scientist',
    ),
    SpellcasterModel(
      'Larry Bird',
      Image.asset('assets/images/larry-bird.png'),
      'Warlock',
      13,
      '🏀🍀🩳',
    ),
  ];

  List<SpellcasterModel> get spellcasters => _spellcasters;

  void add(SpellcasterModel spellcaster) {
    _spellcasters.add(spellcaster);
    notifyListeners();
  }

  void remove(int index) {
    _spellcasters.removeAt(index);
    notifyListeners();
  }

  void update(int index, SpellcasterModel spellcaster) {
    _spellcasters[index] = spellcaster;
    notifyListeners();
  }
}
