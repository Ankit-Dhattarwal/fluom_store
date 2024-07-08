import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  static HomeController get instance => Get.find();

  final carousalCurrentIndex = 0.obs;

  var isLoading = true.obs;
  var homeVerticalIconProducts = <DocumentSnapshot>[].obs;
  var products = <DocumentSnapshot>[].obs;
  var bannerProducts = <DocumentSnapshot>[].obs;
  var filteredProducts = <DocumentSnapshot>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchHomeVerticalIconProducts();
    fetchProducts();
  }
  void updatePageIndicator(index){
    carousalCurrentIndex.value = index;
  }

  Future<void> fetchHomeVerticalIconProducts() async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance.collectionGroup('Items').get();
      homeVerticalIconProducts.value = snapshot.docs.where((doc) => doc.id.split('-').first == 'HomeVerticalIcon').toList();
    } catch (e) {
      print("Error fetching HomeVerticalIcon products: $e");
    }
  }

  Future<void> fetchProducts() async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance.collectionGroup('Items').get();
      products.value = snapshot.docs;

      var bannerProductsList = <DocumentSnapshot>[];
      var categoryMap = <String, List<DocumentSnapshot>>{};

      for (var product in products) {
        String categoryId = product.id.split('-').first;
        if (categoryId == 'Banner') {
          bannerProductsList.add(product);
        } else {
          categoryMap.putIfAbsent(categoryId, () => []).add(product);
        }
      }

      bannerProducts.value = bannerProductsList;
      filteredProducts.value = categoryMap.values.expand((list) => list.take(2)).toList();
    } catch (e) {
      print("Error fetching products: $e");
    } finally {
      isLoading.value = false;
    }
  }

}