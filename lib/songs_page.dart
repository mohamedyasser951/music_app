import 'package:flutter/material.dart';
import 'package:music_app/Models/playlist_provider.dart';
import 'package:music_app/Models/song_model.dart';
import 'package:music_app/components/Widgets/darwer.dart';
import 'package:music_app/song_page.dart';
import 'package:provider/provider.dart';

class SongsPage extends StatelessWidget {
  const SongsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: const Text("P L A Y L I S T"),
        ),
        drawer: const CustomizedDrawer(),
        body: Consumer<PlayListProvider>(
          builder: (context, value, child) {
            final List<SongModel> songs = value.songs;
            return ListView.builder(
              itemCount: songs.length,
              itemBuilder: (context, index) => ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SongPage(song: songs[index]),
                  ));
                },
                leading: Hero(
                  tag: const Text("h1"),
                  child: Image(image: AssetImage(songs[index].img))),
                title: Text(songs[index].songName),
                subtitle: Text(songs[index].artistName),
              ),
            );
          },
        ));
  }
}
