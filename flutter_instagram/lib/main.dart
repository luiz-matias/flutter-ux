import 'package:flutter/material.dart';
import 'package:flutter_instagram/pages/story/user_stories_page.dart';
import 'domain/entities/story.dart';
import 'pages/main_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Own Instagram!',
      theme: ThemeData(primarySwatch: Colors.grey, accentColor: Colors.blue),
      home: MainPage(),
      onGenerateRoute: (RouteSettings settings) {
        var routes = <String, WidgetBuilder>{
          "/story": (_) => UserStoriesPage(stories: settings.arguments)
        };
        WidgetBuilder builder = routes[settings.name];
        return MaterialPageRoute(builder: (context) => builder(context));
      },
    );
  }
}
