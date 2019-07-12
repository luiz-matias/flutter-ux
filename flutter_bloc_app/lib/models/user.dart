import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class User extends Equatable {
  String name;
  int age;
  String profilePictureUrl;

  User({
    @required this.name,
    @required this.age,
    @required this.profilePictureUrl,
  }) : super([name, age, profilePictureUrl]);
}
