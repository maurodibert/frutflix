import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frutflix/app/app.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    User user = context.select((AppBloc appBloc) => appBloc.state.user);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            key: const Key('homePage_logout_iconButton'),
            icon: const Icon(Icons.exit_to_app),
            onPressed: () => context.read<AppBloc>().add(AppLogoutRequested()),
          )
        ],
      ),
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('user: ${user.name}',
              style: Theme.of(context).textTheme.headline4),
          Text('email: ${user.email}',
              style: Theme.of(context).textTheme.headline6),
        ],
      )),
    );
  }
}
