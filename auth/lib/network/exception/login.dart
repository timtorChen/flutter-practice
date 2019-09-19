class NetworkException implements Exception{
  String message;
  NetworkException({this.message});

}

class AuthException implements Exception{
  String message;
  int statusCode;
  AuthException({this.message, this.statusCode});
}