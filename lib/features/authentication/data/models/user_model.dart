class UserModel {
  String? firstName;
  String? lastName;
  String? roleId;
  String? email;
  String? password;
  String? passwordConfirmation;
  final String? emailVerifiedAt;
  final String? createdAt;
  final String? updatedAt;

  UserModel({
    this.roleId,
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
      roleId: data['role_id'],
      emailVerifiedAt: data['email_verified_at'],
      createdAt: data['created_at'],
      updatedAt: data['updated_at'],
    );
  }
}
