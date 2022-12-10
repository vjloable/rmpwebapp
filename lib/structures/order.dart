import 'package:rmpwebapp/structures/medicine.dart';

class Order{
  Order(this.tcode, this.date, this.branch, this.total, this.medicine, this.supplier);

  List<String> statuses = ['PENDING','ON THE WAY','DELIVERED'];
  List<Medicine> medicine = [];
  String tcode = '';
  String date = '';
  String arrival = '-';
  String branch = '';
  String supplier = '';
  double total = 0;
  int status = 1;

  String getTcode() => tcode;
  String getDate() => date;

  String getStatus() => statuses.elementAt(status-1);
  void changeStatus(int status) {
    this.status = status;
  }

}