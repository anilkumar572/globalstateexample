import 'package:flutter/material.dart';
import 'package:funfacts/provier/themeswicher.dart';
import 'package:provider/provider.dart';

class ThemeSwitcher extends StatefulWidget {
  const ThemeSwitcher({super.key});

  @override
  State<ThemeSwitcher> createState() => _ThemeSwitcherState();
}

class _ThemeSwitcherState extends State<ThemeSwitcher> {
  @override
  Widget build(BuildContext context) {
    var theProvier = Provider.of<Themeswitch>(context);
    return Column(
      children: [
        Row(
          children: [
            Switch(
                value: theProvier.ischecked,
                onChanged: (value) {
                  theProvier.isChecked(data: value);
                }),
            SizedBox(
              width: 10,
            ),
            Text(theProvier.ischecked ? 'Dark mode' : 'Light mode'),
          ],
        ),
      ],
    );
  }
}
