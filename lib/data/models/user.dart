import '../../domain/entities/user.dart';
import '../export.dart';

class UserModel extends User {
  UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.phoneNumber,
    super.career,
    super.address,
    super.imageUrl,
  });

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? phoneNumber,
    String? career,
    String? address,
    String? imageUrl,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      career: career ?? this.career,
      address: address ?? this.address,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'career': career,
      'address': address,
      'imageUrl': imageUrl,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'].toString(),
      name: map['name'].toString(),
      email: map['email'].toString(),
      phoneNumber: map['phoneNumber'].toString(),
      career: map['career'].toString(),
      address: map['address'].toString(),
      imageUrl: map['imageUrl'].toString(),
    );
  }

  String toJson() => jsonEncode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(jsonDecode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, email: $email, phoneNumber: $phoneNumber, career: $career, address: $address, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.email == email && other.phoneNumber == phoneNumber && other.career == career && other.address == address && other.imageUrl == imageUrl;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ email.hashCode ^ phoneNumber.hashCode ^ career.hashCode ^ address.hashCode ^ imageUrl.hashCode;
  }
}
