import '../../models/Categories.dart';

abstract class ICategoryService {
  Future<List<Categories>> getCategoryList();
}
