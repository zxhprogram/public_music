import 'package:public_music/api/song_url.dart';

Future<PlaylistTrackAll> playlist_track_all(String id) async {
  var res = await dio.get('/playlist/track/all?id=$id');
  var playlistTrackAll = PlaylistTrackAll.fromJson(res.data);
  print(playlistTrackAll.songs);
  return playlistTrackAll;
}

class PlaylistTrackAll {
  int? code;
  List<Song>? songs;
  PlaylistTrackAll({required this.code, required this.songs});
  factory PlaylistTrackAll.fromJson(Map<String, dynamic> json) {
    var songsJson = json['songs'] as List;
    List<Song> songsList = songsJson.map((i) => Song.fromJson(i)).toList();
    return PlaylistTrackAll(code: json['code'], songs: songsList);
  }
}

class Song {
  String name;
  int id;

  Song({required this.name, required this.id});
  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(name: json['name'], id: json['id']);
  }
}
