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

enum Language {
  english,
  russian,
  chinese,
  french,
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

extension on Language {
  String toPrettyString(Language cnvLang) {
    switch (cnvLang) {
      case Language.french:
        return '${cnvLang.toString()} - французский';
      case Language.russian:
        return '${cnvLang.toString()} - русский';
      case Language.chinese:
        return '${cnvLang.toString()} - китайский';
      case Language.english:
        return '${cnvLang.toString()} - английский';
    }
  }
}

void main() {
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
      voteAverage: 1,
      releaseDate: DateTime(2018),
      desription: 'dfg',
      language: 'english',
    ),
    Film(
      id: 'id2',
      title: 'title2',
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
      voteAverage: 3,
      releaseDate: DateTime(2020),
      desription: 'asd',
      language: 'french',
    ),
  ];

  for (final elem in films) {
    print(elem.convertLangToPretty(elem.language));
  }
}
