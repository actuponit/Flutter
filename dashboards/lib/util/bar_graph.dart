import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyBarGraph extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Data> datas = [
      Data(name: "First", val: 10),
      Data(name: "Second", val: 5),
      Data(name: "Third", val: 7),
      Data(name: "Fourth", val: 17),
      Data(name: "Fifth", val: 10),
      Data(name: "Sixth", val: 4),
      Data(name: "Seventh", val: 20),
    ];
    int index = -1;

    return BarChart(BarChartData(
      alignment: BarChartAlignment.center,
      maxY: 20,
      groupsSpace: (MediaQuery.of(context).size.width - 35 * 7) / 8,
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 40,
            getTitlesWidget: (value, meta) {
              // print(value.toInt());
              return Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    datas[value.toInt()].name,
                    style: Theme.of(context).textTheme.labelMedium,
                  ));
            },
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: (value, meta) {
              // print(value.toInt());
              return Text(
                "${value}k",
                style: Theme.of(context).textTheme.labelSmall,
              );
            },
          ),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      gridData: const FlGridData(show: false),
      barGroups: datas.map((data) {
        index += 1;
        return BarChartGroupData(x: index, barRods: [
          BarChartRodData(
            backDrawRodData: BackgroundBarChartRodData(
              show: true,
              color: Colors.grey.withOpacity(0.2),
            ),
            toY: data.val.toDouble(),
            width: 25,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            color: const Color.fromARGB(200, 15, 15, 15),
          )
        ]);
      }).toList(),
    ));
  }
}

class Data {
  int val;
  String name;
  Data({required this.name, required this.val});
}
