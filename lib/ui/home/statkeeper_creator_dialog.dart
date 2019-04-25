import 'package:flutter/material.dart';
import 'package:sleekstats_flutter_statkeeper/model/statkeeper.dart';
import 'package:uuid/uuid.dart';

class StatKeeperCreatorDialog extends StatefulWidget {
  final ValueSetter<StatKeeper> onSKCreated;

  const StatKeeperCreatorDialog({Key key, this.onSKCreated}) : super(key: key);

  @override
  _StatKeeperCreatorDialogState createState() =>
      _StatKeeperCreatorDialogState();
}

class _StatKeeperCreatorDialogState extends State<StatKeeperCreatorDialog> {
  List<RadioModel> statKeeperChoices = [
    RadioModel(true, "Player", StatKeeper.TYPE_PLAYER, Icons.person),
    RadioModel(false, "Team", StatKeeper.TYPE_TEAM, Icons.people),
    RadioModel(false, "League", StatKeeper.TYPE_LEAGUE, Icons.cake),
  ];

  final myController = TextEditingController();
  bool _namePrompt = false;
  int _radioIndex = 0;

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Create New StatKeeper'),
      content: Container(
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _createRadioItem(context, 0),
                _createRadioItem(context, 1),
                _createRadioItem(context, 2),
              ],
            ),
            Text(
              _getDescription(_radioIndex),
              style: TextStyle(fontSize: 14.0),
            ),
            Padding(padding: EdgeInsets.all(8.0)),
            TextField(
              textCapitalization: TextCapitalization.words,
              controller: myController,
              maxLength: 20,
              decoration: InputDecoration(
                prefixIcon: Icon(statKeeperChoices[_radioIndex].iconData),
                labelText: 'Name',
                errorText: _namePrompt ? "Name can't be blank!" : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0.0),
                ),
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
//          color: Colors.red,
          child: Text('Cancel'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        Padding(padding: EdgeInsets.all(8.0)),
        FlatButton(
          child: Text('Create'),
          onPressed: () {
            if (_nameEntered()) {
              _createNewStatKeeper(myController.text, _radioIndex);
              Navigator.of(context).pop();
            }
          },
        ),
      ],
    );
  }

  String _getDescription(int index) {
    switch (index) {
      case 0:
        return "Keep stats for one player";
      case 1:
        return "Keep stats & scores for one team";
      case 2:
        return "Keep stats, scores, & standings for a league";
      default:
        return "";
    }
  }

  Widget _createRadioItem(BuildContext context, int index) {
    return Expanded(
      child: InkWell(
        highlightColor: Theme.of(context).primaryColor,
        splashColor: Theme.of(context).accentColor,
        onTap: () => _updateRadio(index),
        child: new RadioItem(statKeeperChoices[index]),
      ),
    );
  }

  _updateRadio(int index) {
    setState(() {
      _radioIndex = index;
      statKeeperChoices.forEach((element) => element.isSelected = false);
      statKeeperChoices[index].isSelected = true;
    });
  }

  bool _nameEntered() {
    if (myController.text.isEmpty) {
      setState(() {
        _namePrompt = true;
      });
      return false;
    }
    return true;
  }

  _createNewStatKeeper(String name, int type) {
    var uuid = new Uuid();
    widget.onSKCreated(new StatKeeper(firestoreID: uuid.v1(), name: name, type: type, level: StatKeeper.LEVEL_CREATOR));
  }
}

class RadioItem extends StatelessWidget {
  final RadioModel _item;

  RadioItem(this._item);

  @override
  Widget build(BuildContext context) {
    Color accentColor = Theme.of(context).accentColor;
    Color primaryColorDark = Theme.of(context).primaryColorDark;
    return Container(
      child: Column(
        children: <Widget>[
          Icon(_item.iconData, color: primaryColorDark,),
          Text(
            _item.buttonText,
            style: TextStyle(
                color: primaryColorDark,
                fontWeight: FontWeight.bold,
                fontSize: 18.0),
          ),
        ],
      ),
      decoration: new BoxDecoration(
        color: _item.isSelected ? accentColor : Colors.transparent,
        border: new Border.all(
            width: 1.0,
            color: _item.isSelected ? accentColor : Colors.grey),
        borderRadius: const BorderRadius.all(const Radius.circular(2.0)),
      ),
    );
  }
}

class RadioModel {
  bool isSelected;
  final String buttonText;
  final int type;
  final IconData iconData;

  RadioModel(this.isSelected, this.buttonText, this.type, this.iconData);
}
