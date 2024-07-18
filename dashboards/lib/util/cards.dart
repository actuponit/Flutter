import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'line_graph.dart';

class CardWidget extends StatelessWidget {
  final Color color;
  CardWidget(this.color);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: color.withOpacity(0.4),
          borderRadius: BorderRadius.circular(35),
        ),
        width: MediaQuery.of(context).size.width - 30,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Sales",
                    style: GoogleFonts.eduSaBeginner(
                        fontSize: 12, fontStyle: FontStyle.italic),
                  ),
                  Container(
                    decoration: BoxDecoration(color: color.withOpacity(0.8)),
                    padding: const EdgeInsets.all(3),
                    child: const Icon(
                      Icons.timeline_outlined,
                      size: 25,
                    ),
                  ),
                ],
              ),
              Text(
                "30456\$",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Expanded(
                child: LineChartWidget(color),
              )
            ]));
  }
}
