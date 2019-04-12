import 'package:flutter/material.dart';
import 'package:sleekstats_flutter_statkeeper/widget/player_stat_label.dart';

class PlayerStatControls extends StatefulWidget {
  final String stat;
  final ValueSetter onSubmit;

  PlayerStatControls({
    this.stat = "---",
    this.onSubmit,
  });

  @override
  State<StatefulWidget> createState() => _PlayerStatControlsState();
}

class _PlayerStatControlsState extends State<PlayerStatControls> {
  int amount;

  @override
  void initState() {
    super.initState();
    amount = 1;
  }

  increaseAmount() => setState(() => amount++);

  decreaseAmount() => setState(() => amount--);

  resetAmount() => setState(() => amount = 1);

  @override
  Widget build(BuildContext context) {
    debugPrint("BUILD CONTROLS");
    return Padding(
      padding: EdgeInsets.only(bottom: 16.0, top: 16.0, right: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: createIconButton(Icons.remove_circle, decreaseAmount),
          ),
          Expanded(
            child: PlayerStatLabel(
              stat: widget.stat,
              amount: this.amount,
            ),
          ),
          Expanded(
            child: createIconButton(Icons.add_circle_outline, increaseAmount),
          ),
          Expanded(
            child: RaisedButton(
              onPressed: () => widget.onSubmit(StatToUpdate(name: widget.stat, amount: amount)),
              child: Text("Update"),
            ),
          ),
        ],
      ),
    );
  }

  IconButton createIconButton(IconData iconData, onPress) {
    debugPrint("createIconButton");
    return IconButton(
//      padding: EdgeInsets.all(16.0),
      icon: Icon(iconData),
      iconSize: 48.0,
      onPressed: onPress,
      color: Colors.red,
      highlightColor: Colors.lightBlue,
      splashColor: Colors.yellow,
    );
  }
}

class StatToUpdate {
  final String name;
  final int amount;

  StatToUpdate({this.name, this.amount}) : assert(name != null, amount != null);
}
