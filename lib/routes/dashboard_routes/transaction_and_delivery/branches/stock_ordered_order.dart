import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rmpwebapp/structures/medicine.dart';

final formatCurrency = NumberFormat.currency(symbol: '₱');

class NewDataRow{
  final String product, purchase, expiry;
  final int quantity;
  final double cost;
  NewDataRow({required this.product, required this.purchase, required this.expiry, required this.quantity, required this.cost});

  DataRow generate() {
    return DataRow(
        cells: [
          DataCell(Center(child: Text(product))),
          DataCell(Center(child: Text(purchase))),
          DataCell(Center(child: Text(expiry))),
          DataCell(Center(child: Text(quantity.toString()))),
          DataCell(Center(child: Text(formatCurrency.format(cost)))),
        ]
    );
  }
}
class StockOrderedOrderBranches extends StatefulWidget {
  final String transcode;
  final List<Medicine> medicines;
  const StockOrderedOrderBranches({required this.transcode, required this.medicines, Key? key}) : super(key: key);

  @override
  State<StockOrderedOrderBranches> createState() => _StockOrderedOrderBranchesState();
}

class _StockOrderedOrderBranchesState extends State<StockOrderedOrderBranches> {
  final _scrollController = ScrollController();
  List<Medicine> meds = [];

  @override
  void initState() {
    meds = widget.medicines.reversed.toList();
    super.initState();
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
            mainAxisAlignment: MainAxisAlignment.start,
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
                      Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 60,
                              width: 400,
                              child: Text('Stock Ordered', style: TextStyle(color: Color(0xFF469597), letterSpacing: 2, fontSize: 50, fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(
                              height: 40,
                              child: Container(
                                  width: 400,
                                  decoration: BoxDecoration(
                                    borderRadius:BorderRadius.circular(50.0),
                                    color: const Color(0xFFDDBEAA),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                                    child: Text(
                                        'Transaction Code: ${widget.transcode}',
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w100, fontStyle: FontStyle.italic)
                                    ),
                                  )
                              ),
                            ),
                          ],
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
                child:
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
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
                            width: 1400,
                            child: DataTable(
                                headingRowHeight: 80,
                                dataRowHeight: 80,
                                showCheckboxColumn: true,
                                headingTextStyle: const TextStyle(color: Color(0xFF469597), fontSize: 16, fontWeight: FontWeight.bold),
                                dataTextStyle: const TextStyle(color: Color(0xFF469597), fontSize: 16, fontWeight: FontWeight.w100),
                                border: TableBorder.all(width: 1, color: const Color(0xFF469597)),
                                columns: const [
                                  DataColumn(label: Expanded(child: Text('Name of Product', textAlign: TextAlign.center))),
                                  DataColumn(label: Expanded(child: Text('Date Purchased', textAlign: TextAlign.center))),
                                  DataColumn(label: Expanded(child: Text('Expiry Date', textAlign: TextAlign.center))),
                                  DataColumn(label: Expanded(child: Text('Quantity', textAlign: TextAlign.center))),
                                  DataColumn(label: Expanded(child: Text('Cost', textAlign: TextAlign.center))),
                                ],
                                rows: List.generate(meds.length, (index) => NewDataRow(product: meds[index].name, purchase: meds[index].dpurch, expiry: meds[index].expdir, quantity: meds[index].quantity, cost: meds[index].cost).generate())
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
