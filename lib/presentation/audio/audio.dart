import 'package:reflex/persistence/storage/settings_storage.dart';
import 'package:reflex/presentation/audio/music.dart';
import 'package:reflex/presentation/audio/sound.dart';
import 'package:reflex/utils/locator.dart';

class Audio with Music, Sound {
  bool enabled = true;

  static Audio get get => locator<Audio>();

  Future toggle() {
    enabled = !enabled;

    return SettingsStorage.saveAudio(enabled);
  }

  void dispose() {
    disposeSound();
    disposeMusic();
  }

  Future load() async {
    enabled = await SettingsStorage.loadAudio();
    await loadSound();
    await loadMusic();
  }
}
