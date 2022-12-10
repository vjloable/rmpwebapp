import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rmpwebapp/routes/dashboard_routes/transaction_and_delivery/supplier/stock_ordered_order.dart';
import 'package:rmpwebapp/structures/database.dart';
import 'package:rmpwebapp/structures/medicine.dart';
import 'package:rmpwebapp/structures/order.dart';

final formatCurrency = NumberFormat.currency(symbol: '₱');

class NewDataRow{
  final String tcode, dp, arrival, supplier, status;
  final double amount;
  final context;
  final List<Medicine> meds;
  NewDataRow(this.tcode, this.dp, this.arrival, this.supplier, this.amount, this.status, this.context, this.meds);

  DataRow generate() {
    return DataRow(
        cells: [
          DataCell(Center(child: TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => StockOrderedOrderSupplier(transcode: tcode, medicines: meds)));
            },
            child: Text(tcode, style: const TextStyle(fontSize: 24)),
          )
          )),
          DataCell(Center(child: Text(dp))),
          DataCell(Center(child: Text(arrival))),
          DataCell(Center(child: Text(supplier))),
          DataCell(Center(child: Text(formatCurrency.format(amount)))),
          DataCell(Center(
              child: Text(
                  status,
                  style: TextStyle(fontWeight: FontWeight.bold,
                      color: status == 'PENDING'
                          ? Colors.grey
                          : status == 'ON THE WAY'
                          ? Colors.yellow
                          : status == 'DELIVERED'
                          ? Colors.green
                          : Colors.transparent
                  )
              )
          )),
        ]
    );
  }
}
class DeliveryStatusSupplier extends StatefulWidget {
  final Map<String, String> credentials;
  final String session;
  const DeliveryStatusSupplier({required this.credentials, required this.session, Key? key}) : super(key: key);

  @override
  State<DeliveryStatusSupplier> createState() => _DeliveryStatusSupplierState();
}

class _DeliveryStatusSupplierState extends State<DeliveryStatusSupplier> {
  final _scrollController = ScrollController();
  List<Order> orders = [];
  bool isAdmin = false;

  @override
  void initState() {
    verifySession();
    orders = isAdmin ? Database.from_supplier_orders.reversed.toList() : Database.getMainOrders(widget.credentials.values.first).reversed.toList();
    super.initState();
  }

  void sort() {
    setState(() {
      orders = orders.reversed.toList();
    });
  }

  void verifySession(){
    if(widget.session == 'admin'){
      isAdmin = true;
    }else if(widget.session == 'user'){
      isAdmin = false;
    }
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
                                width: 400,
                                child: Text('Delivery Status', style: TextStyle(color: Color(0xFF469597), letterSpacing: 2, fontSize: 50, fontWeight: FontWeight.bold)),
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
                          child: Row(
                            children: [
                              SizedBox(
                                height: 650,
                                width: 80,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    InkWell(onTap: () {sort();}, child: const MouseRegion(cursor: SystemMouseCursors.click, child: SizedBox(height: 80, width: 80, child: Center(child: Icon(Icons.sort, color: Color(0xFFDDBEAA), size: 48))))),
                                  ],
                                ),
                              ),
                              Scrollbar(
                                thumbVisibility: true,
                                controller: _scrollController,
                                child: SingleChildScrollView(
                                  controller: _scrollController,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20),
                                    child: SizedBox(
                                      height: 650,
                                      width: 1280,
                                      child: SizedBox(
                                        height: 650,
                                        width: 1200,
                                        child: DataTable(
                                            headingRowHeight: 80,
                                            dataRowHeight: 80,
                                            showCheckboxColumn: true,
                                            headingTextStyle: const TextStyle(color: Color(0xFF469597), fontSize: 22, fontWeight: FontWeight.bold),
                                            dataTextStyle: const TextStyle(color: Color(0xFF469597), fontSize: 20, fontWeight: FontWeight.w100),
                                            border: TableBorder.all(width: 1, color: const Color(0xFF469597)),
                                            columns: const [
                                              DataColumn(label: Expanded(child: Text('Transaction\nCode', textAlign: TextAlign.center))),
                                              DataColumn(label: Expanded(child: Text('Date\nPurchased', textAlign: TextAlign.center))),
                                              DataColumn(label: Expanded(child: Text('Arrival', textAlign: TextAlign.center))),
                                              DataColumn(label: Expanded(child: Text('Supplier', textAlign: TextAlign.center))),
                                              DataColumn(label: Expanded(child: Text('Order Amount', textAlign: TextAlign.center))),
                                              DataColumn(label: Expanded(child: Text('Order Status', textAlign: TextAlign.center))),
                                            ],
                                            rows: List.generate(orders.length, (i) => NewDataRow(orders[i].tcode, orders[i].date, orders[i].arrival, orders[i].supplier, orders[i].total, orders[i].getStatus(), context, orders[i].medicine).generate())
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
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
