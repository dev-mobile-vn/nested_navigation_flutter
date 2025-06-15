import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nested_navigation_flutter/account_page.dart';
import 'package:nested_navigation_flutter/dashboard_page.dart';
import 'package:nested_navigation_flutter/login_page.dart';
import 'package:nested_navigation_flutter/main_screen.dart';
import 'package:nested_navigation_flutter/orders_page.dart';
import 'package:nested_navigation_flutter/product_detail_page.dart';
import 'package:nested_navigation_flutter/products_page.dart';
import 'package:nested_navigation_flutter/setting_page.dart';
import 'package:window_manager/window_manager.dart';
import 'categories_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = WindowOptions(
    size: const Size(400, 400),
    center: true,
    title: "Tiki Pos",
  );

  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Tiki Pos',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routerConfig: GoRouter(
        initialLocation: "/login",
        routes: [
          GoRoute(path: "/login", builder: (context, state) => LoginPage()),
          ShellRoute(
            builder: (context, state, child) {
              return MainScreen(location: state.matchedLocation, child: child);
            },
            routes: [
              GoRoute(
                path: "/dashboard",
                builder: (context, state) => DashboardPage(),
              ),
              GoRoute(
                path: "/categories",
                builder: (context, state) => CategoriesPage(),
              ),
              GoRoute(
                path: "/products",
                builder: (context, state) => ProductsPage(),
              ),
              GoRoute(
                path: "/orders",
                builder: (context, state) => OrdersPage(),
              ),
              GoRoute(
                path: "/account",
                builder: (context, state) => AccountPage(),
              ),
              GoRoute(
                path: "/setting",
                builder: (context, state) => SettingPage(),
              ),
            ],
          ),
          GoRoute(
            path: '/products/detail/:id',
            builder: (context, state) {
              final id = state.pathParameters['id'] as String;
              return ProductDetailPage(id: id);
            },
          ),
        ],
      ),
    );
  }
}
