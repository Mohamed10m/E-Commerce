import 'package:e_commerce/model/cart_product_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CartDatabaseHelper {
  CartDatabaseHelper._();

  static final CartDatabaseHelper db = CartDatabaseHelper._();

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await initDb();
    return _database;
  }


  initDb() async {
    String path = join(await getDatabasesPath(), 'cartProduct');
    // await deleteDatabase(path);
    return await openDatabase(path, version: 1,
        onCreate: (Database db,int version) async {
          await db.execute(
              'CREATE TABLE cartProduct (name TEXT, image TEXT, price TEXT, count INTEGER, productId TEXT)');
        });

  }

  Future insertDatabase(CartProductModel model) async
  {
    var dbClient = await database;
    await dbClient!.insert(
        'cartProduct',
        model.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace
    );
  }


  getAllProduct()async {
    var dbClient = await database;
    List<Map> maps = await dbClient!.query('cartProduct');
    List<CartProductModel> list = maps.isNotEmpty ? maps.map((value) => CartProductModel.fromJson(value)).toList() : [];
    return list;
  }

  update(CartProductModel model) async {
    var dbClient = await database;
    return await dbClient!.update('cartProduct', model.toMap(),
        where: 'productId = ?', whereArgs: [model.productId]);
  }
  delete(CartProductModel model) async {
    var dbClient = await database;
    return await dbClient!.delete('cartProduct', where: 'productId = ?', whereArgs: [model.productId]);
  }


}