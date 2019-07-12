import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_app/repository/user_repository_mock.dart';

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
      final user = await UserRepositoryMock().getUser();
      yield LoadedUserState(user);
    }
  }
}
