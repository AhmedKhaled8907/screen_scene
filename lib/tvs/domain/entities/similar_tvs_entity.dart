import 'package:equatable/equatable.dart';

class SimilarTvsEntity extends Equatable {
  final int id;
  final String? posterPath;

  const SimilarTvsEntity({
    required this.id,
    this.posterPath,
  });

  @override
  List<Object?> get props => [
        id,
        posterPath,
      ];
}
