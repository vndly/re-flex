import 'package:reflex/domain/entities/action_result.dart';
import 'package:reflex/domain/entities/events/event.dart';
import 'package:reflex/domain/entities/location.dart';
import 'package:reflex/domain/entities/tiles/tile_sequence.dart';
import 'package:reflex/domain/types/event_type.dart';

class EventSequence extends Event<TileSequence> {
  static const double durationPerTile = 2;

  EventSequence({
    required super.trigger,
    required super.timeout,
    required super.tiles,
  }) : super(type: EventType.sequence);

  @override
  int get pointsFail => hasStarted ? tilesActive.length : 0;

  @override
  int get pointsSuccess => tilesRemoved.length * 2;

  @override
  ActionResult tileTapped({
    required TileSequence tile,
    required double time,
  }) {
    final int currentIndex = tilesRemoved.length + 1;

    if (tile.number == currentIndex) {
      removeTile(tile);

      if (tilesRemoved.length >= numberOfTiles) {
        return ActionResult.completed(this);
      } else {
        return ActionResult.remove(this);
      }
    } else {
      return ActionResult.mistake(this);
    }
  }

  factory EventSequence.create({
    required double trigger,
    required double timeout,
    required List<Location> locations,
  }) {
    final EventSequence event = EventSequence(
      trigger: trigger,
      timeout: timeout,
      tiles: [],
    );

    for (int i = 0; i < locations.length; i++) {
      final Location location = locations[i];

      event.addTile(
        TileSequence(
          location: location,
          event: event,
          number: i + 1,
        ),
      );
    }

    return event;
  }
}
