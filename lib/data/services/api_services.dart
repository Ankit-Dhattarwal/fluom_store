import 'package:fluom/data/repositories/categories/categories_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  ///
  Future<List<CategoriesModelAPi>> fetchUserData() async{

    var response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));

    print('API Response Body: ${response.body}');
    if(response.statusCode == 200){
      return categoriesModelAPiFromJson(response.body);
    }else{
      throw Exception('Network error');
    }
  }
}