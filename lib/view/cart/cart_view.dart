import 'package:e_commerce/core/view_model/cart_view_model.dart';
import 'package:e_commerce/model/cart_product_model.dart';
import 'package:e_commerce/shared/constants/constants.dart';
import 'package:e_commerce/shared/style/dimensions.dart';
import 'package:e_commerce/view/checkout/checkout_view.dart';
import 'package:e_commerce/view/widgets/custom_button.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
      init: CartViewModel(),
      builder: (controller) => controller.total != 0 && controller.cartProduct.isNotEmpty
          ? Scaffold(
          body: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.6949,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    if (controller.cartProduct[index].count != 0) {
                      return cartBuildItem(context, index,
                          controller.cartProduct[index], controller);
                    }
                    return const SizedBox.shrink();
                  },
                  itemCount: controller.cartProduct.length,
                ),
              ),
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 35.0, vertical: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: 'TOTAL',
                            fontSize: 14,
                            color: Colors.grey,
                            fontFamily: 'DisplayRegular',
                          ),
                          CustomText(
                            text: '\$${controller.total}',
                            fontSize: 20,
                            color: primaryColor,
                            fontFamily: 'DisplayRegularBold',
                          ),
                        ],
                      ),
                      CustomButton(
                        height: 60.0,
                        text: 'CHECKOUT',
                        onPressed: () {
                          Get.to(CheckOutView());
                        },
                        width: 170.0,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )) :
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              '$urlImage/cart.svg',
              height: 250.0,
              width: 250.0,
            ),
            hSizedBox2,
            CustomText(
              text: 'Cart Empty',
              fontSize: 30,
              color: primaryColor,
              alignment: Alignment.center,
            )
          ],
        ),
      ),
    );
  }

  Widget cartBuildItem(context, int index, CartProductModel cartProduct,
      CartViewModel controller) =>
      Dismissible(
        background: Container(
          alignment: Alignment.centerLeft,
          color: HexColor('FFC107'),
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Image.asset('$urlImage/Icon_Wishlist1.png'),
          ),
        ),
        secondaryBackground: Container(
          alignment: Alignment.centerRight,
          color: HexColor('FF3D00'),
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Image.asset('$urlImage/Icon_Delete.png'),
          ),
        ),
        key: UniqueKey(),
        child: Padding(
          padding: padding1(context),
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  '${cartProduct.image}',
                  height: 150.0,
                  width: 150.0,
                  fit: BoxFit.fill,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomText(
                          text: '${cartProduct.name}',
                          fontSize: 16,
                          fontFamily: 'DisplayRegularMedium',
                        ),
                      ),
                      hSizedBox1,
                      Center(
                        child: CustomText(
                          text: '\$${cartProduct.price}',
                          fontSize: 18,
                          color: primaryColor,
                          fontFamily: 'DisplayRegularBold',
                        ),
                      ),
                      hSizedBox1,
                      Container(
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3.0),
                            color: Colors.grey.shade200),
                        child: Row(
                          children: [
                            TextButton(
                                onPressed: () {
                                  controller.addCount(index);
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: const Size(50, 30),
                                ),
                                child: const Icon(
                                  Icons.add,
                                  size: 15,
                                  color: Colors.black45,
                                )),
                            Center(
                              child: Center(
                                child: CustomText(
                                  text: '${cartProduct.count}',
                                  fontSize: 20,
                                  fontFamily: 'DisplayRegular',
                                ),
                              ),
                            ),
                            TextButton(
                                onPressed: () {
                                  controller.removeCount(index);
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: const Size(50, 30),
                                ),
                                child: const Icon(
                                  Icons.remove,
                                  size: 15,
                                  color: Colors.black45,
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}