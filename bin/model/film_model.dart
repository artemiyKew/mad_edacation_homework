import '../index.dart';

abstract class FilmModel {
  final String id;
  final String title;
  final String picture;
  final double voteAverage;
  final DateTime releaseDate;
  final String desription;
  final String language;
  late Language? convertedLanguage;

  FilmModel({
    required this.id,
    required this.title,
    required this.picture,
    required this.voteAverage,
    required this.releaseDate,
    required this.desription,
    required this.language,
    Language? convertedLanguage,
  });
}
