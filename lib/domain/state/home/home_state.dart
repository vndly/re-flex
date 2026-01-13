import 'package:dafluta/dafluta.dart';
import 'package:reflex/domain/entities/grid.dart';
import 'package:reflex/domain/entities/match.dart';
import 'package:reflex/domain/entities/player.dart';
import 'package:reflex/domain/entities/result.dart';
import 'package:reflex/persistence/storage/settings_storage.dart';
import 'package:reflex/utils/authentication.dart';
import 'package:reflex/utils/flags.dart';
import 'package:reflex/utils/generator.dart';
import 'package:reflex/utils/navigation.dart';

class HomeState extends BaseState {
  @override
  void onLoad() {
    if (Flags.autoStartMatch) {
      Delayed.post(onPlay);
    }
  }

  void onPlay() => Navigation.lobbyScreen();

  Future onTutorial() async {
    final String name = await SettingsStorage.loadName();
    final Grid grid = GridGenerator.tutorial();
    final Match match = Match.create(
      grid: grid,
      result: Result.withOpponent(
        userId: Authentication.userId,
        userName: name,
        opponent: Player.TUTORIAL,
      ),
    );
    Navigation.matchScreen(match, false);
  }

  void onSettings() => Navigation.settingsScreen();
}
