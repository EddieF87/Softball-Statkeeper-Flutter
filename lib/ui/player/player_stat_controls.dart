import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:sleekstats_flutter_statkeeper/store/statkeeper_store.dart';
import 'package:sleekstats_flutter_statkeeper/utils/stat_formatter.dart';

class PlayerStatControls extends StatefulWidget {

  PlayerStatControls();

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
    StatKeeperStore statKeeperStore = Provider.of<StatKeeperStore>(context);

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
              builder: (_) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    statKeeperStore.playerStatToUpdate ?? "- - -",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    StatFormatter.displayAmount(amount),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: createIconButton(Icons.add_circle_outline, increaseAmount),
          ),
          Expanded(
            child: RaisedButton(
              //todo
              onPressed: () => statKeeperStore
                  .updatePlayerCountingStat(statKeeperStore.currentPlayerIndex, amount),
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
