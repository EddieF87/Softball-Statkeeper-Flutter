import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleekstats_flutter_statkeeper/model/statkeeper.dart';
import 'package:sleekstats_flutter_statkeeper/store/user_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sleekstats_flutter_statkeeper/ui/home/statkeeper_creator_dialog.dart';

import '../../loading_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool signedIn = false;
  bool signingIn = true;

  @override
  void initState() {
    super.initState();
    UserStore userStore = Provider.of<UserStore>(context, listen: false);

    userStore.retrieveCurrentUser().then((user) {
      setState(() {
        signingIn = false;
        signedIn = (user != null);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    UserStore userStore = Provider.of<UserStore>(context);
    Color accentColor = Theme.of(context).accentColor;
    Color primaryColor = Theme.of(context).primaryColor;
    Color primaryDark = Theme.of(context).primaryColorDark;

    if (signingIn) {
      return Scaffold(
        body: Center(
          child: FractionallySizedBox(
            widthFactor: .5,
            child: AspectRatio(
              aspectRatio: 1,
              child: CircularProgressIndicator(
                strokeWidth: 14,
                backgroundColor: primaryColor,
              ),
            ),
          ),
        ),
      );
    } else if (signedIn) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Sleek Stats Softball"),
          actions: <Widget>[
            FlatButton(
              child: Text("Sign Out"),
              textColor: Theme.of(context).buttonColor,
              onPressed: () async {
                _signOut(userStore);
              },
            ),
          ],
        ),
        body: makeBody(),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _showCreateSKDialog(context),
          child: Icon(Icons.add),
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                "SleekStats\nSoftball Statkeeper",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 48,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    color: primaryDark),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Welcome to SleekStats Softball.\nKeep scores & stats\nfor a player, team, or entire league!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: primaryDark),
                ),
              ),
              RaisedButton(
                onPressed: () async {
                  _signIn(userStore);
                },
                padding: EdgeInsets.only(
                    left: 90.0, right: 90.0, top: 36.0, bottom: 36.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(23.0)),
                    side: BorderSide(
                      color: primaryColor,
                      width: 2.0,
                    )),
                child: Text(
                  "Sign In",
                  style: TextStyle(fontSize: 28, color: Colors.white),
                ),
                color: accentColor,
                highlightColor: primaryColor,
                splashColor: Colors.white,
              ),
            ],
          ),
        ),
      );
    }
  }

  Widget makeBody() {
    UserStore userStore = Provider.of<UserStore>(context);

    return Container(
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

  void _signIn(UserStore userStore) async {
    setState(() {
      signingIn = true;
    });
    bool nowSignedIn = await userStore.signIn();
    setState(() {
      signingIn = false;
      signedIn = nowSignedIn;
    });
  }

  void _signOut(UserStore userStore) async {
    setState(() {
      signingIn = true;
    });
    bool nowSignedOut = await userStore.signOut();
    setState(() {
      signingIn = false;
      signedIn = !nowSignedOut;
    });
  }
}

class StatKeeperList extends StatelessWidget {
  final UserStore _userStore;

  const StatKeeperList(this._userStore);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => ListView.builder(
          itemBuilder: (BuildContext context, int index) => StatKeeperLabel(
                statKeeper: _userStore.statKeepers[index],
              ),
          itemCount: _userStore.statKeepers.length),
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
    debugPrint("STATKEEPR INFO:  $sK");
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
