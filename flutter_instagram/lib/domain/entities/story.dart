import 'user.dart';

class Story {
  int id;
  int duration;
  User user;
  int postedAt;
  String content;
  int contentType;
  bool seen;

  Story(
      {this.id,
      this.duration,
      this.user,
      this.postedAt,
      this.content,
      this.contentType,
      this.seen});

  Story.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    duration = json['duration'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    postedAt = json['posted_at'];
    content = json['content'];
    contentType = json['content_type'];
    seen = json['seen'];
  }

  get postedAtInHumanFormat {
    Duration time = DateTime.now()
        .difference(DateTime.fromMillisecondsSinceEpoch(postedAt));
    if (time.inHours >= 1) {
      return "${time.inHours} h";
    }
    if (time.inMinutes >= 1) {
      return "${time.inMinutes} min";
    }
    return "${time.inSeconds} s";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['duration'] = this.duration;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    data['posted_at'] = this.postedAt;
    data['content'] = this.content;
    data['content_type'] = this.contentType;
    data['seen'] = this.seen;
    return data;
  }
}
