import 'package:rmpwebapp/structures/order.dart';

class Database{
  static List<dynamic> admin = [
    [3000, 4000, 3000], // quantity
    [3000, 4000, 3000] // aspace
  ];

  static List<dynamic> ilig1 = [
    [0, 0, 0], // quantity
    [3000, 4000, 5000], // aspace
    []
  ];

  static List<dynamic> ilig2 = [
    [0, 0, 0], // quantity
    [3000, 4000, 3000] // aspace
  ];

  static List<dynamic> kapat = [
    [0, 0, 0], // quantity
    [2000, 4000, 3300] // aspace
  ];

  static List<dynamic> maran = [
    [0, 0, 0], // quantity
    [3000, 4000, 1200], // aspace
    []
  ];

  static List<dynamic> auro = [
    [0, 0, 0], // quantity
    [1400, 1000, 2000] // aspace
  ];

  static List<Order> main_orders = [];
  static List<Order> from_supplier_orders = [];
  static Map<String, String> transcodes = {};

  static List<Order> getMainOrders(String username){
    List<Order> lo = [];
    if(username == 'Admin'){
      lo = from_supplier_orders;
    }else if(username == 'all'){
      lo = main_orders.toList();
    }else{
      lo = main_orders.where((order) => order.branch == username).toList();
    }
    return lo;
  }
}