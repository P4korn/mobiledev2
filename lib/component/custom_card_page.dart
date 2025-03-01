import 'package:flutter/material.dart';
import 'package:mobiledev2/component/custom_card.dart';

class CustomerCardTest extends StatefulWidget {
  const CustomerCardTest({super.key});

  @override
  State<CustomerCardTest> createState() => _CustomerCardTestState();
}

class _CustomerCardTestState extends State<CustomerCardTest> {
  Color winPlayerColor = Colors.white;
  void setWinPlayerColor(Color winColor) {
    setState(() {
      winPlayerColor = winColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: winPlayerColor,
      appBar: AppBar(title: const Text('Custom Widget')),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        CustomCounterWidget(
          title: 'Team A',
          backgroundColor: Colors.red,
          onPlayerWin: setWinPlayerColor,
        ),
        const SizedBox(height: 10),
        CustomCounterWidget(
          title: 'Team B',
          backgroundColor: Colors.blue,
          onPlayerWin: setWinPlayerColor,
        ),
      ])),
    );
  }
}
