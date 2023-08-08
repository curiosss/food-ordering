import 'dart:convert';

class User {
  final int id;
  final String name;
  final String surname;
  final String phone;
  final String trimmedPhone;
  final String email;
  final String password;
  final String token;
  final String createdAt;
  final String updatedAt;
  User({
    required this.id,
    required this.name,
    required this.surname,
    required this.phone,
    required this.trimmedPhone,
    required this.email,
    required this.password,
    required this.token,
    required this.createdAt,
    required this.updatedAt,
  });

  User copyWith({
    int? id,
    String? name,
    String? surname,
    String? phone,
    String? trimmedPhone,
    String? email,
    String? password,
    String? token,
    String? createdAt,
    String? updatedAt,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      phone: phone ?? this.phone,
      trimmedPhone: trimmedPhone ?? this.phone,
      email: email ?? this.email,
      password: password ?? this.password,
      token: token ?? this.token,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'surname': surname});
    result.addAll({'phone': phone});
    result.addAll({'trimmedPhone': trimmedPhone});
    result.addAll({'email': email});
    result.addAll({'password': password});
    result.addAll({'token': token});
    result.addAll({'createdAt': createdAt});
    result.addAll({'updatedAt': updatedAt});

    return result;
  }

  factory User.fromMap(Map<String, dynamic> map) {
    String phone = map['phone'] ?? '';
    String trimmedPhone = map['trimmedPhone'] ?? '';
    if (trimmedPhone.isEmpty && phone.isNotEmpty) {
      if (phone.startsWith('993')) {
        trimmedPhone = '+$phone';
      } else if (phone.startsWith('+993')) {
        trimmedPhone = phone;
      } else {
        trimmedPhone = '+993$phone';
      }
    }
    return User(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      surname: map['surname'] ?? '',
      phone: phone,
      trimmedPhone: trimmedPhone,
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      token: map['token'] ?? '',
      createdAt: map['createdAt'] ?? '',
      updatedAt: map['updatedAt'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(id: $id, name: $name, surname: $surname, phone: $phone, email: $email, password: $password, token: $token, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.id == id &&
        other.name == name &&
        other.surname == surname &&
        other.phone == phone &&
        other.email == email &&
        other.password == password &&
        other.token == token &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        surname.hashCode ^
        phone.hashCode ^
        email.hashCode ^
        password.hashCode ^
        token.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}
