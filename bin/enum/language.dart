enum Language {
  english,
  russian,
  chinese,
  french,
}

extension LanguageExt on Language {
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
