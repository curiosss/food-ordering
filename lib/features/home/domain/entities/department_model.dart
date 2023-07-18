import 'dart:convert';

import 'package:rokus/config/constants/constants.dart';

class Department {
  int id;
  String name;
  String imageUrl;
  bool isEnabled;
  int count;
  String createdAt;
  String updatedAt;

  Department({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.isEnabled,
    this.count = 0,
    required this.createdAt,
    required this.updatedAt,
  });

  Department copyWith({
    int? id,
    String? name,
    String? imageUrl,
    bool? isEnabled,
    String? createdAt,
    String? updatedAt,
  }) {
    return Department(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      isEnabled: isEnabled ?? this.isEnabled,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'imageUrl': imageUrl});
    result.addAll({'isEnabled': isEnabled});
    result.addAll({'createdAt': createdAt});
    result.addAll({'updatedAt': updatedAt});

    return result;
  }

  factory Department.fromMap(Map<String, dynamic> map) {
    String imageUrl = '';
    if (map['imageUrl'] != null) {
      imageUrl = map['imageUrl'] ?? '';
      if (!imageUrl.startsWith('http')) {
        imageUrl = baseUrl + imageUrl;
      }
    }
    return Department(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      imageUrl: imageUrl,
      isEnabled: map['isEnabled'] ?? false,
      count: map['count'] ?? 0,
      createdAt: map['createdAt'] ?? '',
      updatedAt: map['updatedAt'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Department.fromJson(String source) =>
      Department.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Department(id: $id, name: $name, imageUrl: $imageUrl, isEnabled: $isEnabled, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Department &&
        other.id == id &&
        other.name == name &&
        other.imageUrl == imageUrl &&
        other.isEnabled == isEnabled &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        imageUrl.hashCode ^
        isEnabled.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}
