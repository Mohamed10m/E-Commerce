import 'package:e_commerce/core/service/database/cart_database_helper.dart';
import 'package:e_commerce/model/cart_product_model.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController {

  var dbHelper = CartDatabaseHelper.db;

  bool get loading => _loading;
  bool _loading = false;

  List<CartProductModel> _cartProduct = [];
  List<CartProductModel> get cartProduct => _cartProduct;

  double get total => _total;
  double _total = 0.0;

  CartViewModel(){
    getAllProductModel();
  }

  addProduct(CartProductModel cartDatabaseModel) async {
    for(int i=0;i < _cartProduct.length; i++)
    {
      if(_cartProduct[i].productId == cartDatabaseModel.productId)
      {
        return;
      }
    }

    await dbHelper.insertDatabase(cartDatabaseModel);
    _cartProduct.add(cartDatabaseModel);
    _total += (double.parse(cartDatabaseModel.price!) * cartDatabaseModel.count!);
    update();

  }


  getAllProductModel() async {
    _loading = false;
    _cartProduct = await dbHelper.getAllProduct();
    getTotal();
    _loading = false;
    update();
  }

  getTotal(){
    for(int i=0; i < _cartProduct.length ;i++)
    {
      _total += (double.parse(_cartProduct[i].price!) * _cartProduct[i].count!);
    }
  }
  addCount(int index) async {
    if ( _cartProduct[index].count != null)  _cartProduct[index].count =  _cartProduct[index].count! + 1;
    _total += double.parse(_cartProduct[index].price!);
    await dbHelper.update(_cartProduct[index]);
    update();
  }
  removeCount(int index) async {
    if ( _cartProduct[index].count != null)  _cartProduct[index].count =  _cartProduct[index].count! - 1;
    _total -= double.parse(_cartProduct[index].price!);
    await dbHelper.update(_cartProduct[index]);
    if(_cartProduct[index].count == 0) await dbHelper.delete(_cartProduct[index]);
    update();
  }



}