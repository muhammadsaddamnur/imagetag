import 'dart:math';

import 'package:flutter/material.dart';
import 'package:imagetag/imagetag.dart';
import 'package:imagetag/src/models/imagetag_model.dart';

class TagController extends ChangeNotifier {
  String a = 'wkwk';

  void ganti() {
    a = '${Random().nextInt(100)}';
    notifyListeners();
    print(a);
  }
}

class ImageTagContainer extends StatefulWidget {
  final TagController controller;
  const ImageTagContainer({Key? key, required this.controller})
      : super(key: key);

  @override
  _ImageTagContainerState createState() => _ImageTagContainerState();
}

class _ImageTagContainerState extends State<ImageTagContainer> {
  late RenderBox box;
  double x = 0, y = 0;
  List<TagData> data = [
    TagData(id: 1, value: 'wkwk', x: 0, y: 0),
    TagData(id: 2, value: 'hihi', x: 0.5, y: 0.5),
  ];

  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (mounted) box = context.findRenderObject() as RenderBox;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (detail) {
        double heightSize = box.size.height / 2;
        double widthSize = box.size.width / 2;
        widget.controller.ganti();
        setState(() {
          x = detail.localPosition.dx > widthSize
              ? (detail.localPosition.dx - widthSize) / widthSize
              : ((widthSize - detail.localPosition.dx) / widthSize) * -1;
          y = detail.localPosition.dy > heightSize
              ? (detail.localPosition.dy - heightSize) / heightSize
              : ((heightSize - detail.localPosition.dy) / heightSize) * -1;
        });
        print(box.size.width);
      },
      // onPanUpdate: (detail) {
      //   double heightSize = box.size.height / 2;
      //   double widthSize = box.size.width / 2;

      //   setState(() {
      //     x = detail.localPosition.dx > widthSize
      //         ? (detail.localPosition.dx - widthSize) / widthSize
      //         : ((widthSize - detail.localPosition.dx) / widthSize) * -1;
      //     if (detail.localPosition.dy < box.size.height &&
      //         detail.localPosition.dy > 10) {
      //       y = detail.localPosition.dy > heightSize
      //           ? (detail.localPosition.dy - heightSize) / heightSize
      //           : ((heightSize - detail.localPosition.dy) / heightSize) * -1;
      //     }
      //   });
      //   print(box.size.width);
      // },
      child: Container(
        color: Colors.blue,
        child: Stack(
          fit: StackFit.loose,
          children: [
            GestureDetector(
              onTapDown: (detail) {
                setState(() {
                  double heightSize = box.size.height / 2;
                  double widthSize = box.size.width / 2;
                  widget.controller.ganti();

                  data.add(TagData(
                      id: data.length + 1,
                      value: 'xoxo',
                      x: detail.localPosition.dx > widthSize
                          ? (detail.localPosition.dx - widthSize) / widthSize
                          : ((widthSize - detail.localPosition.dx) /
                                  widthSize) *
                              -1,
                      y: detail.localPosition.dy > heightSize
                          ? (detail.localPosition.dy - heightSize) / heightSize
                          : ((heightSize - detail.localPosition.dy) /
                                  heightSize) *
                              -1));
                });
              },
              child: Image.network(
                'https://ecs7.tokopedia.net/img/product-1/2019/5/15/9651507/9651507_0088a3b7-ac49-4ab6-8439-ee503400b9bb_1667_1667',
              ),
            ),
            Positioned.fill(
              child: Stack(
                  children: List.generate(
                data.length,
                (index) => GestureDetector(
                  onTapDown: (_) {
                    setState(() {
                      data[selectedIndex].x = x;
                      data[selectedIndex].y = y;
                      selectedIndex = index;
                      x = data[index].x;
                      y = data[index].y;
                    });
                  },
                  onPanUpdate: (detail) {
                    setState(() {
                      data[selectedIndex].x = x;
                      data[selectedIndex].y = y;
                      selectedIndex = index;
                      x = data[index].x;
                      y = data[index].y;
                    });
                    double heightSize = box.size.height / 2;
                    double widthSize = box.size.width / 2;

                    setState(() {
                      x = detail.localPosition.dx > widthSize
                          ? (detail.localPosition.dx - widthSize) / widthSize
                          : ((widthSize - detail.localPosition.dx) /
                                  widthSize) *
                              -1;
                      if (detail.localPosition.dy < box.size.height &&
                          detail.localPosition.dy > 10) {
                        y = detail.localPosition.dy > heightSize
                            ? (detail.localPosition.dy - heightSize) /
                                heightSize
                            : ((heightSize - detail.localPosition.dy) /
                                    heightSize) *
                                -1;
                      }
                    });
                    print(box.size.width);
                  },
                  child: Tag(
                    x: index == selectedIndex ? x : data[index].x,
                    y: index == selectedIndex ? y : data[index].y,
                    flip: index == selectedIndex
                        ? y > 0.7
                            ? false
                            : true
                        : data[index].y > 0.7
                            ? false
                            : true,
                    text: data[index].value,
                  ),
                ),
              ).toList()),
            )
          ],
        ),
      ),
    );
  }
}
