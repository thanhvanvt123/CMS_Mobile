// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gallery.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************


Gallery _$GalleryFromJson(Map<String, dynamic> json) {
  return Gallery(
    //userId: json['accountId'] as int?,
    galleryId: json['galleryId'] as int?,
    media: json['media'] as String?,
    eventId: json['eventId'] as int?,
    status: json['status'] as String?,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
  );
}

Map<String, dynamic> _$GalleryToJson(Gallery instance) => <String, dynamic>{
      //'accountId': instance.userId,
      'galleryId': instance.galleryId,
      'media': instance.media,
      'eventId': instance.eventId,
      'status': instance.status,     
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

