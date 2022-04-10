import 'index.dart';

class Film extends FilmModel with ConvertLangToEnum {
  Film({
    required String id,
    required String title,
    required String picture,
    required double voteAverage,
    required DateTime releaseDate,
    required String desription,
    required String language,
    Language? convertedLanguage,
  }) : super(
          id: id,
          title: title,
          picture: picture,
          voteAverage: voteAverage,
          releaseDate: releaseDate,
          desription: desription,
          language: language,
          convertedLanguage: convertedLanguage,
        );

  String convertLangToPretty(String lang) {
    convertedLanguage = convertLangToEnum(lang);
    return convertedLanguage!.toPrettyString(convertedLanguage!);
  }
}

mixin ConvertLangToEnum {
  Language convertLangToEnum(String lang) {
    switch (lang) {
      case 'french':
        return Language.french;
      case 'russian':
        return Language.russian;
      case 'chinese':
        return Language.chinese;
      case 'english':
        return Language.english;
      default:
        return Language.english;
    }
  }
}

void main() async {
  final String searchByTitle = 'title3';
  final List<Film> films = [
    Film(
      id: 'id',
      title: 'title',
      picture: 'picture',
      voteAverage: 0,
      releaseDate: DateTime(2017),
      desription: '',
      language: 'chinese',
    ),
    Film(
      id: 'id1',
      title: 'title1',
      picture: 'picture1',
      voteAverage: 4,
      releaseDate: DateTime(2018),
      desription: 'dfg',
      language: 'english',
    ),
    Film(
      id: 'id2',
      title: 'title3',
      picture: 'picture2',
      voteAverage: 2,
      releaseDate: DateTime(2019),
      desription: 'sdf',
      language: 'russian',
    ),
    Film(
      id: 'id3',
      title: 'title3',
      picture: 'picture3',
      voteAverage: 1,
      releaseDate: DateTime(2020),
      desription: 'asd',
      language: 'french',
    ),
  ];
  final filters = FiltersImpl();
  for (final items in filters.getFilmsByRangeDates(films, DateTime(2019), DateTime(2020))) {
    print('${items?.id} ${items?.releaseDate}');
  }
}
