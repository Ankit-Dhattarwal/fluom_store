import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods{

  Future addProduct(Map<String, dynamic> userInfoMap, String categoryname) async {
    CollectionReference productsCollection = FirebaseFirestore.instance.collection('Products');

     DocumentReference newProductRef = productsCollection.doc(categoryname);
    await newProductRef.set(userInfoMap);
  }
  Future<Stream<QuerySnapshot>> getProducts(String category) async{
    return await FirebaseFirestore.instance.collection(category).snapshots();
  }

}

