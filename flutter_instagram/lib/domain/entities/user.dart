class User {
  int id;
  String username;
  String user;
  String profilePicture;

  User({this.id, this.username, this.user, this.profilePicture});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    user = json['user'];
    profilePicture = json['profile_picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['user'] = this.user;
    data['profile_picture'] = this.profilePicture;
    return data;
  }
}