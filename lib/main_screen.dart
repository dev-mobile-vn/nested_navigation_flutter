import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:window_manager/window_manager.dart';

class MainScreen extends StatefulWidget {
  final Widget child;
  final String location;

  const MainScreen({super.key, required this.child, required this.location});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  final tabs = [
    "/dashboard",
    "/orders",
    "/categories",
    "/products",
    "/account",
    "/setting",
  ];

  @override
  void initState() {
    super.initState();
    currentIndex = tabs.indexWhere((tab) => widget.location.startsWith(tab));
    if (currentIndex == -1) currentIndex = 0;
  }

  @override
  void didUpdateWidget(covariant MainScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.location != widget.location) {
      setState(() {
        currentIndex = tabs.indexWhere(
          (tab) => widget.location.startsWith(tab),
        );
        if (currentIndex == -1) currentIndex = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          Row(
            children: [
              NavigationRail(
                backgroundColor: Colors.white,
                labelType: NavigationRailLabelType.all,
                destinations: const [
                  NavigationRailDestination(
                    icon: Icon(Icons.dashboard),
                    label: Text(
                      "Trang chủ",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.factory),
                    label: Text("Đơn hàng"),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.category),
                    label: Text("Danh mục"),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.category),
                    label: Text("Sản phẩm"),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.person),
                    label: Text("Tài khoản"),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.settings),
                    label: Text("Cài đặt"),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.logout),
                    label: Text("Đăng xuất"),
                  ),
                ],
                selectedIndex: currentIndex,
                onDestinationSelected: (index) async {
                  if (index == 6) {
                    await windowManager.setSize(const Size(400, 400));
                    await windowManager.setTitle('POS Login');
                    await windowManager.center();

                    context.go("/login");

                    return;
                  }
                  setState(() {
                    currentIndex = index;
                  });
                  context.go(tabs[index]);
                },
              ),
            ],
          ),

          Expanded(child: widget.child),
        ],
      ),
    );
  }
}
