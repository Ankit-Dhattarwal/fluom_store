import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluom/data/services/database.dart';
import 'package:fluom/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';

class UploadData extends StatefulWidget {
  const UploadData({super.key});

  @override
  State<UploadData> createState() => _UploadDataState();
}

class _UploadDataState extends State<UploadData> {
  final ImagePicker _picker = ImagePicker();
  File? selectedImage;
  TextEditingController nameController = new TextEditingController();

  bool uploading = false;

Future getImage() async{
  var image = await _picker.pickImage(source: ImageSource.gallery);
  selectedImage = File(image!.path);
  setState(() {

  });
}
  String generateUniqueId() {
    return DateTime.now().millisecondsSinceEpoch.toString();
  }

Future uploadItem() async{
  if(selectedImage!= null && nameController.text != ''){
    setState(() {
      uploading = true;
    });
    String addId = generateUniqueId();
    Reference firebaseStorageRef = FirebaseStorage.instance.ref().child("productImage").child(addId);

    final UploadTask task = firebaseStorageRef.putFile(selectedImage!);
    var downloadUrl = await (await task).ref.getDownloadURL();

    Map<String, dynamic> addProduct = {
      "name": nameController.text,
      "Image": downloadUrl,
    };

    await DatabaseMethods().addProduct(addProduct, selectedCategory!).then((value) {
      uploading = false;
      selectedImage = null;
      nameController.text = "";
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.greenAccent,
          content: Text("Product Successfully Uploaded." ,
            style: TextStyle(fontSize: 20),))
      );
    });
  }
}

  String? selectedCategory;
  final List<String> categoryItems = [
    'Nike','Adidas', 'H&M', 'Zara', 'Puma','Converse','Tiffany & Co', 'Cartier', 'Nykaa', 'Mamaearth'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Get.back();
          },
            child: Icon(Icons.arrow_back_ios_new_outlined)),
        title: Text("Add Product",),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 20.0,top: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Upload the product image", style: TextStyle(fontWeight: FontWeight.w800, color: Colors.grey, fontSize: TSizes.fontSizeLg),),
              SizedBox(height: 10,),
             selectedImage==null ? GestureDetector(
                onTap: (){
                  getImage();
                },
                child: Center(
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1.5),borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.camera_alt_outlined),
                  ),
                ),
              )
             : Center(
               child: Material(
                 elevation: 4.0,
                 borderRadius: BorderRadius.circular(20),
                 child: Container(
                   height: 150,
                   width: 150,
                   decoration: BoxDecoration(
                     border: Border.all(color: Colors.black, width: 1.5),borderRadius: BorderRadius.circular(10),
                   ),
                   child: ClipRRect(
                       borderRadius: BorderRadius.circular(20),
                       child: Image.file(selectedImage!, fit: BoxFit.cover,)),
                 ),
               ),
             ),
              SizedBox(height: 10,),
              Text("Product Name", style: TextStyle(fontWeight: FontWeight.w800, color: Colors.grey, fontSize: TSizes.fontSizeLg),),
              SizedBox(height: 10,),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                width: MediaQuery.of(context).size.width / 1.11,
                decoration: BoxDecoration(
                  color: Color(0xFFececf8),
                 borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Text("Product Brand", style: TextStyle(fontWeight: FontWeight.w800, color: Colors.grey, fontSize: TSizes.fontSizeLg),),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: MediaQuery.of(context).size.width / 1.11,
                decoration: BoxDecoration(
                  color: Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: selectedCategory,
                    items: categoryItems.map((item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedCategory = newValue;
                      });
                    },
                    hint: const Text('Select a brand'),
                    isExpanded: true,
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Center(
                child: uploading
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                  onPressed: () {
                    uploadItem();
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 5.0,
                  ),
                  child: const Text(
                    "Add Product",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),          ],
          ),
        ),
      ),
    );
  }
}
