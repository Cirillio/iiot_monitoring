import 'package:flutter/material.dart';
import 'package:exui/exui.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FilledButton.icon(
        onPressed: () {},
        label: const Text('label'),
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.pressed)) {
              return Theme.of(context).colorScheme.error;
            }
            return Colors.black;
          }),
        ),
      ).center(),
    );
  }
}
