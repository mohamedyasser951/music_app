import 'package:flutter/material.dart';
import 'package:music_app/Models/playlist_provider.dart';
import 'package:music_app/Models/song_model.dart';
import 'package:music_app/components/Widgets/darwer.dart';
import 'package:music_app/song_page.dart';
import 'package:provider/provider.dart';

class SongsPage extends StatefulWidget {
  const SongsPage({super.key});

  @override
  State<SongsPage> createState() => _SongsPageState();
}

class _SongsPageState extends State<SongsPage> {
  late PlayListProvider playListProvider;

  @override
  void initState() {
    playListProvider = Provider.of<PlayListProvider>(context,listen: false);
    super.initState();
  }

  void goToSong(int index) {
    playListProvider.setCurrentIndex = index;

    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const SongPage(),
    ));
  }

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
                  goToSong(index);
                },
                leading: Image(image: AssetImage(songs[index].img)),
                title: Text(songs[index].songName),
                subtitle: Text(songs[index].artistName),
              ),
            );
          },
        ));
  }
}
