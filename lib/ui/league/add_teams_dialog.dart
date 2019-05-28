import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleekstats_flutter_statkeeper/store/statkeeper_store.dart';

class AddTeamsDialog extends StatefulWidget {
  final String sKFireID;
  final VoidCallback onNewTeamsSubmitted;

  AddTeamsDialog({
    this.sKFireID,
    this.onNewTeamsSubmitted
  });

  @override
  State<StatefulWidget> createState() => AddTeamsDialogState();
}

class AddTeamsDialogState extends State<AddTeamsDialog> {
  Map<int, String> teamNames = {};

  @override
  Widget build(BuildContext context) {
    StatKeeperStore statKeeperStore = Provider.of<StatKeeperStore>(context);

    return AlertDialog(
      title: Text('Create New Teams'),
      content: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) => Padding(
            padding: EdgeInsets.all(4.0),
            child: TextField(
              maxLength: 20,
              decoration: InputDecoration(
                hintText: "Name",
                counterText: "",
                border: OutlineInputBorder(),
              ),
              onChanged: (s) => _addTeam(index, s),
            ),
          ),
          itemCount: teamNames.length + 1,
        ),
      ),
      actions: <Widget>[
        _createDialogButton(context, "Cancel",
            onPressed: () => Navigator.of(context).pop()),
        _createDialogButton(context, "Submit", onPressed: () {
          statKeeperStore.addTeams(teamNames);
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

  _addTeam(int index, String s) {
    setState(() {
      teamNames[index] = s;
      if (s.isEmpty) {
        teamNames.remove(index);
      }
    });
  }

  _submitNewTeams() {

    widget.onNewTeamsSubmitted();
  }
}
