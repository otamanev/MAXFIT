class UserNotExistsException implements Exception {
  String _message;
  UserNotExistsException(this._message);

  @override
  toString() => _message;

  String get message => _message;
}
