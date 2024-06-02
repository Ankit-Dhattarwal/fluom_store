

import 'package:fluom/data/services/api_services.dart';
import 'package:get/get.dart';

import 'categories_model.dart';

class CategoryController extends GetxController{

  var isLoading = true.obs;

  var userList = <CategoriesModelAPi>[].obs;

  fetchUsers() async{
    try{
      isLoading(true);

      var userData = await ApiService().fetchUserData();

      userList.addAll(userData);

    }catch(e){
      print('Error fetching users data $e');
    }finally{
      isLoading(false);
    }
  }

  @override
  void onInit() {
    //
    fetchUsers();
    //
    super.onInit();
  }
}