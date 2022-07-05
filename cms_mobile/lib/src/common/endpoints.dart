class Endpoints {
  static const String apiVer = "api";
  //static const String apiVer1 = "api/v1.0";
  static const todos = "todos";

  /// Account enpoint version /api/v1

  static const accounts = '$apiVer/authenticate/login';
   /// Account enpoint version /api/v1
  //static const accounts = '$apiVer1/accounts';

  /// Login via firebase endpoint version /api/v1
  static const loginFirebase = '$apiVer/auth/login-firebase';

  /// Refresh token endpoint version /api/v1
  static const refreshToken = '$apiVer/auth/refresh-token';

  static const event = '$apiVer/moderator-manager/getEvents';


}
