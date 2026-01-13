import 'dart:ui';
import 'package:reflex/app/constants.dart';
import 'package:reflex/domain/components/tiles/tile_component.dart';
import 'package:reflex/domain/entities/tiles/tile_sequence.dart';
import 'package:reflex/extensions/canvas_extension.dart';
import 'package:reflex/utils/palette.dart';

class TileSequenceComponent extends TileComponent<TileSequence> {
  late final NeonPaint neonPaint;

  TileSequenceComponent({
    required super.position,
    required super.size,
    required super.tile,
    required super.gridComponent,
  }) : super(borderColor: Palette.TILE_WHITE) {
    neonPaint = NeonPaint.create(
      color: Palette.TILE_WHITE,
      style: PaintingStyle.fill,
    );
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    canvas.drawTextNeon(
      text: '${tile.number}',
      position: size / 2,
      size: size.x / 3,
      paint: neonPaint,
      fontFamily: Constants.FONT_MICHROMA,
    );
  }
}
