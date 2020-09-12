import '../../models/Product.dart';

abstract class IProductService {
  Future<List<Product>> getMostPopularProducts();
  Future<List<Product>> getProduct(int userId, int productId);
}
