import '../index.dart';

abstract class Filters {
  List<Film?> getFilmByTitle(List<Film> films, String filmTitle);
  List<Film> sortFilmsByVoteAverage(List<Film> films, bool argh);
  List<Film?> getFilmsByDate(List<Film> films, DateTime date);
  List<Film?> getFilmsByRangeDates(List<Film> films, DateTime formDate, DateTime toDate);
  Future<List<Film>> getFilms(List<Film> films);
}

class FiltersImpl implements Filters {
  @override
  List<Film> getFilmByTitle(List<Film> films, String filmTitle) {
    List<Film> result = [];

    for (final item in films) {
      if (item.title.toLowerCase() == filmTitle.toLowerCase()) {
        result.add(item);
      }
    }
    return result;
  }

  @override
  List<Film> sortFilmsByVoteAverage(List<Film> films, bool argh) {
    final List<Film> result = films;
    result.sort(FiltersSort.sortByVoteAverage);
    return argh ? result.reversed.toList() : result;
  }

  @override
  List<Film?> getFilmsByDate(List<Film> films, DateTime date) {
    final List<Film> result = [];
    for (final item in films) {
      if (item.releaseDate.year == date.year) {
        result.add(item);
      }
    }
    return result;
  }

  @override
  List<Film?> getFilmsByRangeDates(List<Film> films, DateTime fromDate, DateTime toDate) {
    final List<Film> result = [];
    for (final item in films) {
      if (item.releaseDate.year >= fromDate.year && item.releaseDate.year <= toDate.year) {
        result.add(item);
      }
    }
    result.sort(FiltersSort.sortByDate());
    return result;
  }

  @override
  Future<List<Film>> getFilms(List<Film> films) async {
    Future.delayed(Duration(seconds: 4));
    return films;
  }
}

class FiltersSort {
  static int sortByVoteAverage(FilmModel model, FilmModel otherModel) {
    return -model.voteAverage.compareTo(otherModel.voteAverage);
  }

  static sortByDate() {
    return (FilmModel model, FilmModel otherModel) {
      if (model.releaseDate.isBefore(otherModel.releaseDate)) {
        return 1;
      } else if (model.releaseDate.isAfter(otherModel.releaseDate)) {
        return -1;
      }
      return 0;
    };
  }
}
