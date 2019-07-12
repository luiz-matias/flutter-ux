import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/blocs/bloc.dart';

import 'UserInfo.dart';

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
    return Center(
      child: BlocListener(
        bloc: _userBloc,
        listener: (BuildContext context, UserState state) {
          if (state is LoadedUserState) {
            print("User refreshed!");
            return Scaffold.of(context).showSnackBar(SnackBar(
              content: Text(
                "User refreshed!",
                textAlign: TextAlign.center,
              ),
              duration: Duration(seconds: 2),
            ));
          }
        },
        child: BlocBuilder(
          bloc: _userBloc,
          builder: (BuildContext context, UserState state) {
            if (state is InitialUserState) {
              return _initialState();
            } else if (state is LoadingUserState) {
              return _loading();
            } else if (state is LoadedUserState) {
              return UserInfo(state.user);
            }
          },
        ),
      ),
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
