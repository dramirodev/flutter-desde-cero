import 'package:freezed_annotation/freezed_annotation.dart';

import '../../typedefs.dart';

part 'media.freezed.dart';
part 'media.g.dart';

enum MediaType {
  @JsonValue('movie')
  movie,
  @JsonValue('tv')
  tv
}

@freezed
class Media with _$Media {
  factory Media({
    required int id,
    @JsonKey(
      readValue: readTitleValue,
    )
        required String title,
    required String overview,
    @JsonKey(
      name: 'original_title',
      readValue: readOriginaTitleValue,
    )
        required String originalTitle,
    @JsonKey(name: 'poster_path')
        required String posterPath,
    @JsonKey(name: 'backdrop_path')
        required String backdropPath,
    @JsonKey(name: 'vote_average')
        required double voteAverage,
    @JsonKey(name: 'media_type')
        required MediaType type,
  }) = _Media;

  factory Media.fromJson(Json json) => _$MediaFromJson(json);
}

Object? readTitleValue(Map map, String _) {
  return map['title'] ?? map['name'];
}

Object? readOriginaTitleValue(Map map, String _) {
  return map['original_title'] ?? map['original_name'];
}

getMediaList(List list) {
  return list
      .where(
        (element) =>
            element['media_type'] != 'person' &&
            element['poster_path'] != null &&
            element['backdrop_path'] != null,
      )
      .map((e) => Media.fromJson(e))
      .toList();
}