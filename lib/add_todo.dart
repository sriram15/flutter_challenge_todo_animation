import 'dart:async';

import 'package:flutter/material.dart';

class AddTodoScreen extends StatefulWidget {
  @override
  _AddTodoScreenState createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  Future<bool> _onWillPop() {
    FocusScope.of(context).requestFocus(new FocusNode());
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    TextStyle buttonTextStyle = Theme.of(context).textTheme.title.copyWith(
        fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white);
    TextStyle hintTextStyle = Theme
        .of(context)
        .textTheme
        .title
        .copyWith(fontSize: 25.0, color: Colors.grey);
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                children: <Widget>[
                  TextField(
                    autofocus: true,
                    maxLines: 5,
                    decoration: InputDecoration.collapsed(
                        hintStyle: hintTextStyle,
                        hintText: 'What do you want to add now ?'),
                  ),
                ],
              ),
              Expanded(
                child: Container(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Hero(
                  tag: 'add_task',
                  child: ButtonTheme(
                    minWidth: double.infinity,
                    child: RaisedButton(
                      elevation: 10.0,
                      padding: const EdgeInsets.all(10.0),
                      color: Colors.blue,
                      onPressed: () {},
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
