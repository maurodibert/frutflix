import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frutflix/routes/routes.dart';
import 'package:frutflix/ui.dart';
import 'package:frutflix/views/login/login.dart';
import 'package:http_service/http_service.dart';

import '../../app_user/views/products/products.dart';
import '../auth_bloc/auth_bloc.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
    required HttpService httpService,
    required AuthenticationRepository authenticationRepository,
  })  : _httpService = httpService,
        _authenticationRepository = authenticationRepository,
        super(key: key);
  final HttpService _httpService;
  final AuthenticationRepository _authenticationRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider.value(value: _authenticationRepository),
          RepositoryProvider.value(value: _httpService),
        ],
        child: MultiBlocProvider(providers: [
          BlocProvider.value(
              value:
                  AuthBloc(authenticationRepository: _authenticationRepository))
        ], child: const AppView()));
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
      home: context.select((AuthBloc bloc) => bloc.state.status) ==
              AppStatus.authenticated
          ? const ProductsPage()
          : const LoginPage(),
    );
  }
}
