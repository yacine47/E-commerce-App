import 'package:ecommerce_app/features/authentication/data/models/user_model.dart';

class TokenModel {
  final String accessToken;
  final String tokenType;
  final int expiresIn;
  final UserModel userModel;

  TokenModel(
      {required this.accessToken,
      required this.tokenType,
      required this.expiresIn,
      required this.userModel});

  factory TokenModel.fromJson(Map<String, dynamic> data) {
    return TokenModel(
      accessToken: data['access_token'],
      tokenType: data['token_type'],
      expiresIn: data['expires_in'],
      userModel: UserModel.fromJson(data['user']),
    );
  }
}
