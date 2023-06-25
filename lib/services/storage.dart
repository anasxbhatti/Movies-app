import 'package:drift/drift.dart';
import 'dart:io';

import 'package:drift/native.dart';
import 'package:movies_db/models/movie.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'storage.g.dart';

/*
 Storage to save favourites. 
 I'm using Drift local storage solution a bit Overkill for this project but I just like working with it.  
 */
class FavouritesMovies extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get overview => text()();
  TextColumn get releaseDate => text()();
  TextColumn get posterUrl => text()();
  TextColumn get vote => text().nullable()();
}

@DriftDatabase(tables: [FavouritesMovies])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}

class FavouriteStorage extends MyDatabase {
  Future<void> saveToFavourites(Movie movie) async {
    try {
      await (into(favouritesMovies).insert(
        FavouritesMoviesCompanion.insert(
          title: movie.title,
          overview: movie.overview,
          releaseDate: movie.releaseDate,
          posterUrl: movie.posterUrl!,
          vote: Value(movie.vote.toString()),
        ),
      ));
    } catch (e) {
      rethrow;
    }
  }

  Stream<List<FavouritesMovie>> get fetchFavourites =>
      select(favouritesMovies).watch();
}
