import 'package:flutter/material.dart';

class CatrgoryPage extends StatefulWidget {
  const CatrgoryPage({Key? key}) : super(key: key);

  @override
  _CatrgoryPageState createState() => _CatrgoryPageState();
}

class _CatrgoryPageState extends State<CatrgoryPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                Expanded(
                  child: TabBar(
                    indicatorSize: TabBarIndicatorSize.label,
                    tabs: [
                      Tab(
                        text: "热销1",
                      ),
                      Tab(
                        text: "热销2",
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          body: TabBarView(
            children: [
              ListView(
                children: [
                  ListTile(
                    title: Text("第一"),
                  )
                ],
              ),
              ListView(
                children: [
                  ListTile(
                    title: Text("第二"),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
