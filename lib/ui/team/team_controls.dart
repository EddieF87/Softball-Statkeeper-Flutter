import 'package:flutter/material.dart';

class TeamControls extends StatelessWidget {
  final VoidCallback onAddButtonTapped;
  final VoidCallback onScoresButtonTapped;

  const TeamControls({
    Key key,
    this.onAddButtonTapped,
    this.onScoresButtonTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color accentColor = Theme.of(context).accentColor;
    Color primaryColor = Theme.of(context).primaryColor;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        RaisedButton(
          onPressed: onScoresButtonTapped,
          child: Text(
            "Scores",
            style: TextStyle(color: Colors.white),
          ),
//          color: accentColor,
//          highlightColor: primaryColor,
        ),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: accentColor,
          ),
          child: IconButton(
            icon: Icon(
              Icons.group_add,
              color: Colors.white,
            ),
            onPressed: onAddButtonTapped,
//            highlightColor: primaryColor,
            splashColor: primaryColor,
          ),
        ),
      ],
    );
  }
}
