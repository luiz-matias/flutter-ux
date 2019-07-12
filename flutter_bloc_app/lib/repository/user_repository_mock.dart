import 'dart:math';

import 'package:flutter_bloc_app/models/user.dart';
import 'package:flutter_bloc_app/repository/user_repository.dart';

class UserRepositoryMock implements UserRepository {

  static final UserRepositoryMock _singleton = new UserRepositoryMock._internal();

  factory UserRepositoryMock() {
    return _singleton;
  }

  UserRepositoryMock._internal();

  @override
  Future<User> getUser() {
    return Future.delayed(Duration(seconds: 1), () {
      int randomNumber = 1 + Random().nextInt(30);
      String profilePicture =
          "https://randomuser.me/api/portraits/men/$randomNumber.jpg";
      return User(
          name: "Luiz Matias", age: 20 + Random().nextInt(15), profilePictureUrl: profilePicture);
    });
  }
}
