import 'package:flutter/material.dart';
import 'package:sleekstats_flutter_statkeeper/database/repository_service_teams.dart';
import 'package:sleekstats_flutter_statkeeper/model/team.dart';
import 'package:uuid/uuid.dart';

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
          _submitNewTeams();
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
    var uuid = new Uuid();
    teamNames.forEach((key, name) {
      debugPrint("$key, $name");
      RepositoryServiceTeams.insertTeam(
        Team(
          fireID: uuid.v1(),
          statkeeperFireID: widget.sKFireID,
          name: name,
        ),
      );
    });
    widget.onNewTeamsSubmitted();
  }
}
