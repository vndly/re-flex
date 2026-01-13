import 'package:reflex/domain/entities/action_result.dart';
import 'package:reflex/domain/entities/events/event.dart';
import 'package:reflex/domain/entities/location.dart';
import 'package:reflex/domain/entities/tiles/tile_coin.dart';
import 'package:reflex/domain/types/event_type.dart';

class EventCoin extends Event<TileCoin> {
  static const double duration = 3;

  EventCoin({
    required super.trigger,
    required super.timeout,
    required super.tiles,
  }) : super(type: EventType.coin);

  @override
  int get pointsFail => 1;

  @override
  int get pointsSuccess => 5 + remainingTime.floor();

  @override
  ActionResult tileTapped({
    required TileCoin tile,
    required double time,
  }) => ActionResult.completed(this);

  factory EventCoin.create({
    required double trigger,
    required List<Location> locations,
  }) {
    final EventCoin event = EventCoin(
      trigger: trigger,
      timeout: duration,
      tiles: [],
    );

    for (final Location location in locations) {
      event.addTile(
        TileCoin(
          location: location,
          event: event,
        ),
      );
    }

    return event;
  }
}
