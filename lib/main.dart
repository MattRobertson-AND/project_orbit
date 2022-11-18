import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_orbit/models/theme_provider.dart';

import 'profile_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<Pair<ThemeData, ThemeData>> theme = ref.watch(themeProvider);

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Project Orbit',
        theme: theme.when(
            data: (theme) => theme.first,
            error: (_, __) => ThemeData.light(),
            loading: () => ThemeData.light()),
        themeMode: ThemeMode.system,
        darkTheme: theme.when(
            data: (theme) => theme.second,
            error: (_, __) => ThemeData.dark(),
            loading: () => ThemeData.dark()),
        home: const SafeArea(child: HomePage()));
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>()
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          final isFirstRouteInCurrentTab =
              !await _navigatorKeys[_selectedIndex].currentState!.maybePop();
          return isFirstRouteInCurrentTab;
        },
        child: Scaffold(
            body: Stack(children: [
              _buildOffstageNavigator(0),
              _buildOffstageNavigator(1),
              _buildOffstageNavigator(2)
            ]),
            bottomNavigationBar: BottomNavigationBar(
                currentIndex: _selectedIndex,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: "Home"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.more), label: "More"),
                  BottomNavigationBarItem(icon: Icon(Icons.edit), label: "Edit")
                ],
                onTap: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                })));
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context, int index) {
    return {
      '/': (context) {
        return [const ProfilePage(), const Text("More"), const Text("Edit")]
            .elementAt(index);
      },
    };
  }

  Widget _buildOffstageNavigator(int index) {
    var routeBuilders = _routeBuilders(context, index);

    return Offstage(
        offstage: _selectedIndex != index,
        child: Navigator(
          key: _navigatorKeys[index],
          onGenerateRoute: (routeSettings) {
            return MaterialPageRoute(
              builder: (context) => routeBuilders[routeSettings.name]!(context),
            );
          },
        ));
  }
}
