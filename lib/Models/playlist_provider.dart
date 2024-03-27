import 'package:flutter/material.dart';
import 'package:music_app/Models/song_model.dart';

class PlayListProvider with ChangeNotifier {
  List<SongModel> songs = [
    SongModel(
        songName: "Ahla Haga",
        artistName: "Amr Diab",
        img: "assets/images/1.png",
        songPath: "assets/audios/11.MP3"),
         SongModel(
        songName: "Ahla Haga",
        artistName: "Amr Diab",
        img: "assets/images/1.png",
        songPath: "assets/audios/11.MP3"),
  ];
}
