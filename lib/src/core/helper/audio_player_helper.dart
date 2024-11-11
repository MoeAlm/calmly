import 'package:audioplayers/audioplayers.dart';

class AudioPlayerHelper {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;

  bool get isPlaying => _isPlaying;

  Future<void> play(String source, {bool isAsset = false}) async {
    if (isAsset) {
      await _audioPlayer.play(AssetSource(source));
    } else {
      await _audioPlayer.play(UrlSource(source));
    }
    _isPlaying = true;
  }

  Future<void> pause() async {
    if (_isPlaying) {
      await _audioPlayer.pause();
      _isPlaying = false;
    }
  }

  Future<void> resume() async {
    if (!_isPlaying) {
      await _audioPlayer.resume();
      _isPlaying = true;
    }
  }

  Future<void> stop() async {
    await _audioPlayer.stop();
    _isPlaying = false;
  }

  void dispose() {
    _audioPlayer.dispose();
  }
}