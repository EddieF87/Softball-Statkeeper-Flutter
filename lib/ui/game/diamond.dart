import 'package:flutter/material.dart';

class Diamond extends StatefulWidget {
  final basesOccupied;

  const Diamond({Key key, this.basesOccupied}) : super(key: key);

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
          widget.basesOccupied[0]
              ? _createRunner(
                  base: 0, alignment: Alignment.center, onBase: false)
              : Container(),
          _createBase(
              base: 1,
              alignment: Alignment.centerRight,
              isOccupied: widget.basesOccupied[1]),
          _createBase(
            isOccupied: widget.basesOccupied[2],
            base: 2,
            alignment: Alignment.topCenter,
          ),
          _createBase(
            isOccupied: widget.basesOccupied[3],
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
            child: Container(
              width: 30,
              height: 30,
              color: Colors.yellow,
            ),
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
          if (widget.basesOccupied[i]) {
            print("base $i occupied");
            return false;
          }
        }
        return !widget.basesOccupied[base];
      },
      onAccept: (data) {
        print("onAccept");
        setState(() {
          widget.basesOccupied[base] = true;
          widget.basesOccupied[4] = false;
        });
      },
    );
  }

  Widget _createRunner({int base, Alignment alignment, bool onBase}) {
    return Align(
      alignment: alignment,
      child: Draggable(
        data: base,
        child: onBase ? _runnerOnBaseIcon() : _batterIcon(),
        feedback: Icon(
          Icons.directions_run,
          size: 90,
        ),
        childWhenDragging: Container(),
        onDragCompleted: () =>
            setState(() => widget.basesOccupied[base] = false),
      ),
    );
  }

  Widget _runnerOnBaseIcon() {
    return Transform.rotate(
      angle: -0.785398,
      child: Icon(
        Icons.directions_run,
        size: 90,
      ),
    );
  }

  Widget _batterIcon() {
    return Image(
      image: AssetImage("assets/img_batter.png"),
      width: 90,
      height: 90,
    );
  }
}
