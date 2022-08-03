import 'package:json_annotation/json_annotation.dart';
part 'gallery.g.dart';

@JsonSerializable()
class Gallery {
  final int? galleryId, eventId;
  final String? media, status;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Gallery.fromJson(Map<String, dynamic> json) =>
      _$GalleryFromJson(json);

  Gallery({
    this.galleryId,
    this.eventId,
    this.media,
    this.updatedAt,
    this.createdAt,
    this.status,
  });

   Map<String, dynamic> toJson() => _$GalleryToJson(this);

}