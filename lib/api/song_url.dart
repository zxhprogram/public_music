import 'dart:convert';

import 'package:dio/dio.dart';

Future<SongUrl> song_url(String id) async {
  var dio = Dio();
  var res = await dio.get(
    'https://ibhglpfbyfma.ap-northeast-1.clawcloudrun.com/song/url?id=$id',
  );
  var songUrl = SongUrl.fromJson(res.data);
  return songUrl;
}

void main(List<String> args) {
  song_url('33894312');
}

class SongUrl {
  int? code;
  List<Data>? data;

  SongUrl({this.code, this.data});

  SongUrl.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? url;

  Data({this.id, this.url});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;

    return data;
  }
}
