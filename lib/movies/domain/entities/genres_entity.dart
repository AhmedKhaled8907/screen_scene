// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class GenresEntity extends Equatable {
  final int? movieId;
  final String name;

  const GenresEntity({
    this.movieId,
    required this.name,
  });

  @override
  List<Object?> get props => [
        movieId,
        name,
      ];
}
