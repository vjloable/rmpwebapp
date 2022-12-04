import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final formatCurrency = NumberFormat.currency(symbol: '₱');

class NewDataRow{
  final String tcode, dp, arrival, supplier, status;
  final int amount;
  NewDataRow(this.tcode, this.dp, this.arrival, this.supplier, this.amount, this.status);

  DataRow generate() {
    return DataRow(
        cells: [
          DataCell(Center(child: Text(tcode))),
          DataCell(Center(child: Text(dp))),
          DataCell(Center(child: Text(arrival))),
          DataCell(Center(child: Text(supplier))),
          DataCell(Center(child: Text(formatCurrency.format(amount)))),
          DataCell(Center(child: Text(status))),
        ]
    );
  }
}
class DeliveryStatus extends StatefulWidget {
  const DeliveryStatus({Key? key}) : super(key: key);

  @override
  State<DeliveryStatus> createState() => _DeliveryStatusState();
}

class _DeliveryStatusState extends State<DeliveryStatus> {
  final _scrollController = ScrollController();
  List<String> tcode = ['MED890760', 'MED007865', 'MED324118'];
  List<String> dp = ['11/11/2022', '11/11/2022', '11/11/2022'];
  List<String> arrival = ['11/30/2022', '11/30/2022', '12/12/2022'];
  List<String> supplier = ['UNILAB', 'UNILAB', 'UNILAB'];
  List<int> amount = [32000, 25000, 35000];
  List<String> status = ['DELIVERED', 'ON THE WAY', 'PENDING'];

  void sort() {
    setState(() {
      tcode = tcode.reversed.toList();
      dp = dp.reversed.toList();
      arrival = arrival.reversed.toList();
      supplier = supplier.reversed.toList();
      amount = amount.reversed.toList();
      status = status.reversed.toList();
    });
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
                                color: const Color(0xFF138B7E),
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
                                child: Text('Delivery Status', style: TextStyle(color: Color(0xFF138B7E), letterSpacing: 2, fontSize: 50, fontWeight: FontWeight.bold)),
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
                                    InkWell(onTap: () {sort();}, child: MouseRegion(cursor: SystemMouseCursors.click, child: const SizedBox(height: 80, width: 80, child: Center(child: Icon(Icons.sort, color: Color(0xFFDDBEAA), size: 48))))),
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
                                            headingTextStyle: const TextStyle(color: Color(0xFF138B7E), fontSize: 22, fontWeight: FontWeight.bold),
                                            dataTextStyle: const TextStyle(color: Color(0xFF138B7E), fontSize: 20, fontWeight: FontWeight.w100),
                                            border: TableBorder.all(width: 1, color: const Color(0xFF138B7E)),
                                            columns: const [
                                              DataColumn(label: Expanded(child: Text('Transaction\nCode', textAlign: TextAlign.center))),
                                              DataColumn(label: Expanded(child: Text('Date\nPurchased', textAlign: TextAlign.center))),
                                              DataColumn(label: Expanded(child: Text('Arrival', textAlign: TextAlign.center))),
                                              DataColumn(label: Expanded(child: Text('Supplier', textAlign: TextAlign.center))),
                                              DataColumn(label: Expanded(child: Text('Order Amount', textAlign: TextAlign.center))),
                                              DataColumn(label: Expanded(child: Text('Order Status', textAlign: TextAlign.center))),
                                            ],
                                            rows: List.generate(tcode.length, (i) => NewDataRow(tcode[i], dp[i], arrival[i], supplier[i], amount[i], status[i]).generate())
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
