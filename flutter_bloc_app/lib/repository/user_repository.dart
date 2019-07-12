import 'package:flutter_bloc_app/models/user.dart';

abstract class UserRepository {

  Future<User> getUser();

}
