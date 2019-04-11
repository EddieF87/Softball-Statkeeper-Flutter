import 'package:flutter/material.dart';
import 'package:sleekstats_flutter_statkeeper/model/statkeeper.dart';
import 'package:sleekstats_flutter_statkeeper/widget/statkeeper_label.dart';

class HomeRoute extends StatefulWidget {
  HomeRoute({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeRouteState createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  List<StatKeeperLabel> myList = new List<StatKeeperLabel>();

  void addList() {
    var playerSK = new StatKeeper(id: "11", name: "Eddie F", type: SKType.PLAYER, level: 1);
    var teamSK = new StatKeeper(id: "11", name: "Bears", type: SKType.TEAM, level: 1);
    var leagueSK = new StatKeeper(id: "11", name: "Pacific League", type: SKType.LEAGUE, level: 2);
    List<StatKeeper> skList = new List<StatKeeper>();
    skList.add(playerSK);
    skList.add(teamSK);
    skList.add(leagueSK);
    for (int i = 0; i < skList.length; i++) {
      myList.add(StatKeeperLabel(statKeeper: skList[i],));
    }
  }

  Widget _buildStatKeeperWidgets() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => myList[index],
      itemCount: myList.length,
    );
  }

  @override
  void initState() {
    super.initState();
    addList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: _buildStatKeeperWidgets(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
