import 'package:flutter/material.dart';
import 'package:wan/bean/song_detail_item_entity.dart';
import 'dart:ui' as ui show Image, ImageFilter;
import 'package:flute_music_player/flute_music_player.dart';

enum PlayerState { stopped, playing, paused }

class MusicPlay extends StatefulWidget {

  final SongDetailItemData detailData;

  const MusicPlay({Key key, @required this.detailData}) : super(key: key);
  
  @override
  _MusicPlayState createState() => _MusicPlayState();
}

class _MusicPlayState extends State<MusicPlay> {

  MusicFinder musicFinder;
  Song song;
  Duration duration;
  Duration position;
  PlayerState state;

  get isPause => state == PlayerState.paused;
  get isPlaying => state == PlayerState.playing;

  get durationText => duration != null ? duration.toString().split('.').first : '';
  get positionText => position != null ? position.toString().split('.').first : '';

  bool isMuted = false;

  List<Song> songs;

  @override
  void initState() {
    super.initState();
    initPlayer();

  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(widget.detailData.songPic),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black45, BlendMode.overlay
              ),
            ),
          ),
        ),

        Container(
          child: BackdropFilter(
              filter: ui.ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Opacity(
                opacity: 0.6,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade900
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void initPlayer() async {
    if (musicFinder == null) {
      musicFinder = MusicFinder();
    }
    var songss = await MusicFinder.allSongs();
    List<Song> list = List.from(songss);
    setState(() {
      songs = songss;
      musicFinder.play(songs[0].uri);
    });
  }


}


//Stack(
//fit: StackFit.expand,
//children: <Widget>[
//Text('0' * 10000),
//Center(
//child: ClipRect(  // <-- clips to the 200x200 [Container] below
//child: BackdropFilter(
//filter: ui.ImageFilter.blur(
//sigmaX: 5.0,
//sigmaY: 5.0,
//),
//child: Container(
//alignment: Alignment.center,
//width: 200.0,
//height: 200.0,
//child: Text('Hello World'),
//),
//),
//),
//),
//],
//)
