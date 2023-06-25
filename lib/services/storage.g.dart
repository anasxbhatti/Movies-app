// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage.dart';

// ignore_for_file: type=lint
class $FavouritesMoviesTable extends FavouritesMovies
    with TableInfo<$FavouritesMoviesTable, FavouritesMovie> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavouritesMoviesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _overviewMeta =
      const VerificationMeta('overview');
  @override
  late final GeneratedColumn<String> overview = GeneratedColumn<String>(
      'overview', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _releaseDateMeta =
      const VerificationMeta('releaseDate');
  @override
  late final GeneratedColumn<String> releaseDate = GeneratedColumn<String>(
      'release_date', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _posterUrlMeta =
      const VerificationMeta('posterUrl');
  @override
  late final GeneratedColumn<String> posterUrl = GeneratedColumn<String>(
      'poster_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _voteMeta = const VerificationMeta('vote');
  @override
  late final GeneratedColumn<String> vote = GeneratedColumn<String>(
      'vote', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, overview, releaseDate, posterUrl, vote];
  @override
  String get aliasedName => _alias ?? 'favourites_movies';
  @override
  String get actualTableName => 'favourites_movies';
  @override
  VerificationContext validateIntegrity(Insertable<FavouritesMovie> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('overview')) {
      context.handle(_overviewMeta,
          overview.isAcceptableOrUnknown(data['overview']!, _overviewMeta));
    } else if (isInserting) {
      context.missing(_overviewMeta);
    }
    if (data.containsKey('release_date')) {
      context.handle(
          _releaseDateMeta,
          releaseDate.isAcceptableOrUnknown(
              data['release_date']!, _releaseDateMeta));
    } else if (isInserting) {
      context.missing(_releaseDateMeta);
    }
    if (data.containsKey('poster_url')) {
      context.handle(_posterUrlMeta,
          posterUrl.isAcceptableOrUnknown(data['poster_url']!, _posterUrlMeta));
    } else if (isInserting) {
      context.missing(_posterUrlMeta);
    }
    if (data.containsKey('vote')) {
      context.handle(
          _voteMeta, vote.isAcceptableOrUnknown(data['vote']!, _voteMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FavouritesMovie map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FavouritesMovie(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      overview: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}overview'])!,
      releaseDate: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}release_date'])!,
      posterUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}poster_url'])!,
      vote: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}vote']),
    );
  }

  @override
  $FavouritesMoviesTable createAlias(String alias) {
    return $FavouritesMoviesTable(attachedDatabase, alias);
  }
}

class FavouritesMovie extends DataClass implements Insertable<FavouritesMovie> {
  final int id;
  final String title;
  final String overview;
  final String releaseDate;
  final String posterUrl;
  final String? vote;
  const FavouritesMovie(
      {required this.id,
      required this.title,
      required this.overview,
      required this.releaseDate,
      required this.posterUrl,
      this.vote});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['overview'] = Variable<String>(overview);
    map['release_date'] = Variable<String>(releaseDate);
    map['poster_url'] = Variable<String>(posterUrl);
    if (!nullToAbsent || vote != null) {
      map['vote'] = Variable<String>(vote);
    }
    return map;
  }

  FavouritesMoviesCompanion toCompanion(bool nullToAbsent) {
    return FavouritesMoviesCompanion(
      id: Value(id),
      title: Value(title),
      overview: Value(overview),
      releaseDate: Value(releaseDate),
      posterUrl: Value(posterUrl),
      vote: vote == null && nullToAbsent ? const Value.absent() : Value(vote),
    );
  }

  factory FavouritesMovie.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FavouritesMovie(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      overview: serializer.fromJson<String>(json['overview']),
      releaseDate: serializer.fromJson<String>(json['releaseDate']),
      posterUrl: serializer.fromJson<String>(json['posterUrl']),
      vote: serializer.fromJson<String?>(json['vote']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'overview': serializer.toJson<String>(overview),
      'releaseDate': serializer.toJson<String>(releaseDate),
      'posterUrl': serializer.toJson<String>(posterUrl),
      'vote': serializer.toJson<String?>(vote),
    };
  }

  FavouritesMovie copyWith(
          {int? id,
          String? title,
          String? overview,
          String? releaseDate,
          String? posterUrl,
          Value<String?> vote = const Value.absent()}) =>
      FavouritesMovie(
        id: id ?? this.id,
        title: title ?? this.title,
        overview: overview ?? this.overview,
        releaseDate: releaseDate ?? this.releaseDate,
        posterUrl: posterUrl ?? this.posterUrl,
        vote: vote.present ? vote.value : this.vote,
      );
  @override
  String toString() {
    return (StringBuffer('FavouritesMovie(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('overview: $overview, ')
          ..write('releaseDate: $releaseDate, ')
          ..write('posterUrl: $posterUrl, ')
          ..write('vote: $vote')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, title, overview, releaseDate, posterUrl, vote);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FavouritesMovie &&
          other.id == this.id &&
          other.title == this.title &&
          other.overview == this.overview &&
          other.releaseDate == this.releaseDate &&
          other.posterUrl == this.posterUrl &&
          other.vote == this.vote);
}

class FavouritesMoviesCompanion extends UpdateCompanion<FavouritesMovie> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> overview;
  final Value<String> releaseDate;
  final Value<String> posterUrl;
  final Value<String?> vote;
  const FavouritesMoviesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.overview = const Value.absent(),
    this.releaseDate = const Value.absent(),
    this.posterUrl = const Value.absent(),
    this.vote = const Value.absent(),
  });
  FavouritesMoviesCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String overview,
    required String releaseDate,
    required String posterUrl,
    this.vote = const Value.absent(),
  })  : title = Value(title),
        overview = Value(overview),
        releaseDate = Value(releaseDate),
        posterUrl = Value(posterUrl);
  static Insertable<FavouritesMovie> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? overview,
    Expression<String>? releaseDate,
    Expression<String>? posterUrl,
    Expression<String>? vote,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (overview != null) 'overview': overview,
      if (releaseDate != null) 'release_date': releaseDate,
      if (posterUrl != null) 'poster_url': posterUrl,
      if (vote != null) 'vote': vote,
    });
  }

  FavouritesMoviesCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? overview,
      Value<String>? releaseDate,
      Value<String>? posterUrl,
      Value<String?>? vote}) {
    return FavouritesMoviesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      overview: overview ?? this.overview,
      releaseDate: releaseDate ?? this.releaseDate,
      posterUrl: posterUrl ?? this.posterUrl,
      vote: vote ?? this.vote,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (overview.present) {
      map['overview'] = Variable<String>(overview.value);
    }
    if (releaseDate.present) {
      map['release_date'] = Variable<String>(releaseDate.value);
    }
    if (posterUrl.present) {
      map['poster_url'] = Variable<String>(posterUrl.value);
    }
    if (vote.present) {
      map['vote'] = Variable<String>(vote.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavouritesMoviesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('overview: $overview, ')
          ..write('releaseDate: $releaseDate, ')
          ..write('posterUrl: $posterUrl, ')
          ..write('vote: $vote')
          ..write(')'))
        .toString();
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(e);
  late final $FavouritesMoviesTable favouritesMovies =
      $FavouritesMoviesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [favouritesMovies];
}
