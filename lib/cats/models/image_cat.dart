import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class ImageCat extends Equatable {
  const ImageCat({@required this.imageURL});

  final String imageURL;

  @override
  List<Object> get props => [imageURL];
}
