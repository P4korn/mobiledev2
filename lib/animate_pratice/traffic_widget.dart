import 'package:flutter/material.dart';

class TrafficLightwidget extends StatefulWidget {
  final Color color;
  final double opacity;

  const TrafficLightwidget(
      {super.key, required this.color, required this.opacity});

  @override
  State<TrafficLightwidget> createState() => _TrafficLightwidgetState();
}

class _TrafficLightwidgetState extends State<TrafficLightwidget> {
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
        duration: const Duration(seconds: 1),
        opacity: widget.opacity,
        child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: widget.color,
              boxShadow: [
                BoxShadow(
                  color: widget.color.withOpacity(0.6),
                  spreadRadius: 6,
                  blurRadius: 8,
                  offset: Offset(0, 0),
                ),
              ],
            )));
  }
}
