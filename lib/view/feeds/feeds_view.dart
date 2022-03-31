import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_commerce/core/view_model/home_view_model.dart';
import 'package:e_commerce/model/categary_model.dart';
import 'package:e_commerce/model/product_model.dart';
import 'package:e_commerce/shared/constants/constants.dart';
import 'package:e_commerce/shared/style/dimensions.dart';
import 'package:e_commerce/shared/style/icon_broken.dart';
import 'package:e_commerce/view/details/details_view.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedsView extends StatelessWidget {
  const FeedsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
        init: HomeViewModel(),
        builder: (controller) => ConditionalBuilder(
          condition: controller.isRefresh,
          builder: (context) => SingleChildScrollView(
            child: Padding(
              padding: padding(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 55,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(30.0)),
                    child: Center(
                      child: TextFormField(
                        cursorColor: Colors.black,
                        decoration: const InputDecoration(
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(left: 15.0),
                              child: Icon(
                                IconBroken.Search,
                                color: Colors.black,
                              ),
                            ),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none),
                      ),
                    ),
                  ),
                  hSizedBox3,
                  CustomText(
                    text: 'Categories',
                    fontSize: 25,
                  ),
                  hSizedBox2,
                  Container(
                    height: 120,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>
                          categoriesItem(controller.categorise[index]),
                      separatorBuilder: (context, index) => wSizedBox2,
                      itemCount: controller.categorise.length,
                    ),
                  ),
                  hSizedBox3,
                  Row(
                    children: [
                      CustomText(
                        text: 'Best Selling',
                        fontSize: 25.0,
                      ),
                      const Spacer(),
                      CustomText(
                        text: 'See all',
                        fontSize: 20.0,
                      )
                    ],
                  ),
                  hSizedBox2,
                  Container(
                    height: MediaQuery.of(context).size.height/2.5,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            Get.to(DetailsView(productModel: controller.products[index]), preventDuplicates: false);
                          },
                          child: productsItem(
                              controller.products[index], context)),
                      separatorBuilder: (context, index) => wSizedBox2,
                      itemCount: controller.products.length,
                    ),
                  ),
                ],
              ),
            ),
          ),
          fallback: (context) =>
          const Center(child: CircularProgressIndicator()),
        ));
  }

  Widget categoriesItem(CategoryViewModel categorise) => Column(
    children: [
      Container(
        height: 80.0,
        width: 80.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50), color: Colors.white),
        child: Image.network('${categorise.image}'),
      ),
      hSizedBox1,
      CustomText(
        text: '${categorise.name}',
        fontSize: 17.0,
      )
    ],
  );

  Widget productsItem(ProductModel product, context) => Container(
    width: MediaQuery.of(context).size.width / 2,
    height: 400,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(
          '${product.image}',
          fit: BoxFit.cover,
          height: 270.0,
        ),
        hSizedBox1,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: '${product.name}',
              sizeMaxLines: 1,
              fontSize: 20,
            ),
            const SizedBox(
              height: 4,
            ),
            CustomText(
              sizeMaxLines: 1,
              text: '${product.description}',
              fontSize: 18,
              color: Colors.grey,
            ),
            const SizedBox(
              height: 4,
            ),
            CustomText(
              text: '${product.price}',
              fontSize: 20,
              color: primaryColor,
            ),
          ],
        ),
      ],
    ),
  );
}