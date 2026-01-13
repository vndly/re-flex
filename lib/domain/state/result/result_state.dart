import 'package:dafluta/dafluta.dart';
import 'package:reflex/domain/entities/match.dart';
import 'package:reflex/persistence/repository/grid_repository.dart';
import 'package:reflex/utils/navigation.dart';

class ResultState extends BaseState {
  final Match match;

  ResultState(this.match);

  @override
  Future onLoad() async {
    if (match.gridId != 'tutorial') {
      final GridRepository repository = await GridRepository.instance();
      await repository.setResult(
        gridId: match.gridId,
        result: match.result,
      );
    }
  }

  void onClose() => Navigation.pop();
}
