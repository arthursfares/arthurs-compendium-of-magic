import 'package:arthurs_compendium_of_magic/models/spellcaster_model.dart';
import 'package:flutter/widgets.dart';

class SpellcasterListModel extends ChangeNotifier {
  final List<SpellcasterModel> _spellcasters = <SpellcasterModel>[
    SpellcasterModel(
      'Nick Cage',
      Image.asset('assets/images/nic-cage.png'),
      'Wizard',
      19,
      'I\'m going to steal the Declaration of Independence',
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
