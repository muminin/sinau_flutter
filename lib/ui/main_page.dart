import 'dart:math';

import 'package:belajar_flutter/bloc/user_bloc.dart';
import 'package:belajar_flutter/ui/user_card.dart';
import 'package:flutter/material.dart';
import 'package:belajar_flutter/model/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  final Random random = Random();

  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text("53. MVVM Architecture"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 10,
            ),
            child: ElevatedButton(
              onPressed: () {
                userBloc.add(random.nextInt(10) + 1);
              },
              child: Text("Pick random User"),
            ),
          ),
          BlocBuilder<UserBloc, User>(
            builder: (context, user) =>
                (user is UnitializedUser) ? Container() : UserCard(user),
          ),
        ],
      ),
    );
  }
}
