import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: WidgetNavigationRail(),
    );
  }
}

class WidgetNavigationRail extends StatefulWidget {
  const WidgetNavigationRail({Key? key}) : super(key: key);

  @override
  State<WidgetNavigationRail> createState() => _WidgetNavigationRailState();
}

class _WidgetNavigationRailState extends State<WidgetNavigationRail> {
  int indexValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: indexValue,
            onDestinationSelected: (int index) {
              setState(() {
                indexValue = index;
              });
            },
            labelType: NavigationRailLabelType.selected,
            destinations: const <NavigationRailDestination>[
              NavigationRailDestination(
                icon: Icon(Icons.beach_access_outlined ),
                selectedIcon: Icon(Icons.favorite),
                label: Text('Dia'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.backup_outlined ),
                selectedIcon: Icon(Icons.backup_rounded ),
                label: Text('Nublado'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.star_border),
                selectedIcon: Icon(Icons.star),
                label: Text('Noite'),
              ),
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height * 1,
            width: MediaQuery.of(context).size.width * 0.815,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/img/$indexValue.png"),
                  fit: BoxFit.cover),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 30,
                  color: Colors.amber,
                  child: Center(child: Text('Valor: $indexValue')),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
