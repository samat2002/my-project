import 'dart:convert';

import 'aired.dart';
import 'broadcast.dart';
import 'genre.dart';
import 'images.dart';
import 'licensor.dart';
import 'producer.dart';
import 'studio.dart';
import 'theme.dart';
import 'title.dart';
import 'trailer.dart';

class Datum {
  int? malId;
  String? url;
  Images? images;
  Trailer? trailer;
  bool? approved;
  List<Title>? titles;
  String? title;
  String? titleEnglish;
  String? titleJapanese;
  List<dynamic>? titleSynonyms;
  String? type;
  String? source;
  int? episodes;
  String? status;
  bool? airing;
  Aired? aired;
  String? duration;
  String? rating;
  double? score;
  int? scoredBy;
  int? rank;
  int? popularity;
  int? members;
  int? favorites;
  String? synopsis;
  String? background;
  String? season;
  int? year;
  Broadcast? broadcast;
  List<Producer>? producers;
  List<Licensor>? licensors;
  List<Studio>? studios;
  List<Genre>? genres;
  List<dynamic>? explicitGenres;
  List<Theme>? themes;
  List<dynamic>? demographics;

  Datum({
    this.malId,
    this.url,
    this.images,
    this.trailer,
    this.approved,
    this.titles,
    this.title,
    this.titleEnglish,
    this.titleJapanese,
    this.titleSynonyms,
    this.type,
    this.source,
    this.episodes,
    this.status,
    this.airing,
    this.aired,
    this.duration,
    this.rating,
    this.score,
    this.scoredBy,
    this.rank,
    this.popularity,
    this.members,
    this.favorites,
    this.synopsis,
    this.background,
    this.season,
    this.year,
    this.broadcast,
    this.producers,
    this.licensors,
    this.studios,
    this.genres,
    this.explicitGenres,
    this.themes,
    this.demographics,
  });

  @override
  String toString() {
    return 'Datum(malId: $malId, url: $url, images: $images, trailer: $trailer, approved: $approved, titles: $titles, title: $title, titleEnglish: $titleEnglish, titleJapanese: $titleJapanese, titleSynonyms: $titleSynonyms, type: $type, source: $source, episodes: $episodes, status: $status, airing: $airing, aired: $aired, duration: $duration, rating: $rating, score: $score, scoredBy: $scoredBy, rank: $rank, popularity: $popularity, members: $members, favorites: $favorites, synopsis: $synopsis, background: $background, season: $season, year: $year, broadcast: $broadcast, producers: $producers, licensors: $licensors, studios: $studios, genres: $genres, explicitGenres: $explicitGenres, themes: $themes, demographics: $demographics)';
  }

  factory Datum.fromMap(Map<String, dynamic> data) => Datum(
        malId: data['mal_id'] as int?,
        url: data['url'] as String?,
        images: data['images'] == null
            ? null
            : Images.fromMap(data['images'] as Map<String, dynamic>),
        trailer: data['trailer'] == null
            ? null
            : Trailer.fromMap(data['trailer'] as Map<String, dynamic>),
        approved: data['approved'] as bool?,
        title: data['title'] as String?,
        titleEnglish: data['title_english'] as String?,
        titleJapanese: data['title_japanese'] as String?,
        titleSynonyms: data['title_synonyms'] as List<dynamic>?,
        type: data['type'] as String?,
        source: data['source'] as String?,
        episodes: data['episodes'] as int?,
        status: data['status'] as String?,
        airing: data['airing'] as bool?,
        aired: data['aired'] == null
            ? null
            : Aired.fromMap(data['aired'] as Map<String, dynamic>),
        duration: data['duration'] as String?,
        rating: data['rating'] as String?,
        score: (data['score'] as num?)?.toDouble(),
        scoredBy: data['scored_by'] as int?,
        rank: data['rank'] as int?,
        popularity: data['popularity'] as int?,
        members: data['members'] as int?,
        favorites: data['favorites'] as int?,
        synopsis: data['synopsis'] as String?,
        background: data['background'] as String?,
        season: data['season'] as String?,
        year: data['year'] as int?,
        broadcast: data['broadcast'] == null
            ? null
            : Broadcast.fromMap(data['broadcast'] as Map<String, dynamic>),
        producers: (data['producers'] as List<dynamic>?)
            ?.map((e) => Producer.fromMap(e as Map<String, dynamic>))
            .toList(),
        licensors: (data['licensors'] as List<dynamic>?)
            ?.map((e) => Licensor.fromMap(e as Map<String, dynamic>))
            .toList(),
        studios: (data['studios'] as List<dynamic>?)
            ?.map((e) => Studio.fromMap(e as Map<String, dynamic>))
            .toList(),
        genres: (data['genres'] as List<dynamic>?)
            ?.map((e) => Genre.fromMap(e as Map<String, dynamic>))
            .toList(),
        explicitGenres: data['explicit_genres'] as List<dynamic>?,
        themes: (data['themes'] as List<dynamic>?)
            ?.map((e) => Theme.fromMap(e as Map<String, dynamic>))
            .toList(),
        demographics: data['demographics'] as List<dynamic>?,
      );

  Map<String, dynamic> toMap() => {
        'mal_id': malId,
        'url': url,
        'images': images?.toMap(),
        'trailer': trailer?.toMap(),
        'approved': approved,
        'title': title,
        'title_english': titleEnglish,
        'title_japanese': titleJapanese,
        'title_synonyms': titleSynonyms,
        'type': type,
        'source': source,
        'episodes': episodes,
        'status': status,
        'airing': airing,
        'aired': aired?.toMap(),
        'duration': duration,
        'rating': rating,
        'score': score,
        'scored_by': scoredBy,
        'rank': rank,
        'popularity': popularity,
        'members': members,
        'favorites': favorites,
        'synopsis': synopsis,
        'background': background,
        'season': season,
        'year': year,
        'broadcast': broadcast?.toMap(),
        'producers': producers?.map((e) => e.toMap()).toList(),
        'licensors': licensors?.map((e) => e.toMap()).toList(),
        'studios': studios?.map((e) => e.toMap()).toList(),
        'genres': genres?.map((e) => e.toMap()).toList(),
        'explicit_genres': explicitGenres,
        'themes': themes?.map((e) => e.toMap()).toList(),
        'demographics': demographics,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Datum].
  factory Datum.fromJson(String data) {
    return Datum.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Datum] to a JSON string.
  String toJson() => json.encode(toMap());
}
