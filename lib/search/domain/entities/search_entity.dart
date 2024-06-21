import 'package:equatable/equatable.dart';

class SearchEntity extends Equatable {
  final int id;
  final String title;
  final String posterPath;
  final String overview;
  final String? releaseDate;

  const SearchEntity({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.overview,
    this.releaseDate,
  });

  @override
  List<Object?> get props {
    return [
      id,
      title,
      posterPath,
      overview,
      releaseDate,
    ];
  }
}
