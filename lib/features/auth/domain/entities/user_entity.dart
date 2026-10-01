/// كيان المستخدم — نقي بدون تبعيات خارجية
class UserEntity {
  final String id;
  final String email;
  final String displayName;
  final String? photoUrl;

  const UserEntity({
    required this.id,
    required this.email,
    required this.displayName,
    this.photoUrl,
  });

  UserEntity copyWith({
    String? id,
    String? email,
    String? displayName,
    String? photoUrl,
  }) {
    return UserEntity(
      id: id ?? this.id,
      email: email ?? this.email,
      displayName: displayName ?? this.displayName,
      photoUrl: photoUrl ?? this.photoUrl,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserEntity && id == other.id && email == other.email;

  @override
  int get hashCode => id.hashCode ^ email.hashCode;
}
