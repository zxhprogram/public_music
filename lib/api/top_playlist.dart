import 'package:public_music/api/song_url.dart';

void main(List<String> args) {
  top_playlist();
}

Future<TopPlayList> top_playlist() async {
  var res = await dio.get('/top/playlist');
  // print(res.data);
  var topPlayList = TopPlayList.fromJson(res.data);
  print(topPlayList.data);
  return topPlayList;
}

class TopPlayList {
  int? code;
  List<PlayData>? data;
  TopPlayList({this.code, this.data});
  TopPlayList.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['playlists'] != null) {
      data = <PlayData>[];
      json['playlists'].forEach((v) {
        data!.add(PlayData.fromJson(v));
      });
    }
  }
}

class PlayData {
  String name;
  int id;
  String coverImgUrl;
  PlayData({required this.name, required this.id, required this.coverImgUrl});
  PlayData.fromJson(Map<String, dynamic> json)
    : name = json['name'],
      id = json['id'],
      coverImgUrl = json['coverImgUrl'];
}
