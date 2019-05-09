import 'package:flutter/material.dart';
import 'package:sleekstats_flutter_statkeeper/model/player.dart';

class Diamond extends StatefulWidget {
  final List<Player> bases;

  const Diamond({Key key, this.bases}) : super(key: key);

  @override
  State<StatefulWidget> createState() => DiamondState();
}

class DiamondState extends State<Diamond> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Stack(
        children: <Widget>[
          widget.bases[0] != null
              ? _createRunner(
                  base: 0, alignment: Alignment.center, onBase: false)
              : Container(),
          _createBase(
              base: 1,
              alignment: Alignment.centerRight,
              isOccupied: widget.bases[1] != null),
          _createBase(
            isOccupied: widget.bases[2] != null,
            base: 2,
            alignment: Alignment.topCenter,
          ),
          _createBase(
            isOccupied: widget.bases[3] != null,
            base: 3,
            alignment: Alignment.centerLeft,
          ),
          _createBase(
            isOccupied: false,
            base: 4,
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
                  color: Colors.yellow,
                  child: Stack(
                    children: <Widget>[
                      Icon(
                        Icons.highlight_off,
                        size: 90,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          "OUT",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ),
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
                setState(() {});
              },
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(icon: Icon(Icons.fast_rewind), onPressed: null),
          ),
          Align(
            alignment: Alignment.topRight,
            child: IconButton(icon: Icon(Icons.fast_forward), onPressed: null),
          ),
        ],
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
          ? _createRunner(base: base, alignment: alignment, onBase: true)
          : _createBaseTarget(base: base, alignment: alignment);

  Widget _createBaseTarget({int base, Alignment alignment}) {
    return DragTarget(
      builder:
          (BuildContext context, List<int> candidateData, List rejectedData) {},
      onLeave: (data) {
        print("onLeave");
      },
      onWillAccept: (data) {
        if (data >= base) {
          print("$data >= $base can't go backwards");
          return false;
        }
        for (var i = data + 1; i < base; i++) {
          if (widget.bases[i] != null) {
            print("base $i occupied");
            return false;
          }
        }
        return widget.bases[base] == null;
      },
      onAccept: (data) {
        print("onAccept");
        setState(() {
          widget.bases[base] = widget.bases[data];
          widget.bases[4] = null;
        });
      },
    );
  }

  Widget _createRunner({int base, Alignment alignment, bool onBase}) {
    return Align(
      alignment: alignment,
      child: Draggable(
        data: base,
        child: onBase ? _onBaseIcon(name: widget.bases[base].name) : _batterIcon(name: widget.bases[base].name),
        feedback: Icon(
          Icons.directions_run,
          size: 90,
        ),
        childWhenDragging: Container(),
        onDragCompleted: () =>
            setState(() => widget.bases[base] = null),
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
