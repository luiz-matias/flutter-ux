import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_app/models/user.dart';

import './bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  @override
  UserState get initialState => InitialUserState();

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is GetRandomUser) {
      yield LoadingUserState();
      final user = await getRandomUser();
      yield LoadedUserState(user);
    }
  }

  Future<User> getRandomUser() {
    return Future.delayed(Duration(seconds: 1), () {
      int randomNumber = 1 + Random().nextInt(30);
      String profilePicture =
          "https://randomuser.me/api/portraits/men/$randomNumber.jpg";
      return User(
          name: "Luiz Matias", age: 20, profilePictureUrl: profilePicture);
    });
  }
}
