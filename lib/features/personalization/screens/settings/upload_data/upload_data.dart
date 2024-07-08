import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluom/data/services/database.dart';
import 'package:fluom/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UploadData extends StatefulWidget {
  const UploadData({super.key});

  @override
  State<UploadData> createState() => _UploadDataState();
}

class _UploadDataState extends State<UploadData> {
  final ImagePicker _picker = ImagePicker();
  File? selectedImage;
  TextEditingController nameController = TextEditingController();
  TextEditingController desController = TextEditingController();
  TextEditingController priceController = TextEditingController();

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
      "Price": priceController.text,
      "Details": desController.text,
    };

    await DatabaseMethods().addProduct(addProduct, selectedCategory!).then((value) {
      setState(() {
        uploading = false;
        selectedImage = null;
        nameController.text = "";
        priceController.text = "";
        desController.text = "";
      });
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.greenAccent,
          content: Text("Product Successfully Uploaded." ,
            style: TextStyle(fontSize: 20),))
      );
    });
  }
}

  String? selectedCategory;
  final List<String> categoryItems = [
    'Nike','Adidas', 'H&M', 'Zara', 'Puma','Converse','Tiffany & Co', 'Cartier', 'Nykaa', 'Mamaearth', 'Banner', 'HomeVerticalIcon'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Get.back();
          },
            child: const Icon(Icons.arrow_back_ios_new_outlined)),
        title: const Text("Add Product",),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 20.0,top: 20.0, bottom: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Upload the product image", style: TextStyle(fontWeight: FontWeight.w800, color: Colors.grey, fontSize: TSizes.fontSizeLg),),
              const SizedBox(height: 10,),
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
                    child: const Icon(Icons.camera_alt_outlined),
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
              const SizedBox(height: 10,),
              const Text("Product Name", style: TextStyle(fontWeight: FontWeight.w800, color: Colors.grey, fontSize: TSizes.fontSizeLg),),
              const SizedBox(height: 10,),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                width: MediaQuery.of(context).size.width / 1.11,
                decoration: BoxDecoration(
                  color: const Color(0xFFececf8),
                 borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    // hintText: 'Product Name',
                    // hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              const Text("Product Price", style: TextStyle(fontWeight: FontWeight.w800, color: Colors.grey, fontSize: TSizes.fontSizeLg),),
              const SizedBox(height: 10,),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                width: MediaQuery.of(context).size.width / 1.11,
                decoration: BoxDecoration(
                  color: const Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: priceController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    // hintText: 'Product Price',
                    // hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              const Text("Product Description", style: TextStyle(fontWeight: FontWeight.w800, color: Colors.grey, fontSize: TSizes.fontSizeLg),),
              const SizedBox(height: 10,),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                width: MediaQuery.of(context).size.width / 1.11,
                decoration: BoxDecoration(
                  color: const Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  maxLines: 4,
                  maxLength: 200,
                  controller: desController,
                  decoration: const InputDecoration(
                    hintText: 'Enter description',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              const Text("Product Brand", style: TextStyle(fontWeight: FontWeight.w800, color: Colors.grey, fontSize: TSizes.fontSizeLg),),
              const SizedBox(height: 10,),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: MediaQuery.of(context).size.width / 1.11,
                decoration: BoxDecoration(
                  color: const Color(0xFFececf8),
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
              const SizedBox(height: 30,),
              Center(
                child: uploading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                  onPressed: () {
                    uploadItem();
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
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
