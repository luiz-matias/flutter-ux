import 'package:flutter/material.dart';
import 'package:flutter_bloc_app/models/user.dart';

class UserInfo extends StatefulWidget {
  final User _user;

  UserInfo(this._user);

  @override
  _UserInfoState createState() => _UserInfoState(_user);
}

class _UserInfoState extends State<UserInfo> {
  final User _user;

  _UserInfoState(this._user);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 128,
          height: 128,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(_user.profilePictureUrl),
                fit: BoxFit.contain,
              ),
              border: Border.all(
                color: Colors.blueAccent,
                width: 2,
              ),
              borderRadius: BorderRadius.all(Radius.circular(100))),
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          _user.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          "${_user.age} years old",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
