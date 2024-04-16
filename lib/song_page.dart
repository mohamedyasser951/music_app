import 'package:flutter/material.dart';
import 'package:music_app/Models/playlist_provider.dart';
import 'package:music_app/Models/song_model.dart';

import 'package:music_app/components/Widgets/skelton.dart';
import 'package:provider/provider.dart';

class SongPage extends StatefulWidget {
  const SongPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SongPage> createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
  @override
  void initState() {
    super.initState();
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Consumer<PlayListProvider>(builder: (context, value, child) {
        int currentSong = value.currentSongIndex ?? 0;
        List<SongModel> songs = value.songs;
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: [
                const SizedBox(height: 10),

                // back button and menu button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const SizedBox(
                        height: 60,
                        width: 60,
                        child: Skelton(child: Icon(Icons.arrow_back)),
                      ),
                    ),
                    const Text('P L A Y L I S T'),
                    const SizedBox(
                      height: 60,
                      width: 60,
                      child: Skelton(child: Icon(Icons.menu)),
                    ),
                  ],
                ),

                const SizedBox(height: 15),

                // cover art, artist name, song name
                Skelton(
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          songs[currentSong].img,
                          height: 250,
                          width: double.infinity,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  songs[currentSong].songName,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  songs[currentSong].artistName,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                  ),
                                ),
                              ],
                            ),
                            const Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 32,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // start time, shuffle button, repeat button, end time
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(value.currentDuration.inSeconds.toString()),
                    const Icon(Icons.shuffle),
                    const Icon(Icons.repeat),
                    Text('4:22')
                  ],
                ),

                const SizedBox(height: 20),

                Slider.adaptive(
                  min: 0.0,
                  max: 100.0,
                  activeColor: Colors.green,
                  value: 50,
                  onChanged: (value) {},
                ),

                const SizedBox(height: 10),

                // previous song, pause play, skip next song
                SizedBox(
                  height: 80,
                  child: Row(
                    children: [
                      const Expanded(
                        child: Skelton(
                            child: Icon(
                          Icons.skip_previous,
                          size: 32,
                        )),
                      ),
                      Expanded(
                        flex: 2,
                        child: InkWell(
                          onTap: () {
                            value.pauseOrResume();
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Skelton(
                                child: Icon(
                              value.isPlaying ? Icons.pause : Icons.play_arrow,
                              size: 32,
                            )),
                          ),
                        ),
                      ),
                      const Expanded(
                        child: Skelton(
                            child: Icon(
                          Icons.skip_next,
                          size: 32,
                        )),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
