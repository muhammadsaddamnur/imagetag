import 'package:flutter/material.dart';

import '../../imagetag.dart';

class Tag extends StatelessWidget {
  final double x, y;
  final bool flip;
  final String text;
  const Tag(
      {Key? key,
      required this.x,
      required this.y,
      this.flip = false,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(x, y),
      child: Container(
        decoration: ShapeDecoration(
          color: Colors.red,
          shape: TagShapeBorder(arrowArc: 0.3, radius: 5, flip: flip),
          shadows: const [
            BoxShadow(
                color: Colors.black26, blurRadius: 4.0, offset: Offset(2, 2))
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text('$text',
              style: const TextStyle(color: Colors.white, fontSize: 14)),
        ),
      ),
    );
  }
}
