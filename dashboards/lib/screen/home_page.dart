import 'package:dashboards/screen/piechart_page.dart';
import 'package:dashboards/screen/scatter_chart.dart';
import 'package:dashboards/util/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

import 'my_home.dart';

class MenuDashboardPage extends StatefulWidget {
  @override
  _MenuDashboardPageState createState() => _MenuDashboardPageState();
}

class _MenuDashboardPageState extends State<MenuDashboardPage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = [HomePage(), PieChartPage(), ScatterChartSample2()];
    return Scaffold(
        body: SafeArea(
            child: Stack(children: <Widget>[
      tabs[index],
      Positioned(
          bottom: 0,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              child: BottomNavigationBar(
                  currentIndex: index,
                  onTap: (value) {
                    setState(() {
                      index = value;
                    });
                  },
                  selectedItemColor: Colors.white,
                  unselectedItemColor: Colors.grey,
                  backgroundColor: const Color.fromARGB(200, 15, 15, 15),
                  items: const [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home), label: "Home"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.person), label: "Person"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.present_to_all), label: "Present"),
                  ]),
            ),
          )),
    ])));
  }
}
