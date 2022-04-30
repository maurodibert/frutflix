import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frutflix/app/app.dart';
import 'package:frutflix/widgets/widgets.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key}) : super(key: key);
  static const String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    User user = context.select((AuthBloc appBloc) => appBloc.state.user);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos'),
        actions: [
          IconButton(
            key: const Key('homePage_logout_iconButton'),
            icon: const Icon(Icons.exit_to_app),
            onPressed: () =>
                context.read<AuthBloc>().add(AuthLogoutRequested()),
          )
        ],
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: ((context, index) {
            return GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'product'),
              child: const AppCard(
                topTagText: '\$450',
                bottomTagTitle: 'Bananas Argentinas',
                bottomTagSubtitle: 'Salteña',
                bottomTagDescription: 'Dejar fuera de heladera hasta madurar',
                networkImageUrl:
                    'https://d3ugyf2ht6aenh.cloudfront.net/stores/336/406/products/friends-s-11-7e885c70bf8fcc9f6515132990317982-1024-1024.jpg',
              ),
            );
          })),
    );
  }
}
