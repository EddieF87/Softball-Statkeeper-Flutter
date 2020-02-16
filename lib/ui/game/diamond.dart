import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sleekstats_flutter_statkeeper/model/player.dart';
import 'package:sleekstats_flutter_statkeeper/store/base_store.dart';
import 'package:sleekstats_flutter_statkeeper/store/game_store.dart';

class Diamond extends StatelessWidget {
  final GameStore gameStore;
  final BaseStore baseStore;

  static const BATTER = 0;
  static const FIRST = 1;
  static const SECOND = 2;
  static const THIRD = 3;
  static const HOME = 4;

  const Diamond({Key key, this.gameStore, this.baseStore}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color accentColor = Theme.of(context).accentColor;

    return Observer(
      builder: (_) => Padding(
            padding: const EdgeInsets.all(24.0),
            child: Stack(
              children: <Widget>[
                baseStore.bases[BATTER] != null
                    ? _createRunner(
                        baseIndex: BATTER,
                        alignment: Alignment.center,
                        onBase: false)
                    : Container(),
                _createBase(
                    base: FIRST,
                    alignment: Alignment.centerRight,
                    isOccupied: baseStore.bases[FIRST] != null),
                _createBase(
                  isOccupied: baseStore.bases[SECOND] != null,
                  base: SECOND,
                  alignment: Alignment.topCenter,
                ),
                _createBase(
                  isOccupied: baseStore.bases[THIRD] != null,
                  base: THIRD,
                  alignment: Alignment.centerLeft,
                ),
                _createBase(
                  isOccupied: false,
                  base: HOME,
                  alignment: Alignment.bottomCenter,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: DragTarget(
                    builder: (BuildContext context, List<int> candidateData,
                        List rejectedData) {
                      return Container(
                        width: 90,
                        height: 90,
                        child: Stack(
                          children: <Widget>[
                            Icon(
                              Icons.highlight_off,
                              size: 90,
                              color: accentColor,
                            ),
                            _nameBox(name: Player.LABEL_OUT),
                          ],
                        ),
                      );
                    },
                    onLeave: (data) {
                      print("onLeave");
                    },
                    onWillAccept: (data) {
                      return true;
                    },
                    onAccept: (data) {
                      print("onAccept");
//                      setState(() {});
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                      icon: Icon(Icons.fast_rewind),
                      onPressed: gameStore.goBackward),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                      icon: Icon(Icons.fast_forward),
                      onPressed: gameStore.goForward),
                ),
              ],
            ),
          ),
    );
  }

  Widget _createBase({int base, Alignment alignment, isOccupied}) {
    return Align(
      alignment: alignment,
      child: Transform.rotate(
        angle: 0.785398,
        child: Container(
          height: 90.0,
          width: 90.0,
          color: Colors.white,
          child: _createBaseOrRunner(
            isOccupied: isOccupied,
            base: base,
            alignment: alignment,
          ),
        ),
      ),
    );
  }

  Widget _createBaseOrRunner(
          {bool isOccupied, int base, Alignment alignment}) =>
      isOccupied
          ? _createRunner(baseIndex: base, alignment: alignment, onBase: true)
          : _createBaseTarget(newBase: base, alignment: alignment);

  Widget _createBaseTarget({int newBase, Alignment alignment}) {
    return DragTarget(
      builder: (BuildContext context, List<int> candidateData, List rejectedData) { return null;},
      onLeave: (data) {
        print("onLeave");
      },
      onWillAccept: (data) {
        if (data >= newBase) {
          print("$data >= $newBase can't go backwards");
          return false;
        }
        for (var i = data + 1; i < newBase; i++) {
          if (baseStore.bases[i] != null) {
            print("base $i occupied");
            return false;
          }
        }
        return baseStore.bases[newBase] == null;
      },
      onAccept: (currentBase) {
        print("onAccept");
        if (newBase == HOME) {
          gameStore.addRunAndRBI((baseStore.bases[currentBase]));
        }
//        setState(() {
//          baseStore.bases[base] = baseStore.bases[data];
//          baseStore.bases[data] = null;
//          baseStore.bases[HOME] = null;
//          if (data == 0) {
//            baseStore.onBatterMoved();
//          }
//        }
//        );
        baseStore.updateBase(newBase, currentBase);
      },
    );
  }

  Widget _createRunner({int baseIndex, Alignment alignment, bool onBase}) {
    return Align(
      alignment: alignment,
      child: Draggable(
        data: baseIndex,
        child: onBase
            ? _onBaseIcon(name: baseStore.bases[baseIndex].name)
            : _batterIcon(name: baseStore.bases[baseIndex].name),
        feedback: Icon(
          Icons.directions_run,
          size: 90,
        ),
        childWhenDragging: Container(),
        onDragCompleted: () =>
//            setState(() => baseStore.bases[base] = null)
            baseStore.onRunnerMoved(baseIndex),
      ),
    );
  }

  Widget _onBaseIcon({String name}) {
    return Transform.rotate(
      angle: -0.785398,
      child: Container(
        width: 90,
        height: 90,
        child: Stack(
          children: <Widget>[
            Center(
              child: Icon(
                Icons.person,
                size: 90,
              ),
            ),
            _nameBox(name: name),
          ],
        ),
      ),
    );
  }

  Widget _batterIcon({String name}) {
    return Container(
      width: 90,
      height: 90,
      child: Stack(
        children: <Widget>[
          Center(
            child: Image(
              image: AssetImage("assets/img_batter.png"),
              fit: BoxFit.contain,
            ),
          ),
          _nameBox(name: name),
        ],
      ),
    );
  }

  Widget _nameBox({String name}) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.red,
          ),
        ),
        padding: EdgeInsets.all(2.0),
        child: Text(
          name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
