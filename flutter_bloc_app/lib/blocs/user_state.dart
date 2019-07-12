import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_app/models/user.dart';
import 'package:meta/meta.dart';

@immutable
abstract class UserState extends Equatable {
  UserState([List props = const []]) : super(props);
}

class InitialUserState extends UserState {}

class LoadingUserState extends UserState {}

class LoadedUserState extends UserState {
  final User user;

  LoadedUserState(this.user) : super([user]);
}
