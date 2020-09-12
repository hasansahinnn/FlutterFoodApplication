import '../../core/constants/enums/http_enums.dart';
import '../models/Product.dart';
import 'base_service.dart';
import 'interfaces/IProductService.dart';

class ProductService extends BaseService implements IProductService {
  static ProductService _instance;
  static ProductService get instance {
    if (_instance == null) _instance = ProductService._init();
    return _instance;
  }

  //Get Most Popular 5 Product
  Future<List<Product>> getMostPopularProducts() async {
    return (await coreDio.fetch<List<Product>, Product>(
            "Product/GetMostPopular",
            type: HttpTypes.GET,
            parseModel: Product()))
        .data;
  }

  //Get Single Product
  Future<List<Product>> getProduct(int userId, int productId) async {
    return (await coreDio.fetch<List<Product>, Product>(
            "Product/GetProduct/$userId/$productId",
            type: HttpTypes.GET,
            parseModel: Product()))
        .data;
  }

  ProductService._init();
}
