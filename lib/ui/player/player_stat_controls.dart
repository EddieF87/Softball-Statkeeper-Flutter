import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sleekstats_flutter_statkeeper/store/player_store.dart';
import 'package:sleekstats_flutter_statkeeper/ui/team/player_stat_label.dart';

class PlayerStatControls extends StatefulWidget {
  final PlayerStore playerStore;

  PlayerStatControls({this.playerStore});

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
    return Padding(
      padding: EdgeInsets.only(bottom: 16.0, top: 16.0, right: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: createIconButton(Icons.remove_circle, decreaseAmount),
          ),
          Expanded(
            child: Observer(
              builder: (_) => PlayerStatLabel(
                    stat: widget.playerStore.statToUpdate,
                    amount: this.amount,
                  ),
            ),
          ),
          Expanded(
            child: createIconButton(Icons.add_circle_outline, increaseAmount),
          ),
          Expanded(
            child: RaisedButton(
              onPressed: () => widget.playerStore.updateCountingStat(amount),
              child: Text("Update"),
            ),
          ),
        ],
      ),
    );
  }

  IconButton createIconButton(IconData iconData, onPress) {
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
