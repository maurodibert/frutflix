import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frutflix/routes/routes.dart';
import 'package:frutflix/ui.dart';
import 'package:frutflix/views/login/login.dart';

import '../../app_user/views/home/home.dart';
import '../bloc/app_bloc.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(key: key);

  final AuthenticationRepository _authenticationRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authenticationRepository,
      child: BlocProvider(
        create: (context) =>
            AppBloc(authenticationRepository: _authenticationRepository),
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: UI.lightTheme,
      debugShowCheckedModeBanner: false,
      routes: AppRoutes.routes,
      home: context.select((AppBloc bloc) => bloc.state.status) ==
              AppStatus.authenticated
          ? const HomePage()
          : const LoginPage(),
    );
  }
}
