
// Exception untuk menangani masalah koneksi
class ConnectivityException implements Exception {
  final String message;

  ConnectivityException({this.message = 'No internet connection'}) : super();
}

// Exception untuk menangani data yang tidak valid
class InvalidDataException implements Exception {
  final String message;

  InvalidDataException({this.message = 'Invalid data'}) : super();
}

// Exception untuk menangani error tidak diketahui
class UnknownError implements Exception {
  final String message;

  UnknownError({this.message = 'Unknown error'}) : super();
}
