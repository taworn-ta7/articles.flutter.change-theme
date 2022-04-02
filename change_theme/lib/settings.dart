import 'package:flutter/material.dart';
import './drawer.dart';
import './common.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: _buildColorButtons(context, 0, 4)),
              Row(children: _buildColorButtons(context, 4, 8)),
              Row(children: _buildColorButtons(context, 8, 12)),
              Row(children: _buildColorButtons(context, 12, 16)),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildColorButtons(
    BuildContext context,
    int start,
    int end,
  ) {
    const text = Text('    ');
    final result = <Widget>[];
    for (var i = start; i < end; i++) {
      final color = Common.themeList[i];
      result.add(
        ElevatedButton(
          style: ElevatedButton.styleFrom(primary: color),
          child: const Padding(
            padding: EdgeInsets.all(12),
            child: text,
          ),
          onPressed: () => _changeColorTheme(i),
        ),
      );
    }
    return result;
  }

  Future<void> _changeColorTheme(int index) async {
    Common.instance().changeTheme(context, index);
  }
}
