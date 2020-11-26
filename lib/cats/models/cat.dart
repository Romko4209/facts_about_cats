import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Cat extends Equatable {
  const Cat({@required this.imageURL, @required this.fact});

  final String imageURL;
  final String fact;

  @override
  List<Object> get props => [imageURL, fact];
}
