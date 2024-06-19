import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/movies/domain/entities/movie_details_entity.dart';

class MovieDetailsTitle extends StatelessWidget {
  const MovieDetailsTitle({
    super.key,
    required this.movie,
  });

  final MovieDetailsEntity? movie;

  @override
  Widget build(BuildContext context) {
    return Text(
      movie!.title,
      style: GoogleFonts.poppins(
        fontSize: 23,
        fontWeight: FontWeight.w700,
        letterSpacing: 1.2,
      ),
    );
  }
}
