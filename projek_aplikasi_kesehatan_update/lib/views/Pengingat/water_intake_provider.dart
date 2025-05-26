import 'package:flutter/material.dart';

class WaterIntakeProvider extends InheritedWidget {
  final int maxWaterIntake;
  final int currentWaterIntake;
  final Widget child;

  WaterIntakeProvider({
    required this.maxWaterIntake,
    required this.currentWaterIntake,
    required this.child,
  }) : super(child: child);

  static WaterIntakeProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<WaterIntakeProvider>();
  }

  @override
  bool updateShouldNotify(WaterIntakeProvider oldWidget) {
    return oldWidget.maxWaterIntake != maxWaterIntake ||
        oldWidget.currentWaterIntake != currentWaterIntake;
  }
}