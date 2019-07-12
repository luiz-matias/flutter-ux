import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/blocs/bloc.dart';
import 'package:flutter_bloc_app/models/user.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final UserBloc _userBloc = UserBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter BLoC"),
        centerTitle: true,
      ),
      body: _body(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () => _userBloc.dispatch(GetRandomUser()),
      ),
    );
  }

  Widget _body() {
    return SizedBox.expand(
      child: Center(
        child: BlocBuilder(
          bloc: _userBloc,
          builder: (BuildContext context, UserState state) {
            if (state is InitialUserState) {
              return _initialState();
            } else if (state is LoadingUserState) {
              return _loading();
            } else if (state is LoadedUserState) {
              return _userProfile(state.user);
            }
          },
        ),
      ),
    );
  }

  _userProfile(User data) {
    print("Profile picture Url: " + data.profilePictureUrl);
    return Column(
      children: <Widget>[
        Image.network(
          data.profilePictureUrl,
          width: 128,
          height: 128,
          fit: BoxFit.contain,
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          data.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          "${data.age} anos",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  _loading() {
    return CircularProgressIndicator();
  }

  @override
  void dispose() {
    super.dispose();
    _userBloc.dispose();
  }

  Widget _initialState() {
    return Text("Click on the fab button to refresh the user data!");
  }
}
