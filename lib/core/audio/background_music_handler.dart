import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';

class BackgroundMusicHandler extends BaseAudioHandler {
  final AudioPlayer _player = AudioPlayer();

  BackgroundMusicHandler() {
    _player.playbackEventStream.map(_transformEvent).pipe(playbackState);
  }

  PlaybackState _transformEvent(PlaybackEvent event) {
    return PlaybackState(
      controls: const [
        MediaControl.play,
        MediaControl.pause,
        MediaControl.stop,
      ],
      systemActions: const {
        MediaAction.play,
        MediaAction.pause,
        MediaAction.stop,
      },
      androidCompactActionIndices: const [0, 1],
      playing: _player.playing,
      processingState: AudioProcessingState.ready,
    );
  }

  /// Load background music from assets
  Future<void> loadBackgroundMusic() async {
    mediaItem.add(
      const MediaItem(
        id: 'tabola-bale-silet-open-up',
        title:
            'Tabola Bale Cover - Silet Open Up (feat. Jacson Zeran, Juan Reza & Diva Aurel)',
        artist: 'Bahasa Malaysia',
        album: 'Tabola Bale Cover',
      ),
    );

    await _player.setAsset(
      'assets/audio/Tabola Bale Cover - Silet Open Up (feat. Jacson Zeran, Juan Reza & Diva Aurel) (Bahasa Malaysia).mp3',
    );
    await _player.setLoopMode(LoopMode.one);
  }

  @override
  Future<void> play() => _player.play();

  @override
  Future<void> pause() => _player.pause();

  @override
  Future<void> stop() => _player.stop();

  @override
  Future<void> onTaskRemoved() async {
    // Keeps music alive when app is swiped away (Android)
    await play();
  }
}
