import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:public_music/api/playlist_track_all.dart';
import 'package:public_music/api/song_url.dart';
import 'package:public_music/api/top_playlist.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MediaKit.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  late final player;
  TopPlayList? topPlayList = null;

  Future<void> _incrementCounter() async {
    setState(() {
      _counter++;
    });

    var song = await song_url('33894312');
    var url = song.data![0].url;
    print('playing $url');
    var m = [Media(url!)];
    var x = Playlist(m);
    player.open(x);
    player.play();
  }

  @override
  void initState() {
    super.initState();
    player = Player();
    fetchTopPlayList();
  }

  void fetchTopPlayList() async {
    var topPlayList = await top_playlist();
    setState(() {
      this.topPlayList = topPlayList;
    });
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                print('tapped ${topPlayList!.data![index].name}');
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        SongDetailPage(song: topPlayList!.data![index]),
                  ),
                );
              },
              child: Row(
                children: [
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: Image.network(topPlayList!.data![index].coverImgUrl),
                  ),
                  Text(topPlayList!.data![index].name),
                ],
              ),
            );
          },
          itemCount: topPlayList == null ? 0 : topPlayList!.data!.length,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}

class SongDetailPage extends StatefulWidget {
  final PlayData song;
  const SongDetailPage({super.key, required this.song});

  @override
  State<SongDetailPage> createState() => _SongDetailPageState();
}

class _SongDetailPageState extends State<SongDetailPage> {
  PlaylistTrackAll? playlistTrackAll = null;

  @override
  void initState() {
    super.initState();
    fetchPlaylistTrackAll();
  }

  void fetchPlaylistTrackAll() async {
    var playlistTrackAll = await playlist_track_all(widget.song.id.toString());
    setState(() {
      this.playlistTrackAll = playlistTrackAll;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.song.name)),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: buildSongList(),
          ),
        ),
      ),
    );
  }

  List<Widget> buildSongList() {
    if (playlistTrackAll == null) {
      return [Text('Loading...')];
    } else {
      return playlistTrackAll!.songs!
          .map(
            (song) =>
                Row(children: [Text(song.id.toString()), Text(song.name)]),
          )
          .toList();
    }
  }
}
