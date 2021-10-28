import 'package:flutter/material.dart';
import 'package:imagetag/imagetag.dart';

class ImageTagContainer extends StatefulWidget {
  const ImageTagContainer({Key? key}) : super(key: key);

  @override
  _ImageTagContainerState createState() => _ImageTagContainerState();
}

class _ImageTagContainerState extends State<ImageTagContainer> {
  double x = 0, y = 0;
  late RenderBox box;

  @override
  Widget build(BuildContext context) {
    box = context.findRenderObject() as RenderBox;

    return GestureDetector(
      onTapDown: (detail) {
        double heightSize = box.size.height / 2;
        double widthSize = box.size.width / 2;

        setState(() {
          x = detail.localPosition.dx > widthSize
              ? (detail.localPosition.dx - widthSize) / widthSize
              : ((widthSize - detail.localPosition.dx) / widthSize) * -1;
          y = detail.localPosition.dy > heightSize
              ? (detail.localPosition.dy - heightSize) / heightSize
              : ((heightSize - detail.localPosition.dy) / heightSize) * -1;
        });

        // setState(() {
        //   x = detail.localPosition.dx > (MediaQuery.of(context).size.width / 2)
        //       ? (detail.localPosition.dx -
        //               (MediaQuery.of(context).size.width / 2)) /
        //           (MediaQuery.of(context).size.width / 2)
        //       : (((MediaQuery.of(context).size.width / 2) -
        //                   detail.localPosition.dx) /
        //               (MediaQuery.of(context).size.width / 2)) *
        //           -1;
        //   y = detail.localPosition.dy > (MediaQuery.of(context).size.width / 2)
        //       ? (detail.localPosition.dy -
        //               (MediaQuery.of(context).size.width / 2)) /
        //           (MediaQuery.of(context).size.width / 2)
        //       : (((MediaQuery.of(context).size.width / 2) -
        //                   detail.localPosition.dy) /
        //               (MediaQuery.of(context).size.width / 2)) *
        //           -1;
        // });
        // print(MediaQuery.of(context).size.width);
        // print('local x = ' + detail.localPosition.dx.toString());
        // print('local y = ' + detail.localPosition.dy.toString());
        // print('x = ' + x.toString());
        // print('y = ' + y.toString());
        print(box.size.width);
      },
      child: Container(
        color: Colors.blue,
        child: Stack(
          fit: StackFit.loose,
          children: [
            Image.network(
              'https://ecs7.tokopedia.net/img/product-1/2019/5/15/9651507/9651507_0088a3b7-ac49-4ab6-8439-ee503400b9bb_1667_1667',
            ),
            Positioned.fill(
              child: Tag(
                x: x,
                y: y,
                flip: y > 0.7 ? false : true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
