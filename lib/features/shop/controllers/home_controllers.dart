import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  final carousalCurrentIndex = 0.obs;
  var isLoading = true.obs;
  var isDataFetched = false.obs;
  var homeVerticalIconProducts = RxList<DocumentSnapshot>([]);
  var products = RxList<DocumentSnapshot>([]);
  var bannerProducts = RxList<DocumentSnapshot>([]);
  var filteredProducts = RxList<DocumentSnapshot>([]);
  var sortedProducts = RxList<DocumentSnapshot>([]);
  var showAllProducts = false.obs;

  @override
  void onInit() {
    super.onInit();
    if (!isDataFetched.value) {
      fetchHomeVerticalIconProducts();
      fetchProducts();
    }
  }

  void updatePageIndicator(index) {
    carousalCurrentIndex.value = index;
  }

  Future<void> fetchHomeVerticalIconProducts() async {
    try {
      isLoading.value = true;
      QuerySnapshot snapshot = await FirebaseFirestore.instance.collectionGroup('Items').get();
      homeVerticalIconProducts.value = snapshot.docs.where((doc) => doc.id.split('-').first == 'HomeVerticalIcon').toList();
      isDataFetched.value = true;
    } catch (e) {
      print("Error fetching HomeVerticalIcon products: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchProducts() async {
    try {
      isLoading.value = true;
      QuerySnapshot snapshot = await FirebaseFirestore.instance.collectionGroup('Items').get();
      products.value = snapshot.docs;

      var bannerProductsList = <DocumentSnapshot>[];
      var categoryMap = <String, List<DocumentSnapshot>>{};

      for (var product in products) {
        String categoryId = product.id.split('-').first;
        if (categoryId == 'Banner') {
          bannerProductsList.add(product);
        } else if (categoryId != 'Banner' && categoryId != 'HomeVerticalIcon') {
          categoryMap.putIfAbsent(categoryId, () => []).add(product);
        }
      }

      bannerProducts.assignAll(bannerProductsList);
      updateSortedProductList('None');

      isDataFetched.value = true;

    } catch (e) {
      print("Error fetching products: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void updateSortedProductList(String sortOption) {
    var categoryMap = <String, List<DocumentSnapshot>>{};

    for (var product in products) {
      String categoryId = product.id.split('-').first;
      if (categoryId != 'Banner' && categoryId != 'HomeVerticalIcon') {
        categoryMap.putIfAbsent(categoryId, () => []).add(product);
      }
    }

    List<DocumentSnapshot> tempProducts = [];
    if (sortOption == 'None') {
      tempProducts = categoryMap.values.expand((list) => list.take(2)).toList();
    } else {
      tempProducts = categoryMap.values.expand((list) => list).toList();

      if (sortOption == 'Higher Price') {
        tempProducts.sort((a, b) {
          var priceA = parsePrice(a['Price']);
          var priceB = parsePrice(b['Price']);
          return priceB.compareTo(priceA);
        });
      } else if (sortOption == 'Lower Price') {
        tempProducts.sort((a, b) {
          var priceA = parsePrice(a['Price']);
          var priceB = parsePrice(b['Price']);
          return priceA.compareTo(priceB);
        });
      }
    }

    filteredProducts.assignAll(tempProducts);
    sortedProducts.assignAll(filteredProducts);
  }

  num parsePrice(dynamic price) {
    if (price is num) {
      return price;
    } else if (price is String) {
      try {
        return num.parse(price);
      } catch (e) {
        print('Error parsing price: $e');
        return 0;
      }
    } else {
      return 0;
    }
  }
}
