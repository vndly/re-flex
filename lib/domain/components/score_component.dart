import 'dart:ui';
import 'package:flame/components.dart';
import 'package:reflex/app/constants.dart';
import 'package:reflex/domain/entities/match.dart';
import 'package:reflex/extensions/canvas_extension.dart';
import 'package:reflex/utils/palette.dart';

class ScoreComponent extends PositionComponent {
  final Match match;
  final NeonPaint neonPaint = NeonPaint.create(
    color: Palette.TEXT_COLOR_PRIMARY,
    style: PaintingStyle.fill,
  );

  ScoreComponent({
    required super.position,
    required super.size,
    required this.match,
  }) : super(anchor: Anchor.center);

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    canvas.drawTextNeon(
      text: match.score.toString(),
      position: size / 2,
      size: size.x / 8,
      paint: neonPaint,
      fontFamily: Constants.FONT_MICHROMA,
    );
  }
}
