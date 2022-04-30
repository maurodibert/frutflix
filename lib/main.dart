import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:frutflix/firebase_options.dart';
import 'package:http_service/http_service.dart';

import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final authenticationRepository = AuthenticationRepository();
  await authenticationRepository.user.first;
  final dio = Dio();
  final httpService = HttpService(httpClient: dio);

  BlocOverrides.runZoned(
    () => runApp(
      App(
        authenticationRepository: authenticationRepository,
        httpService: httpService,
      ),
    ),
  );
}
