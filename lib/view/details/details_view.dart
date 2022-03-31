import 'package:e_commerce/core/view_model/cart_view_model.dart';
import 'package:e_commerce/model/cart_product_model.dart';
import 'package:e_commerce/model/product_model.dart';
import 'package:e_commerce/shared/constants/constants.dart';
import 'package:e_commerce/shared/style/dimensions.dart';
import 'package:e_commerce/shared/style/icon_broken.dart';
import 'package:e_commerce/view/widgets/custom_button.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsView extends StatelessWidget {
  final ProductModel productModel;

  DetailsView({Key? key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.centerLeft,
            children: [
              Image(
                image: NetworkImage('${productModel.image}'),
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.contain,
                height: 300,
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.04),
                    child: const Icon(
                      IconBroken.Arrow___Left_Circle,
                      color: Colors.black,
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.08),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 40.0,
                          width: 40.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              color: Colors.white),
                        ),
                        Image.asset(
                          '$urlImage/Icon_Wishlist.png',
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: '${productModel.name}',
                  fontSize: 26,
                ),
                hSizedBox3,
                Row(
                  children: [
                    Container(
                      height: 55.0,
                      width: MediaQuery.of(context).size.width * 0.43,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        border: Border.all(
                          color: Colors.grey.shade300,
                          width: 1.5,
                        ),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: CustomText(
                              text: 'Size',
                              fontSize: 14,
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: CustomText(
                              text: '${productModel.size}',
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.06,
                    ),
                    Container(
                      height: 55.0,
                      width: MediaQuery.of(context).size.width * 0.43,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        border: Border.all(
                          color: Colors.grey.shade300,
                          width: 1.5,
                        ),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: CustomText(
                              text: 'Color',
                              fontSize: 14,
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                              height: 22.0,
                              width: 22.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: productModel.color,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                hSizedBox3,
                CustomText(
                  text: 'Details',
                  fontSize: 18,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: CustomText(
                    text: '${productModel.description}',
                    fontSize: 14,
                    height: 3,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: 'PRICE',
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                      CustomText(
                        text: '\$${productModel.price}',
                        fontSize: 18,
                        color: primaryColor,
                      ),
                    ],
                  ),
                  GetBuilder<CartViewModel>(
                    init: CartViewModel(),
                    builder: (controller) => CustomButton(
                      height: 50.0,
                      text: 'ADD',
                      onPressed: () => controller.addProduct(CartProductModel(
                          name: productModel.name,
                          image: productModel.image,
                          price: productModel.price,
                          count: 1,
                          productId: productModel.productId
                      )),
                      width: 150.0,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}