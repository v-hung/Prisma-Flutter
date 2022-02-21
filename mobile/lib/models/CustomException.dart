class CustomException implements Exception {
  int status;
  String name;
  String message;
  List<Object> details;

  CustomException({ this.status = 400 , this.name = "", this.message = "", this.details = const [] });
}