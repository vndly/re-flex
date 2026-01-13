import 'dart:async';
import 'package:reflex/domain/components/icon_component.dart';
import 'package:reflex/domain/components/tiles/tile_component.dart';
import 'package:reflex/domain/entities/tiles/tile_chest.dart';
import 'package:reflex/utils/assets.dart';
import 'package:reflex/utils/palette.dart';

class TileChestComponent extends TileComponent<TileChest> {
  TileChestComponent({
    required super.position,
    required super.size,
    required super.tile,
    required super.gridComponent,
  }) : super(borderColor: Palette.TILE_YELLOW);

  @override
  FutureOr onLoad() async {
    add(
      IconComponent(
        position: size / 2,
        size: size / 2,
        spritePath: Assets.IMAGES_ICONS_CHEST,
      ),
    );

    return super.onLoad();
  }
}
