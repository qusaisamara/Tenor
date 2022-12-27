// To parse this JSON data, do
//
//     final tenor = tenorFromJson(jsonString);

import 'dart:convert';

Tenor tenorFromJson(String str) => Tenor.fromJson(json.decode(str));

String tenorToJson(Tenor data) => json.encode(data.toJson());

class Tenor {
  Tenor({
    this.locale,
    required this.results,
    this.next,
  });

  String? locale;
  List<Result> results;
  String? next;

  factory Tenor.fromJson(Map<String, dynamic> json) => Tenor(
        locale: json["locale"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        next: json["next"],
      );

  Map<String, dynamic> toJson() => {
        "locale": locale,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "next": next,
      };
}

class Result {
  Result({
    required this.id,
    required this.title,
    required this.contentDescription,
    required this.contentRating,
    required this.h1Title,
    required this.media,
    required this.bgColor,
    required this.created,
    required this.itemurl,
    required this.url,
    required this.tags,
    required this.flags,
    required this.shares,
    required this.hasaudio,
    required this.hascaption,
    required this.sourceId,
    this.composite,
  });

  String id;
  String title;
  String contentDescription;
  String contentRating;
  String h1Title;
  List<dynamic> media;
  String bgColor;
  double created;
  String itemurl;
  String url;
  List<dynamic> tags;
  List<dynamic> flags;
  int shares;
  bool hasaudio;
  bool hascaption;
  String sourceId;
  dynamic composite;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        title: json["title"],
        contentDescription: json["content_description"],
        contentRating: json["content_rating"],
        h1Title: json["h1_title"],
        media: List<dynamic>.from(json["media"].map((x) => x)),

        // media: List<Map<String, Media>>.from(json["media"].map((x) =>
        //     Map.from(x)  .map((k, v) => MapEntry<String, Media>(k, Media.fromJson(v))))),
        bgColor: json["bg_color"],
        created: json["created"].toDouble(),
        itemurl: json["itemurl"],
        url: json["url"],
        tags: List<dynamic>.from(json["tags"].map((x) => x)),
        flags: List<dynamic>.from(json["flags"].map((x) => x)),
        shares: json["shares"],
        hasaudio: json["hasaudio"],
        hascaption: json["hascaption"],
        sourceId: json["source_id"],
        composite: json["composite"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content_description": contentDescription,
        "content_rating": contentRating,
        "h1_title": h1Title,
        "media": List<dynamic>.from(media.map((x) => x)),
        // "media": List<dynamic>.from(media.map((x) => Map.from(x)
        //     .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())))),
        "bg_color": bgColor,
        "created": created,
        "itemurl": itemurl,
        "url": url,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "flags": List<dynamic>.from(flags.map((x) => x)),
        "shares": shares,
        "hasaudio": hasaudio,
        "hascaption": hascaption,
        "source_id": sourceId,
        "composite": composite,
      };
}




