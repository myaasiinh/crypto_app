// Model untuk menampung hasil dari HTTP client
class HttpClientResult<T> {
  final T? data;
  final Exception? error;

  HttpClientResult.success(this.data) : error = null;
  HttpClientResult.failure(this.error) : data = null;
}

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
class UnknownError implements Exception {}