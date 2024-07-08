import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods{
  Future<void> addProduct(Map<String, dynamic> userInfoMap, String categoryname) async {
    // Get a reference to the 'Items' collection under the 'Products/categoryname'
    CollectionReference itemsRef = FirebaseFirestore.instance
        .collection('Products')
        .doc(categoryname)
        .collection('Items');

    // Get the count of existing items in the 'Items' collection
    QuerySnapshot countQuery = await itemsRef.get();
    int itemCount = countQuery.size;

    // Construct the document ID as 'categoryname-itemCount'
    String documentId = '$categoryname-${itemCount + 1}';

    // Add the userInfoMap with the constructed document ID
    await itemsRef.doc(documentId).set(userInfoMap);
  }

  Future<Stream<QuerySnapshot>> getProducts(String category) async{
    return await FirebaseFirestore.instance.collection(category).snapshots();
  }

}

