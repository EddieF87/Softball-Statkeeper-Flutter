import 'package:flutter/material.dart';
import 'package:sleekstats_flutter_statkeeper/statkeeper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Sleek Stats Softball Lite'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<StatKeeper> myList = new List<StatKeeper>();

  void addList() {
    List<String> list = new List<String>();
    list.add("Player 1");
    list.add("Team 2");
    list.add("League 3");
    for (int i = 0; i < list.length; i++) {
      myList.add(StatKeeper(name: list[i]));
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
      body: Center(
        child: Container(
          child: _buildStatKeeperWidgets(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
//        onPressed: ,
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
