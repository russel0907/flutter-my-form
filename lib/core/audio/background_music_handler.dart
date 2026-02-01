import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';

class BgSong {
  final String id;
  final String title;
  final String artist;
  final String album;
  final String assetPath;

  const BgSong({
    required this.id,
    required this.title,
    required this.artist,
    required this.album,
    required this.assetPath,
  });
}

class BackgroundMusicHandler extends BaseAudioHandler {
  final AudioPlayer _player = AudioPlayer();
  int _currentIndex = 0;

  final List<BgSong> _playlist = [
    const BgSong(
      id: 'tabola-bale-silet-open-up',
      title:
          'Tabola Bale Cover - Silet Open Up (feat. Jacson Zeran, Juan Reza & Diva Aurel)',
      artist: 'Bahasa Malaysia',
      album: 'Tabola Bale Cover',
      assetPath: 'assets/audio/Tabola Bale Cover - Silet Open Up (feat. Jacson Zeran, Juan Reza & Diva Aurel) (Bahasa Malaysia).mp3',
    ),
    const BgSong(
      id: 'dabra-sia-senyuman-sabahan',
      title: 'Dabra Sia - Senyuman Sabahan (Official Music Video)',
      artist: 'Dabra Sia',
      album: 'Sabahan Hits',
      assetPath: 'assets/audio/Dabra Sia - Senyuman Sabahan (Official Music Video).mp3',
    ),
    const BgSong(
      id: 'tiga-kali-satu-hari',
      title: 'Tiga Kali Satu Hari (Official Music Video)',
      artist: 'Kupikupifm 96.3',
      album: 'Sabah Radio Hits',
      assetPath: 'assets/audio/Tiga Kali Satu Hari (Official Music Video) - Kupikupifm 96.3.mp3',
    ),
    const BgSong(
      id: 'oh-siuknya-duyung',
      title: 'OH SIUKNYA – DUYUNG (Official Audio Lyric)',
      artist: 'Duyung',
      album: 'Sabah Vibes',
      assetPath: 'assets/audio/OH SIUKNYA-DUYUNG (Official Audio Lyric).mp3',
    ),
    const BgSong(
      id: 'kan-apa-sia-bilang-atau',
      title: 'Kan Apa Sia Bilang Atau (Nunu Kangku Di)',
      artist: 'Norbert',
      album: 'Sabahan Classics',
      assetPath: 'assets/audio/Kan apa sia bilang atau (Nunu Kangku Di)-Norbert.mp3',
    ),
  ];

  BackgroundMusicHandler() {
    _player.setVolume(0.5);
    _player.playbackEventStream.map(_transformEvent).pipe(playbackState);
  }

  /// Sync playback state with system
  PlaybackState _transformEvent(PlaybackEvent event) {
    return PlaybackState(
      controls: const [
        MediaControl.skipToPrevious,
        MediaControl.play,
        MediaControl.pause,
        MediaControl.skipToNext,
        MediaControl.stop,
      ],
      systemActions: const {
        MediaAction.skipToPrevious,
        MediaAction.play,
        MediaAction.pause,
        MediaAction.skipToNext,
        MediaAction.stop,
      },
      androidCompactActionIndices: const [0, 1, 3],
      playing: _player.playing,
      processingState: AudioProcessingState.ready,
    );
  }

  /// Load song by index
  Future<void> loadSong(int index) async {
    if (index < 0 || index >= _playlist.length) return;

    _currentIndex = index;
    final song = _playlist[index];

    mediaItem.add(
      MediaItem(
        id: song.id,
        title: song.title,
        artist: song.artist,
        album: song.album,
      ),
    );

    await _player.setAsset(song.assetPath);
    await _player.setLoopMode(LoopMode.one);
  }

  Future<void> loadAllSongs() async {
    final sources = _playlist
        .map(
          (song) => AudioSource.asset(
            song.assetPath,
            tag: MediaItem(
              id: song.id,
              title: song.title,
              artist: song.artist,
              album: song.album,
            ),
          ),
        )
        .toList();

    await _player.setAudioSource(
      ConcatenatingAudioSource(children: sources),
      initialIndex: _currentIndex,
    );

    await _player.setLoopMode(LoopMode.all);
  }

  /// Controls
  @override
  Future<void> play() => _player.play();

  @override
  Future<void> pause() => _player.pause();

  @override
  Future<void> stop() => _player.stop();

  @override
  Future<void> skipToNext() async {
    final nextIndex = (_currentIndex + 1) % _playlist.length;
    await loadSong(nextIndex);
    play();
  }

  @override
  Future<void> skipToPrevious() async {
    final prevIndex = (_currentIndex - 1 + _playlist.length) % _playlist.length;
    await loadSong(prevIndex);
    play();
  }

  @override
  Future<void> onTaskRemoved() async {
    // Keep music alive when app is swiped away (Android)
    await play();
  }
}
