
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluom/features/personalization/screens/sub-categories/sub_categories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/image_text_widget/vertical_images_text.dart';

class SliderCategory {
  final String image;
  final String title;

  SliderCategory(this.image, this.title);
}

class HomeCategories extends StatelessWidget {
  final List<DocumentSnapshot> categories;
  const HomeCategories({
    required this.categories,
    super.key,
  });

  // List<SliderCategory> getSliderCategories() {
  //   return [
  //     SliderCategory(TImages.SliderchappelIcons, 'Shoes'),
  //     SliderCategory(TImages.SliderschoolUniform, 'School Uniform'),
  //     SliderCategory(TImages.SlidersportsBowing, 'Sports Bowling'),
  //     SliderCategory(TImages.Slidercosmetics, 'Cosmetics'),
  //     SliderCategory(TImages.SliderFurnitureDiningChair, 'Furniture Dining Chair'),
  //     SliderCategory(TImages.SliderdogGHeart, 'Dog Heart'),
  //     SliderCategory(TImages.Slidersmartphone, 'Smartphone'),
  //     SliderCategory(TImages.SliderSparklingDiamond, 'Sparkling Diamond'),
  //     SliderCategory(TImages.Slidertailor, 'Tailor'),
  //     SliderCategory(TImages.SliderToyCar, 'Toy Car'),
  //   ];
  // }
  @override
  Widget build(BuildContext context) {
    //final sliderCategories = getSliderCategories();
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          final category = categories[index];
          final categoryData = category.data() as Map<String, dynamic>;
          final categoryImage = categoryData['Image'] as String;
          final categoryName = categoryData['name'] as String;
          return VerticalImageText(
            image: categoryImage,
            title: categoryName,
            onTap: () => Get.to(() => const SubCategoriesScreen()),
          );
        },
      ),
    );
  }
}

// import 'package:fluom/common/widgets/shimmers/category_shimmer.dart';
// import 'package:fluom/features/personalization/screens/sub-categories/sub_categories.dart';
// import 'package:fluom/features/shop/controllers/category_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../../../../common/widgets/image_text_widget/vertical_images_text.dart';
// import '../../../../../utils/constants/image_strings.dart';
//
// class HomeCategories extends StatelessWidget {
//   const HomeCategories({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//  //   final categoryController = Get.put(CategoryController());
//     return Obx((){
//       if(categoryController.isLoading.value) return const TCategoriesShimmer();
//
//       if(categoryController.featuredCategories.isEmpty){
//         return Center(child: Text('NO Data Found!', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white)));
//       }
//        return SizedBox(
//           height: 80,
//           child: ListView.builder(
//               shrinkWrap: true,
//               itemCount: categoryController.featuredCategories.length,
//               scrollDirection: Axis.horizontal,
//               itemBuilder: (_, index) {
//                 final category = categoryController.featuredCategories[index];
//                 return  VerticalImageText(image: category.image, title: category.name, onTap: () => Get.to(() => const SubCategoriesScreen()),);
//               }),
//         );
//       },
//     );
//   }
// }
