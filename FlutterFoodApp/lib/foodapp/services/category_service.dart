import '../../core/constants/enums/http_enums.dart';
import '../models/Categories.dart';
import 'base_service.dart';
import 'interfaces/ICategoryService.dart';

class CategoryService extends BaseService implements ICategoryService {
  static CategoryService _instance;
  static CategoryService get instance {
    if (_instance == null) _instance = CategoryService._init();
    return _instance;
  }

  CategoryService._init();
  //Return All Categories
  Future<List<Categories>> getCategoryList() async {
    return (await coreDio.fetch<List<Categories>, Categories>(
            "Categories/GetAll",
            type: HttpTypes.GET,
            parseModel: Categories()))
        .data;
  }
}
