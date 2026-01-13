import 'dart:async';
import 'package:dafluta/dafluta.dart';
import 'package:reflex/domain/entities/grid.dart';
import 'package:reflex/domain/entities/match.dart';
import 'package:reflex/persistence/repository/grid_repository.dart';
import 'package:reflex/persistence/storage/settings_storage.dart';
import 'package:reflex/utils/navigation.dart';

class LobbyState extends BaseState {
  Grid? _grid;
  bool isCanceling = false;

  bool get isLoading => _grid == null;

  @override
  Future onLoad() async {
    final String name = await SettingsStorage.loadName();
    Delayed.post(() => _searchMatch(name));
  }

  Future _searchMatch(String name) async {
    final GridRepository repository = await GridRepository.instance();
    final Match match = await repository.getMatch();
    Navigation.matchScreen(match);
  }

  Future onCancel() async {
    isCanceling = true;
    notify();
    Navigation.pop();
  }
}
