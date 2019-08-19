import 'package:meta/meta.dart';

class Tour {
  final String name;
  final double price;
  final String description;
  final List<String> images;

  Tour({
    @required this.name,
    @required this.price,
    @required this.description,
    @required this.images,
  });
}
