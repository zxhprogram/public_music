import 'package:public_music/api/song_url.dart';

Future<CheckMusic> check_music(String id) async {
  var res = await dio.get('/check/music?id=$id');
  return CheckMusic.fromJson(res.data);
}

class CheckMusic {
  int code;
  bool success;
  String message;
  CheckMusic({
    required this.code,
    required this.success,
    required this.message,
  });

  factory CheckMusic.fromJson(Map<String, dynamic> json) {
    return CheckMusic(
      code: json['code'],
      success: json['success'],
      message: json['message'],
    );
  }
}
