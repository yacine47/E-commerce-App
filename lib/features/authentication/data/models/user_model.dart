class  UserModel {
  final String? firstName;
  final String? lastName;
  String? email;
  String? password;
  final String? emailVerifiedAt;
  final String? createdAt;
  final String? updatedAt;

  UserModel({
    this.firstName,
    this.lastName,
    this.email,
    this.createdAt,
    this.emailVerifiedAt,
    this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> data) {
    return UserModel(
      firstName: data['first_name'],
      lastName: data['last_name'],
      email: data['email'],
      emailVerifiedAt: data['email_verified_at'],
      createdAt: data['created_at'],
      updatedAt: data['updated_at'],
    );
  }
}
