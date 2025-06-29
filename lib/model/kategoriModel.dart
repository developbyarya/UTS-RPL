class KategoriModel {
  final String id;
  final String name;
  final String description;
  final DateTime date;

  KategoriModel({
    required this.id,
    required this.name,
    required this.description,
    required this.date,
  });

  // Factory constructor to create KategoriModel from JSON
  factory KategoriModel.fromJson(Map<String, dynamic> json) {
    return KategoriModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      date: json['date'] != null 
          ? DateTime.parse(json['date']) 
          : DateTime.now(),
    );
  }

  // Method to convert KategoriModel to JSON
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'description': description,
      'date': date.toIso8601String(),
    };
  }

  // Copy with method for creating modified instances
  KategoriModel copyWith({
    String? id,
    String? name,
    String? description,
    DateTime? date,
  }) {
    return KategoriModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      date: date ?? this.date,
    );
  }

  // Override toString for debugging
  @override
  String toString() {
    return 'KategoriModel(id: $id, name: $name, description: $description, date: $date)';
  }

  // Override equality operator
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is KategoriModel &&
        other.id == id &&
        other.name == name &&
        other.description == description &&
        other.date == date;
  }

  // Override hashCode
  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        date.hashCode;
  }
}
