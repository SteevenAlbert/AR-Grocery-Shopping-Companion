import 'package:flutter/material.dart';

class ProductTabBar extends StatelessWidget {
  const ProductTabBar({super.key});
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        initialIndex: 1,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 10,
            backgroundColor: Color.fromARGB(255, 250, 250, 250),
            elevation: 0,
            bottom: TabBar(
                isScrollable: true,
                labelStyle: TextStyle(
                    fontFamily: "Ubuntu",
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
                unselectedLabelColor: Color.fromARGB(125, 0, 0, 0),
                unselectedLabelStyle: TextStyle(
                    fontFamily: "Ubuntu",
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
                labelPadding: EdgeInsets.symmetric(horizontal: 30.0),
                indicator: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color.fromARGB(255, 93, 201, 169),
                      Color.fromARGB(255, 95, 168, 145)
                    ]),
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.redAccent),
                tabs: [
                  Tab(
                    child: Text('Online Stores'),
                  ),
                  Tab(
                    child: Text('Nutritional Facts'),
                  ),
                  Tab(
                    child: Text('Reviews'),
                  ),
                ]),
          ),
          body: TabBarView(children: [
            SingleChildScrollView(
              child: Container(
                child: Center(
                  child: Column(
                    children: [
                      Text('Tab 1'),
                      Text('Tab 1'),
                      Text('Tab 1'),
                      Text('Tab 1'),
                      Text('Tab 1'),
                      Text('Tab 1'),
                      Text('Tab 1'),
                      Text('Tab 1'),
                      Text('Tab 1'),
                      Text('Tab 1'),
                      Text('Tab 1'),
                      Text('Tab 1'),
                      Text('Tab 1'),
                      Text('Tab 1'),
                      Text('Tab 1'),
                      Text('Tab 1'),
                      Text('Tab 1'),
                      Text('Tab 1'),
                      Text('Tab 1'),
                      Text('Tab 1'),
                      Text('Tab 1'),
                      Text('Tab 1'),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              child: Center(
                child: Text('Tab 2'),
              ),
            ),
            Container(
              child: Center(
                child: Text('Tab 3'),
              ),
            ),
          ]),
        ));
  }
}
