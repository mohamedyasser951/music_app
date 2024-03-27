import 'package:flutter/material.dart';

import 'package:music_app/Models/song_model.dart';
import 'package:music_app/components/Widgets/skelton.dart';

class SongPage extends StatefulWidget {
  final SongModel song;
  const SongPage({
    Key? key,
    required this.song,
  }) : super(key: key);

  @override
  State<SongPage> createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
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
                    Hero(
                      tag: const Text("h1"),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          widget.song.img,
                          height: 250,
                          width: double.infinity,
                          fit: BoxFit.contain,
                        ),
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
                                widget.song.songName,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                widget.song.artistName,
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
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('0:00'),
                  Icon(Icons.shuffle),
                  Icon(Icons.repeat),
                  Text('4:22')
                ],
              ),

              const SizedBox(height: 20),

              // linear bar
              // Skelton(
              //   child: Slider(
              //     onChanged: (value) => ,
              //     // lineHeight: 10,
              //     // percent: 0.8,
              //     // progressColor: Colors.green,
              //     // backgroundColor: Colors.transparent,
              //   ),
              // ),
              Slider.adaptive(
                min: 0.0,
                max: 100.0,
                activeColor: Colors.green,
                value: 50,
                onChanged: (value) {},
              ),

              const SizedBox(height: 10),

              // previous song, pause play, skip next song
              const SizedBox(
                height: 80,
                child: Row(
                  children: [
                    Expanded(
                      child: Skelton(
                          child: Icon(
                        Icons.skip_previous,
                        size: 32,
                      )),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Skelton(
                            child: Icon(
                          Icons.play_arrow,
                          size: 32,
                        )),
                      ),
                    ),
                    Expanded(
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
      ),
    );
  }
}
