abstract class User {
  final String id;
  final String name;
  final String email;
  final String phoneNumber;
  final String? career;
  final String? address;
  final String? imageUrl;
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.career,
    required this.address,
    required this.imageUrl,
  });
}
