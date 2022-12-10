import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rmpwebapp/routes/dashboard_routes/transaction_and_delivery/supplier/stock_ordered_order.dart';
import 'package:rmpwebapp/structures/database.dart';
import 'package:rmpwebapp/structures/medicine.dart';
import 'package:rmpwebapp/structures/order.dart';

final formatCurrency = NumberFormat.currency(symbol: '₱');

class NewDataRow{
  final String transcode, date;
  final List<Medicine> medicines;
  final context;
  NewDataRow({required this.transcode, required this.date, required this.medicines, required this.context});

  DataRow generate() {
    return DataRow(
        cells: [
          DataCell(Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => StockOrderedOrderSupplier(transcode: transcode, medicines: medicines)));
                },
                child: Text(transcode, style: const TextStyle(fontSize: 20)),
              )
          )),
          DataCell(Center(child: Text(date))),
        ]
    );
  }
}

class StockOrderedMainSupplier extends StatefulWidget {
  final String session;
  final Map<String, String> credentials;
  const StockOrderedMainSupplier({required this.credentials, required this.session, Key? key}) : super(key: key);

  @override
  State<StockOrderedMainSupplier> createState() => _StockOrderedMainSupplierState();
}

class _StockOrderedMainSupplierState extends State<StockOrderedMainSupplier> {
  final _scrollController = ScrollController();
  List<Order> orders = [];
  bool isAdmin = false;

  @override
  void initState() {
    verifySession();
    orders = isAdmin ? Database.from_supplier_orders.reversed.toList() : Database.getMainOrders(widget.credentials.values.first).reversed.toList();
    super.initState();
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
                          child: Text('Stock Ordered', style: TextStyle(color: Color(0xFF469597), letterSpacing: 2, fontSize: 50, fontWeight: FontWeight.bold)),
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
                                  DataColumn(label: Expanded(child: Text('Date Purchased', textAlign: TextAlign.center))),
                                ],
                                rows: List.generate(orders.length, (index) => NewDataRow(transcode: orders[index].tcode, date: orders[index].date, medicines: orders[index].medicine, context: context).generate())
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
