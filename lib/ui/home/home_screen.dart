import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleekstats_flutter_statkeeper/model/statkeeper.dart';
import 'package:sleekstats_flutter_statkeeper/store/user_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sleekstats_flutter_statkeeper/ui/home/statkeeper_creator_dialog.dart';

import '../../loading_screen.dart';

class HomeScreen extends StatelessWidget {
  final String title;

  const HomeScreen({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserStore userStore = Provider.of<UserStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(8.0),
              color: Theme.of(context).primaryColorDark,
              child: Text(
                "My StatKeepers",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 48.0,
                    fontStyle: FontStyle.italic),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: StatKeeperList(userStore),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showCreateSKDialog(context),
        child: Icon(Icons.add),
      ),
    );
  }

  Future<void> _showCreateSKDialog(BuildContext context) async {
    UserStore userStore = Provider.of<UserStore>(context);

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return StatKeeperCreatorDialog(
          onSKCreated: (StatKeeper sK) => userStore.addStatKeeper(sK),
        );
      },
    );
  }
}

class StatKeeperList extends StatelessWidget {
  final UserStore _userStore;

  const StatKeeperList(this._userStore);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<StatKeeper>>(
      future: _userStore.getStatKeepers(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (_userStore.statKeepers.isEmpty) {
            return Center(child: Text("Create a StatKeeper!"));
          }
          return Observer(
            builder: (_) => ListView.builder(
                itemBuilder: (BuildContext context, int index) =>
                    StatKeeperLabel(
                      statKeeper: _userStore.statKeepers[index],
                    ),
                itemCount: _userStore.statKeepers.length),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class StatKeeperLabel extends StatelessWidget {
  final StatKeeper statKeeper;

  const StatKeeperLabel({Key key, @required this.statKeeper})
      : assert(statKeeper != null),
        super(key: key);

  IconData _chooseIcon() {
    switch (statKeeper.type) {
      case StatKeeper.TYPE_PLAYER:
        return Icons.person;
      case StatKeeper.TYPE_TEAM:
        return Icons.people;
      case StatKeeper.TYPE_LEAGUE:
        return Icons.public;
      default:
        return Icons.error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
          side: BorderSide(
            color: Theme.of(context).primaryColorDark,
            width: 2.0,
          ),
        ),
        elevation: 4.0,
        child: InkWell(
          onTap: () => _navigateToLoadingScreen(context, statKeeper),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Icon(
                    _chooseIcon(),
                    size: 48.0,
                    color: Theme.of(context).primaryColorDark,
                  ),
                ),
                Flexible(
                  child: Text(
                    statKeeper.name,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Navigates to the [LoadingScreen].
  _navigateToLoadingScreen(BuildContext context, StatKeeper sK) {
    Navigator.of(context).push(
      MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return Scaffold(
            backgroundColor:
                sK.type == StatKeeper.TYPE_PLAYER ? Colors.white : null,
            appBar: AppBar(
              elevation: 1.0,
              title: Text(
                sK.name,
                style: TextStyle(fontSize: 36),
              ),
              centerTitle: true,
            ),
            body: LoadingScreen(statKeeper: sK),
          );
        },
      ),
    );
  }
}
