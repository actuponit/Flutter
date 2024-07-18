import 'package:dashboards/util/bar_graph.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../util/cards.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenWidth = size.width;
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: (screenWidth) * (1 / 2),
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: PageView(
            controller: PageController(viewportFraction: 0.9),
            scrollDirection: Axis.horizontal,
            pageSnapping: true,
            children: <Widget>[
              CardWidget(Colors.amber),
              CardWidget(Colors.lightBlue),
              CardWidget(Colors.purpleAccent),
            ],
          ),
        ),
        Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'User data in bar graph',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 20),
                Text(
                  '3745\$',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ],
            )),
        Container(
          height: 250,
          padding: const EdgeInsets.all(20),
          child: MyBarGraph(),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'List of users',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        SingleChildScrollView(
          child: Container(
            height: 200,
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) => ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Colors.redAccent,
                      ),
                      title: Text(
                        'Item $index',
                        style: TextStyle(
                            fontSize: 20,),
                      ),
                      trailing:
                          Text(DateTime.now().toString().substring(0, 10)),
                    )),
          ),
        ),
        const SizedBox(height: 60),
      ],
    ));
  }
}
