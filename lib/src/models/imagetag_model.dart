class ImageTagModel {
  double height;
  double width;
  List<TagData> data;

  ImageTagModel(
      {required this.height, required this.width, required this.data});
}

class TagData {
  String id;
  String value;
  double x;
  double y;
  TagData(
      {required this.id,
      required this.value,
      required this.x,
      required this.y});
}
