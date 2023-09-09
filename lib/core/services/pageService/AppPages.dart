import 'package:bloc_pagination/features/product/presentation/bloc/product_bloc.dart';
import 'package:bloc_pagination/features/product/presentation/pages/product_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    print('AppPages.generateRoute for ${routeSettings.name}');
    switch (routeSettings.name) {
      case _Paths.VIDEO_PAGE:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => ProductBloc(),
            child: const ProductPage(),
          ),
          settings: routeSettings,
        );

      default:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => ProductBloc(),
            child: const ProductPage(),
          ),
          settings: routeSettings,
        );
    }
  }
}
