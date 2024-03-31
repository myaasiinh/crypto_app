import 'package:crypto_app/framework/dio_factory.dart';
import 'package:crypto_app/infra_api/crypto_feed_services.dart';

class CryptoFeedServiceFactory {
  static CryptoFeedService createCryptoFeedService() {
    final dio = HttpFactory.createDio();
    return CryptoFeedService(dio); // Assuming CryptoFeedService constructor accepts Dio instance.
  }
}
