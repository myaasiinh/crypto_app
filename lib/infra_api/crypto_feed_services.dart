
import 'package:crypto_app/domain/crypto_feed.dart';
import 'package:crypto_app/infra_api/cryptofeed_dio_client.dart';

class CryptoFeedService {
  final CryptoFeedDioClient dioClient;

  CryptoFeedService({required this.dioClient});

  Future<List<CoinItem>> fetchCryptoFeed() async {
    try {
      // Panggil metode untuk mengambil data dari API menggunakan dioClient
      final response = await dioClient.getCryptoFeed();

      // Mengonversi respons ke dalam model CoinItem
      // (Anda harus mengonversi respons JSON ke objek model sesuai dengan struktur respons API yang sebenarnya)
      final List<CoinItem> cryptoFeed = []; // Simpan data yang diambil di sini
      // response.data.forEach((item) {
      //           cryptoFeed.add(CoinItem.fromJson(item));
      //         });
      
      return cryptoFeed;
    } catch (e) {
      throw Exception('Failed to fetch crypto feed: $e');
    }
  }
}
