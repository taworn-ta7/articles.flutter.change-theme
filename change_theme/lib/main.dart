import 'package:flutter/material.dart';
import './drawer.dart';
import './common.dart';
import './settings.dart';

void main() => runApp(const App());

// ----------------------------------------------------------------------

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();

  static void refresh(BuildContext context) =>
      context.findAncestorStateOfType<_AppState>()?.refresh();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Common.instance().currentTheme,
      ),
      routes: {
        '/': (context) => const HomePage(),
        '/settings': (context) => const SettingsPage(),
      },
      initialRoute: '/',
      title: 'Change Theme',
    );
  }

  void refresh() => setState(() {});
}

// ----------------------------------------------------------------------

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Hello, world :)'),
            ],
          ),
        ),
      ),
    );
  }
}
