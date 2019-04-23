import 'package:flutter/material.dart';
import 'package:sleekstats_flutter_statkeeper/database/repository_service_statkeepers.dart';
import 'package:sleekstats_flutter_statkeeper/model/statkeeper.dart';
import 'package:sleekstats_flutter_statkeeper/widget/statkeeper_creator_dialog.dart';
import 'package:sleekstats_flutter_statkeeper/widget/statkeeper_label.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<StatKeeper> sKList = [];

  @override
  void initState() {
    super.initState();
    _getAllStatKeepers();
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
        onPressed: _showCreateSKDialog,
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildStatKeeperWidgets() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => StatKeeperLabel(
            statKeeper: sKList[index],
          ),
      itemCount: sKList.length,
    );
  }

  ///Query statkeepers from repository
  _getAllStatKeepers() async {
    sKList = await RepositoryServiceStatKeepers.getAllStatKeepers();
    setState(() {
      sKList = sKList;
    });
  }

  ///Insert newly created statkeeper into repository
  _insertNewStatKeeper(StatKeeper sK) async {
    await RepositoryServiceStatKeepers.insertStatKeeper(sK);

    setState(() {
      sKList.add(sK);
    });
  }

  ///Callback received from CreateStatKeeperDialog with info of new StatKeeper
  _onNewSKCreated(StatKeeper sK) {
    _insertNewStatKeeper(sK);
  }

  Future<void> _showCreateSKDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return StatKeeperCreatorDialog(
          onSKCreated: (StatKeeper sK) => _onNewSKCreated(sK),
        );
      },
    );
  }
}