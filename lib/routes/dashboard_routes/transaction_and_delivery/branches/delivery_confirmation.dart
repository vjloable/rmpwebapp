import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rmpwebapp/services/notifications.dart';
import 'package:rmpwebapp/structures/database.dart';
import 'package:rmpwebapp/structures/order.dart';

final formatCurrency = NumberFormat.currency(symbol: '₱');

class NewDataRow{
  final String transcode, branch;
  final double cost;
  final context;
  final Function(String x, Order y) callback;
  final Order order;
  NewDataRow({required this.order, required this.callback, required this.transcode, required this.branch, required this.cost, required this.context});

  DataRow generate() {
    return DataRow(
        cells: [
          DataCell(Center(child: Text(transcode))),
          DataCell(Center(child: Text(branch))),
          DataCell(Center(child: Text(formatCurrency.format(cost)))),
          DataCell(
              Center(
                child: SizedBox(
                  width: 200,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(Colors.brown),
                            shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(1))))
                        ),
                        onPressed: (){
                          callback('deny', order);
                        },
                        child: const Center(child: Padding(
                          padding: EdgeInsets.all(7.0),
                          child: Icon(Icons.close, color: Colors.white, size: 20),
                        )),
                      ),
                      ElevatedButton(
                          style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(Color(0xFFDDBEAA)),
                              shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(1))))
                          ),
                          onPressed: (){
                            callback('allow', order);
                          },
                          child: const Center(child: Padding(
                            padding: EdgeInsets.all(7.0),
                            child: Icon(Icons.check, color: Colors.white, size: 20),
                          )),
                      ),
                    ],
                  ),
                ),
              )
          ),
        ]
    );
  }
}

class DeliveryConfirmation extends StatefulWidget {
  final String session;
  final Map<String, String> credentials;
  const DeliveryConfirmation({required this.credentials, required this.session, Key? key}) : super(key: key);

  @override
  State<DeliveryConfirmation> createState() => _DeliveryConfirmationState();
}

class _DeliveryConfirmationState extends State<DeliveryConfirmation> {
  final _scrollController = ScrollController();
  List<Order> orders = [];
  bool isAdmin = false;

  @override
  void initState() {
    verifySession();
    refresh();
    super.initState();
  }

  void verifySession(){
    if(widget.session == 'admin'){
      isAdmin = true;
    }else if(widget.session == 'user'){
      isAdmin = false;
    }
  }

  void refresh(){
    setState(() {
      orders = Database.getMainOrders('all').where((element) => element.status == 1).toList().reversed.toList();
    });
  }

  ///aurora_branch@rmp.com
  void confirmation(String action, Order order){
    if(action == 'deny'){
      Notifications.notify(order.branch, order, 0);
      Notifications.notify('Admin', order, 0);
      Database.transcodes.remove(order.tcode);
      Database.main_orders.remove(order);
      orders.remove(order);
    }else if(action == 'allow'){
      String arrival = DateFormat('yyyy/MM/dd').format(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 12));
      order.changeStatus(2);
      orders.remove(order);
      for(int i = 0; i < order.medicine.length; i++){
        if(order.medicine[i].name == 'Baclofen'){
          Database.admin[0][0] -= order.medicine[i].quantity;
        }else if(order.medicine[i].name == 'Buspirone-HCL'){
          Database.admin[0][1] -= order.medicine[i].quantity;
        }else if(order.medicine[i].name == 'Cimetidine'){
          Database.admin[0][2] -= order.medicine[i].quantity;
        }
      }
      Notifications.notify(order.branch, order, 2);
      Notifications.notify('Admin', order, 2);
      order.arrival = arrival;
    }
    refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
        color: Colors.transparent,
        height: double.infinity,
        width: 2000,
        child: FittedBox(
          alignment: Alignment.topLeft,
          fit: BoxFit.fitWidth,
          child: Container(
            color: Colors.transparent,
            height: 1200,
            width: 1600,
            child: Column(
            children: [
              Container(
                  color: Colors.transparent,
                  height: 160,
                  width: 1600,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(width: 30),
                      Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: IconButton(
                          splashRadius: 35,
                          icon: const Center(child: Icon(Icons.arrow_back, size: 30)),
                          color: const Color(0xFF469597),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      const SizedBox(width: 50),
                      const Padding(
                        padding: EdgeInsets.only(top: 50),
                        child: SizedBox(
                          height: 60,
                          width: 800,
                          child: Text('Delivery Confirmation', style: TextStyle(color: Color(0xFF469597), letterSpacing: 2, fontSize: 50, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  )
              ),
              const SizedBox(height: 10),
              Container(
                height: 550,
                width: 1600,
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Container(
                    height: 550,
                    width: 1600,
                    color: Colors.transparent,
                    child: Scrollbar(
                      thumbVisibility: true,
                      controller: _scrollController,
                      child: SingleChildScrollView(
                        controller: _scrollController,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: SizedBox(
                            height: 650,
                            width: 1280,
                            child: DataTable(
                                headingRowHeight: 80,
                                dataRowHeight: 80,
                                showCheckboxColumn: true,
                                headingTextStyle: const TextStyle(color: Color(0xFF469597), fontSize: 26, fontWeight: FontWeight.bold),
                                dataTextStyle: const TextStyle(color: Color(0xFF469597), fontSize: 20, fontWeight: FontWeight.w100),
                                border: TableBorder.all(width: 1, color: const Color(0xFF469597)),
                                columns: const [
                                  DataColumn(label: Expanded(child: Text('Transaction Code', textAlign: TextAlign.center))),
                                  DataColumn(label: Expanded(child: Text('Branch', textAlign: TextAlign.center))),
                                  DataColumn(label: Expanded(child: Text('Cost', textAlign: TextAlign.center))),
                                  DataColumn(label: Expanded(child: Text('CONFIRM', textAlign: TextAlign.center))),
                                ],
                                rows: List.generate(orders.length, (index) => NewDataRow(order: orders[index], callback: confirmation, transcode: orders[index].tcode, branch: orders[index].branch, cost: orders[index].total, context: context).generate())
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          )
        )
      ),
    );
  }
}
