import 'package:dotted_border/dotted_border.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ScatterChartSample2 extends StatefulWidget {
  const ScatterChartSample2({super.key});

  @override
  State<StatefulWidget> createState() => _ScatterChartSample2State();
}

class _ScatterChartSample2State extends State {
  int touchedIndex = -1;

  Color greyColor = Colors.grey;

  List<int> selectedSpots = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(206, 10, 10, 10),
        body: Column(children: [
          Container(
              height: MediaQuery.of(context).size.height / 3,
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                      flex: 3,
                      child: Container(
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Colors.amber, Colors.white]),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                      )),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DottedBorder(
                        strokeWidth: 1.5,
                        color: Colors.white,
                        padding: const EdgeInsets.all(1),
                        dashPattern: const [5, 6],
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(18),
                        child: FloatingActionButton(
                          backgroundColor: Colors.white,
                          elevation: 0,
                          onPressed: () {},
                          child: const Icon(Icons.add),
                        ),
                      ),
                      FloatingActionButton(
                        elevation: 0,
                        onPressed: () {},
                        child: const Icon(Icons.book),
                      ),
                      FloatingActionButton(
                        elevation: 0,
                        onPressed: () {},
                        child: const Icon(Icons.book),
                      ),
                    ],
                  ))
                ],
              )),
          Expanded(
              child: Container(
            decoration: const BoxDecoration(
                gradient:
                    LinearGradient(colors: <Color>[Colors.white, Colors.white]),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                )),
            child: ScatterChart(
              ScatterChartData(
                scatterSpots: [
                  ScatterSpot(
                    4,
                    4,
                    color: selectedSpots.contains(0)
                        ? Colors.blue
                        : Colors.black.withOpacity(0.5),
                  ),
                  ScatterSpot(
                    2,
                    5,
                    color: selectedSpots.contains(1)
                        ? Colors.yellow
                        : Colors.black.withOpacity(0.5),
                    radius: 12,
                  ),
                  ScatterSpot(
                    4,
                    5,
                    color: selectedSpots.contains(2)
                        ? Colors.pink
                        : Colors.black.withOpacity(0.5),
                    radius: 8,
                  ),
                  ScatterSpot(
                    8,
                    6,
                    color: selectedSpots.contains(3)
                        ? Colors.orange
                        : Colors.black.withOpacity(0.5),
                    radius: 20,
                  ),
                  ScatterSpot(
                    5,
                    7,
                    color: selectedSpots.contains(4)
                        ? Colors.green
                        : Colors.black.withOpacity(0.5),
                    radius: 14,
                  ),
                  ScatterSpot(
                    7,
                    2,
                    color: selectedSpots.contains(5)
                        ? Colors.blue
                        : Colors.black.withOpacity(0.5),
                    radius: 18,
                  ),
                  ScatterSpot(
                    3,
                    2,
                    color: selectedSpots.contains(6)
                        ? Colors.blue
                        : Colors.black.withOpacity(0.5),
                    radius: 36,
                  ),
                  ScatterSpot(
                    2,
                    8,
                    color: selectedSpots.contains(7)
                        ? Colors.cyan
                        : Colors.black.withOpacity(0.5),
                    radius: 22,
                  ),
                ],
                minX: 0,
                maxX: 10,
                minY: 0,
                maxY: 10,
                borderData: FlBorderData(
                  show: false,
                ),
                gridData: FlGridData(
                  show: true,
                  drawHorizontalLine: true,
                  checkToShowHorizontalLine: (value) => true,
                  getDrawingHorizontalLine: (value) => const FlLine(
                    strokeWidth: 0.4,
                    color: Color.fromARGB(162, 102, 100, 100),
                  ),
                  drawVerticalLine: true,
                  checkToShowVerticalLine: (value) => true,
                  getDrawingVerticalLine: (value) => const FlLine(
                    strokeWidth: 0.4,
                    color: Color.fromARGB(162, 102, 100, 100),
                  ),
                ),
                titlesData: const FlTitlesData(
                  show: false,
                ),
                showingTooltipIndicators: selectedSpots,
                scatterTouchData: ScatterTouchData(
                  enabled: true,
                  handleBuiltInTouches: false,
                  mouseCursorResolver: (FlTouchEvent touchEvent,
                      ScatterTouchResponse? response) {
                    return response == null || response.touchedSpot == null
                        ? MouseCursor.defer
                        : SystemMouseCursors.click;
                  },
                  touchTooltipData: ScatterTouchTooltipData(
                    tooltipBgColor: Colors.black,
                    getTooltipItems: (ScatterSpot touchedBarSpot) {
                      return ScatterTooltipItem(
                        'X: ',
                        textStyle: TextStyle(
                          height: 1.2,
                          color: Colors.grey[100],
                          fontStyle: FontStyle.italic,
                        ),
                        bottomMargin: 10,
                        children: [
                          TextSpan(
                            text: '${touchedBarSpot.x.toInt()} \n',
                            style: const TextStyle(
                              color: Colors.white,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: 'Y: ',
                            style: TextStyle(
                              height: 1.2,
                              color: Colors.grey[100],
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          TextSpan(
                            text: touchedBarSpot.y.toInt().toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  touchCallback: (FlTouchEvent event,
                      ScatterTouchResponse? touchResponse) {
                    if (touchResponse == null ||
                        touchResponse.touchedSpot == null) {
                      return;
                    }
                    if (event is FlTapUpEvent) {
                      final sectionIndex = touchResponse.touchedSpot!.spotIndex;
                      setState(() {
                        if (selectedSpots.contains(sectionIndex)) {
                          selectedSpots.remove(sectionIndex);
                        } else {
                          selectedSpots.add(sectionIndex);
                        }
                      });
                    }
                  },
                ),
              ),
            ),
          ))
        ]));
  }
}
