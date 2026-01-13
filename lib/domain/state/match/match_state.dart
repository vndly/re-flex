import 'package:dafluta/dafluta.dart';
import 'package:reflex/domain/entities/match.dart';
import 'package:reflex/presentation/common/dialogs/confirmation_dialog.dart';
import 'package:reflex/utils/navigation.dart';

class MatchState extends BaseState {
  final Match match;

  MatchState(this.match);

  void onOpenMenu() => ConfirmationDialog.quitMatch(Navigation.pop);

  void onMatchFinished() => Navigation.resultScreen(match);
}
