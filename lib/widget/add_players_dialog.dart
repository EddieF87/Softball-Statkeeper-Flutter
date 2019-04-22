import 'package:flutter/material.dart';
import 'package:sleekstats_flutter_statkeeper/database/repository_service_players.dart';
import 'package:sleekstats_flutter_statkeeper/model/player.dart';
import 'package:uuid/uuid.dart';

class AddPlayersDialog extends StatefulWidget {
  final String sKFireID;
  final String teamFireID;
  VoidCallback onNewPlayersSubmitted;

  AddPlayersDialog({
    this.sKFireID,
    this.teamFireID,
    this.onNewPlayersSubmitted
  });

  @override
  State<StatefulWidget> createState() => AddPlayersDialogState();
}

class AddPlayersDialogState extends State<AddPlayersDialog> {
  Map<int, String> playerNames = {};

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Create New StatKeeper'),
      content: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) =>
                    TextField(onChanged: (s) => _addPlayer(index, s)),
                itemCount: playerNames.length + 1,
              ),
            ),
            FlatButton(
              onPressed: () {
                _submitNewPlayers();
                Navigator.of(context).pop();
              },
              child: Text("Submit"),
            )
          ],
        ),
      ),
    );
  }

  _addPlayer(int index, String s) {
    setState(() {
      playerNames[index] = s;
      if (s.isEmpty) {
        playerNames.remove(index);
      }
    });
  }

  _submitNewPlayers() {
    debugPrint("New players = ");
    var uuid = new Uuid();
    playerNames.forEach((key, name) {
      debugPrint("$key, $name");
      RepositoryServicePlayers.insertPlayer(
        Player(
          firestoreID: uuid.v1(),
          teamFirestoreID: widget.teamFireID,
          statkeeperFirestoreID: widget.sKFireID,
          name: name,
        ),
      );
    });
    widget.onNewPlayersSubmitted();
  }
}
