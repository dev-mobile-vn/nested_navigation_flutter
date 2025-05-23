import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
    "account",
    "setting",
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
      body: Row(
        children: [
          Row(
            children: [
              NavigationRail(
                labelType: NavigationRailLabelType.all,
                destinations: const [
                  NavigationRailDestination(
                    icon: Icon(Icons.dashboard),
                    label: Text(
                      "Dashboard",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.factory),
                    label: Text("Order"),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.category),
                    label: Text("Category"),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.category),
                    label: Text("Product"),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.person),
                    label: Text("Account"),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.settings),
                    label: Text("Setting"),
                  ),
                ],
                selectedIndex: currentIndex,
                onDestinationSelected: (index) {
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
