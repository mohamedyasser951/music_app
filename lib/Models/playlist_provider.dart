import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_app/Models/song_model.dart';

class PlayListProvider with ChangeNotifier {
  PlayListProvider({listenToDuration});
  final List<SongModel> _songs = [
    SongModel(
        songName: "Ahla Haga",
        artistName: "Amr Diab",
        img: "assets/images/1.png",
        songPath: "audios/11.MP3"),
    SongModel(
        songName: "Bahbak",
        artistName: "Tamer hosney",
        img: "assets/images/1.png",
        songPath: "audios/11.MP3"),
  ];

  int? _currentSongIndex;
  List<SongModel> get songs => _songs;
  int? get currentSongIndex => _currentSongIndex;
  bool isPlaying = false;
  set setCurrentIndex(int index) {
    _currentSongIndex = index;
    notifyListeners();
  }

  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;

Duration get currentDuration => _currentDuration;
Duration get totalDuration => _totalDuration;


  void listenToDuration() {
    _audioPlayer.onDurationChanged.listen((currentDuration) {
      _currentDuration = currentDuration;
      notifyListeners();
    });
     _audioPlayer.onPositionChanged.listen((currentDuration) {
      _currentDuration = currentDuration;
      notifyListeners();
    });
    _audioPlayer.onPlayerComplete.listen((event) {});
  }

  final AudioPlayer _audioPlayer = AudioPlayer();

  void play() {
    String path = songs[_currentSongIndex!].songPath;
    _audioPlayer.stop();
    _audioPlayer.play(AssetSource(path));
    isPlaying = true;
    notifyListeners();
  }

  void pause() {
    _audioPlayer.pause();
    isPlaying = false;
    notifyListeners();
  }

  void resume() {
    _audioPlayer.resume();
    isPlaying = true;
    notifyListeners();
  }

  void pauseOrResume() {
    if (isPlaying) {
      pause();
    } else {
      resume();
    }
    notifyListeners();
  }
}
