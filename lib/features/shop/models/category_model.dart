//
//
//
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class CategoryModel {
//   String id;
//   String name;
//   String image;
//   String parentId;
//   bool isFeatured;
//
//   CategoryModel({
//     required this.id,
//     required this.name,
//     required this.image,
//     required this.isFeatured,
//     this.parentId = '',
//   });
//
//   /// Empty Helper Function
//  static CategoryModel empty() => CategoryModel(id: '', name: '', image: '', isFeatured: false);
//
// /// Convert model to Json structure so that you can store data in Firebase
// Map<String, dynamic> toJson(){
//   return{
//   'Name': name,
//   'Image': image,
//   'Parentid': parentId,
//   'IsFeatured': isFeatured,
//   };
// }
//
// /// Map Json oriented document snapshot from Firebase to UserModel
//   ///  Create multiple constructor in dart use the factory method
// factory CategoryModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
//   if(document.data() != null) {
//     final data = document.data()!;
//
//     // Map JSON Record to Model
//     return CategoryModel(
//         id: document.id,
//         name: data['Name'] ?? '',
//         image: data['Image'] ?? '',
//         isFeatured: data['IsFeatured'] ?? false,
//     );
//   }
//   else{
//     return CategoryModel.empty();
//   }
// }
// }
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
