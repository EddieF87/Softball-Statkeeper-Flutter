import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleekstats_flutter_statkeeper/store/statkeeper_store.dart';

class AddPlayersDialog extends StatefulWidget {
  final int teamIndex;

  AddPlayersDialog({this.teamIndex = 0});

  @override
  State<StatefulWidget> createState() => AddPlayersDialogState();
}

class AddPlayersDialogState extends State<AddPlayersDialog> {
  Map<int, String> playerNames = {};
  Map<int, bool> playerGenders = {};

  @override
  Widget build(BuildContext context) {
    StatKeeperStore statKeeperStore = Provider.of<StatKeeperStore>(context);

    return AlertDialog(
      //todo
      title: Text(
          'Create New Players for ${statKeeperStore.teams[widget.teamIndex].name}'),
      content: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: ListView.builder(
          cacheExtent: 99,
          itemBuilder: (BuildContext context, int index) => Padding(
            padding: EdgeInsets.all(4.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: TextFormField(
                    initialValue: playerNames[index],
                    maxLength: 20,
                    decoration: InputDecoration(
                      hintText: "Name",
                      counterText: (playerGenders[index] ?? false) ? "F" : "M",
                      counterStyle: TextStyle(
                        color: (playerGenders[index] ?? false)
                            ? Colors.pink
                            : Colors.blue,
                      ),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (s) => _addPlayer(index, s),
                  ),
                ),
//                IconButton(icon: Icon(Icons.cake), onPressed: null),
                Switch(
                  activeColor: Colors.pink,
                  activeTrackColor: Colors.pinkAccent,
                  inactiveThumbColor: Colors.blue,
                  inactiveTrackColor: Colors.lightBlueAccent,
                  value: playerGenders[index] ?? false,
                  onChanged: (bool s) =>
                      setState(() => playerGenders[index] = s),
                ),
              ],
            ),
          ),
          itemCount: playerNames.length + 1,
        ),
      ),
      actions: <Widget>[
        _createDialogButton(context, "Cancel",
            onPressed: () => Navigator.of(context).pop()),
        _createDialogButton(context, "Submit", onPressed: () async {
          await statKeeperStore.addPlayers(
              widget.teamIndex, playerNames, playerGenders);
          Navigator.of(context).pop();
        }),
      ],
    );
  }

  _createDialogButton(BuildContext context, String text, {Function onPressed}) {
    return FlatButton(
      color: Theme.of(context).accentColor,
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
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
}
