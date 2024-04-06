import 'package:crypto_app/infra/dio_client_result.dart';

abstract class DioClient {
  Stream<DioClientResult> get();
}
