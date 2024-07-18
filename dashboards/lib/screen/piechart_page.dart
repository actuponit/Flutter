import 'package:dashboards/util/pie_chart.dart';
import 'package:flutter/material.dart';

class PieChartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Color.fromRGBO(216, 216, 216, 0.973),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 2 / 3,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Column(children: [
                  Expanded(
                    flex: 3,
                    child: PieChartWidget(),
                  ),
                  Expanded(
                      child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                              radius: 10,
                              backgroundColor: Colors.amber.withOpacity(0.4)),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text("Offline Sales")
                        ],
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                              radius: 10,
                              backgroundColor:
                                  Colors.purpleAccent.withOpacity(0.4)),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text("Online Sales")
                        ],
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                              radius: 10,
                              backgroundColor:
                                  Colors.lightBlue.withOpacity(0.4)),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text("Other sales")
                        ],
                      ),
                    ],
                  ))
                ]),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  "List of items",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  height: (MediaQuery.of(context).size.height / 3),
                  child: ListView.builder(
                    itemCount: 6,
                    itemBuilder: (context, index) => Card(
                        color: Colors.white,
                        margin: const EdgeInsets.all(10),
                        child: ListTile(
                          leading: const CircleAvatar(
                            backgroundColor: Colors.black,
                          ),
                          title: Text('Item $index'),
                          trailing:
                              Text(DateTime.now().toString().substring(0, 10)),
                        )),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ));
}
