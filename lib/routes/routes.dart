import 'package:flutter/material.dart';
import 'package:frutflix/app_user/views/products/products.dart';
import 'package:frutflix/views/login/login.dart';
import 'package:frutflix/views/sign_up/sign_up.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes =
      <String, WidgetBuilder>{
    ProductsPage.routeName: (_) => const ProductsPage(),
    ProductPage.routeName: (_) => const ProductPage(),
    LoginPage.routeName: (_) => const LoginPage(),
    SignUpPage.routeName: (_) => const SignUpPage(),
  };
}
