import 'package:flutter/material.dart';

class BNavBar extends StatelessWidget {
  const BNavBar({super.key});

  @override
  Widget build(BuildContext context) => Positioned(
      bottom: 0,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          child: BottomNavigationBar(
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey,
              backgroundColor: const Color.fromARGB(200, 15, 15, 15),
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: "Person"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.present_to_all), label: "Present"),
              ]),
        ),
      ));
}
