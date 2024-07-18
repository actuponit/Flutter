import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class LineChartWidget extends StatelessWidget {
  final Color color;
  LineChartWidget(this.color);
  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        gridData: FlGridData(
          drawHorizontalLine: true,
          drawVerticalLine: false,
          getDrawingHorizontalLine: (value) =>
              FlLine(color: color.withOpacity(0.5), dashArray: [1, 0]),
          checkToShowHorizontalLine: (value) => value == 0,
        ),
        titlesData: const FlTitlesData(show: false),
        borderData: FlBorderData(show: false),
        lineBarsData: [
          LineChartBarData(
            spots: const [
              FlSpot(0, 1),
              FlSpot(1, 1.5),
              FlSpot(2, 2),
              FlSpot(3, 1.8),
              FlSpot(4, -2.2),
              FlSpot(5, 2.5),
            ],
            isCurved: true,
            color: color.withOpacity(0.8),
            dotData: FlDotData(show: false),
            belowBarData: BarAreaData(show: false),
          ),
        ],
      ),
    );
  }
}
