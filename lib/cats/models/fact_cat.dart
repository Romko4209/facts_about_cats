import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class FactCat extends Equatable {
  const FactCat({@required this.fact});

  final String fact;

  @override
  List<Object> get props => [fact];
}
