import 'package:anim_challenge_todo/add_todo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Challenge',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => TodoAppHome(title: 'Flutter UI Challenge'),
        '/addTodo': (context) => AddTodoScreen()
      },
    );
  }
}

class TodoAppHome extends StatefulWidget {
  final String title;
  TodoAppHome({this.title});

  @override
  _TodoAppHomeState createState() => _TodoAppHomeState();
}

class _TodoAppHomeState extends State<TodoAppHome> {
  @override
  Widget build(BuildContext context) {
    TextStyle titleTextStyle =
        Theme.of(context).textTheme.title.copyWith(fontSize: 30.0);
    TextStyle subtitleTextStyle = Theme
        .of(context)
        .textTheme
        .title
        .copyWith(fontSize: 20.0, color: Colors.grey);

    return Scaffold(
      backgroundColor: Colors.grey[200],
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        heroTag: 'add_task',
        onPressed: () {
          Navigator.push(
            context,
            new MyCustomRoute(builder: (context) => new AddTodoScreen()),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Container(
        margin: const EdgeInsets.only(top: 22.0),
        child: Column(
          children: <Widget>[
            _buildHeaderRow(titleTextStyle, subtitleTextStyle),
            new TodoItemCard(
                titleText: 'Complete ten push-ups', subtitle: 'Due Fri Aug 10'),
            new TodoItemCard(
                titleText: 'Meeting with Client', subtitle: 'Due Sun Aug 12'),
            new TodoItemCard(
                titleText: 'Interview Candidate', subtitle: 'Due Mon Aug 13')
          ],
        ),
      ),
    );
  }

  Row _buildHeaderRow(TextStyle titleText, TextStyle subtitleText) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Welcome Sriram",
                style: titleText,
              ),
              Text(
                "You have 3 tasks",
                style: subtitleText,
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(),
        ),
        Container(
          padding: const EdgeInsets.all(10.0),
          margin: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              border: Border.all(
                width: 1.0,
              ),
              borderRadius: BorderRadius.all(Radius.circular(50.0))),
          child: Icon(
            Icons.person,
            size: 40.0,
          ),
        )
      ],
    );
  }
}

class TodoItemCard extends StatelessWidget {
  const TodoItemCard({
    Key key,
    @required this.subtitle,
    @required this.titleText,
  }) : super(key: key);

  final String subtitle, titleText;
  @override
  Widget build(BuildContext context) {
    TextStyle cardTitleTextStyle =
        Theme.of(context).textTheme.title.copyWith(fontSize: 20.0);
    TextStyle subtitleTextStyle = Theme
        .of(context)
        .textTheme
        .title
        .copyWith(fontSize: 20.0, color: Colors.grey);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 2.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    titleText,
                    style: cardTitleTextStyle,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      subtitle,
                      style: subtitleTextStyle,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(),
              ),
              Icon(Icons.timer)
            ],
          ),
        ),
      ),
    );
  }
}

class MyCustomRoute<T> extends CupertinoPageRoute<T> {
  MyCustomRoute({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  bool get fullscreenDialog => true;
  
  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);
}
