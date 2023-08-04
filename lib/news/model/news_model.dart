// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class News {
  final String agency;
  final String category1;
  final String category2;
  final String date;
  final String description;
  final String image_courtesy;
  final String image_description;
  final String image_url1;
  final int loves;
  final String region;
  final String subregion;
  final String timestamp;
  final String title;
  News({
    required this.agency,
    required this.category1,
    required this.category2,
    required this.date,
    required this.description,
    required this.image_courtesy,
    required this.image_description,
    required this.image_url1,
    required this.loves,
    required this.region,
    required this.subregion,
    required this.timestamp,
    required this.title,
  });

  News copyWith({
    String? agency,
    String? category1,
    String? category2,
    String? date,
    String? description,
    String? image_courtesy,
    String? image_description,
    String? image_url1,
    int? loves,
    String? region,
    String? subregion,
    String? timestamp,
    String? title,
  }) {
    return News(
      agency: agency ?? this.agency,
      category1: category1 ?? this.category1,
      category2: category2 ?? this.category2,
      date: date ?? this.date,
      description: description ?? this.description,
      image_courtesy: image_courtesy ?? this.image_courtesy,
      image_description: image_description ?? this.image_description,
      image_url1: image_url1 ?? this.image_url1,
      loves: loves ?? this.loves,
      region: region ?? this.region,
      subregion: subregion ?? this.subregion,
      timestamp: timestamp ?? this.timestamp,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'agency': agency,
      'category1': category1,
      'category2': category2,
      'date': date,
      'description': description,
      'image_courtesy': image_courtesy,
      'image_description': image_description,
      'image_url1': image_url1,
      'loves': loves,
      'region': region,
      'subregion': subregion,
      'timestamp': timestamp,
      'title': title,
    };
  }

  factory News.fromMap(Map<String, dynamic> map) {
    return News(
      agency: map['agency'] as String,
      category1: map['category1'] as String,
      category2: map['category2'] as String,
      date: map['date'] as String,
      description: map['description'] as String,
      image_courtesy: map['image_courtesy'] as String,
      image_description: map['image_description'] as String,
      image_url1: map['image_url1'] as String,
      loves: map['loves'] as int,
      region: map['region'] as String,
      subregion: map['subregion'] as String,
      timestamp: map['timestamp'],
      title: map['title'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory News.fromJson(String source) =>
      News.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'News(agency: $agency, category1: $category1, category2: $category2, date: $date, description: $description, image_courtesy: $image_courtesy, image_description: $image_description, image_url1: $image_url1, loves: $loves, region: $region, subregion: $subregion, timestamp: $timestamp, title: $title)';
  }

  @override
  bool operator ==(covariant News other) {
    if (identical(this, other)) return true;

    return other.agency == agency &&
        other.category1 == category1 &&
        other.category2 == category2 &&
        other.date == date &&
        other.description == description &&
        other.image_courtesy == image_courtesy &&
        other.image_description == image_description &&
        other.image_url1 == image_url1 &&
        other.loves == loves &&
        other.region == region &&
        other.subregion == subregion &&
        other.timestamp == timestamp &&
        other.title == title;
  }

  @override
  int get hashCode {
    return agency.hashCode ^
        category1.hashCode ^
        category2.hashCode ^
        date.hashCode ^
        description.hashCode ^
        image_courtesy.hashCode ^
        image_description.hashCode ^
        image_url1.hashCode ^
        loves.hashCode ^
        region.hashCode ^
        subregion.hashCode ^
        timestamp.hashCode ^
        title.hashCode;
  }
}
