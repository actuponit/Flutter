import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieChartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        sections: [
          PieChartSectionData(
            title: "",
            radius: 100,
            value: 45,
            color: Colors.amber.withOpacity(0.4),
          ),
          PieChartSectionData(
            title: "",
            radius: 100,
            value: 25,
            color: Colors.lightBlue.withOpacity(0.4),
          ),
          PieChartSectionData(
            title: "",
            radius: 100,
            value: 20,
            color: Colors.purpleAccent.withOpacity(0.4),
          ),
        ],
        sectionsSpace: 0,
        centerSpaceRadius: 40,
      ),
    );
  }
}
