import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rmpwebapp/request_delivery.dart';

final formatCurrency = NumberFormat.currency(symbol: '₱');

class NewDataRow{
  late bool value = false;
  final String brand, generic;
  late double quantity, pcost, min;
  late int position;
  final void Function(int x, double y) callback;
  NewDataRow({required this.brand, required this.generic, required this.quantity, required this.pcost, required this.callback, required this.position, required this.min});

  DataRow generate() {
    return DataRow(
        cells: [
          DataCell(Center(child: Text(brand))),
          DataCell(Center(child: Text(generic))),
          DataCell(
              Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      (quantity > min) ? SizedBox(height: 45, width: 45, child: ElevatedButton(style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.brown), shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50))))),
                          onPressed: (){(quantity > min) ? callback(position, --quantity,) : callback(position, quantity);}, child: const Text('-', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold))))
                      : Container(height: 45, width: 45, decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(50)), color: Color(0xFFDDBEAA)), child: const Center(child: Text('-', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)))),
                      Text(quantity.toString()),
                      SizedBox(height: 45, width: 45, child: ElevatedButton(style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.brown), shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50))))),
                          onPressed: (){callback(position, ++quantity); }, child: const Text('+', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)))),
                    ],
                  )
              )
          ),
          DataCell(Center(child: Text(formatCurrency.format(pcost)))),
        ]
    );
  }
}

class ItemRequest extends StatefulWidget {
  final String session;
  const ItemRequest({required this.session, Key? key}) : super(key: key);

  @override
  State<ItemRequest> createState() => _ItemRequestState();
}

class _ItemRequestState extends State<ItemRequest> {
  final _scrollController = ScrollController();
  List<bool> checkVal = [false, false, false, false, false, false, false];
  List<String> generic = ['GEN-Baclofen', 'GEN-Buspirone', 'GEN-Cimetidine', 'GEN-Pindolol', '-', '-', '-'];
  List<String> brands = ['Baclofen', 'Buspirone-HCL', 'Cimetidine', 'Pindolol', '-', '-', '-'];
  List<double> quantityValA = [100, 500, 250, 600, 0, 0, 0];
  List<double> quantityValB = [100, 500, 250, 600, 0, 0, 0];
  List<double> percostVal = [30, 20, 15, 12.35, 0, 0, 0];
  late double totalPrice = 0;
  bool isAdmin = false;

  @override
  void initState() {
    changeTotal();
    verifySession();
    super.initState();
  }

  void verifySession(){
    if(widget.session == 'admin'){
      isAdmin = true;
    }else if(widget.session == 'user'){
      isAdmin = false;
    }
  }

  void refresh(int x, double y){setState(() {quantityValA[x] = y; changeTotal();});}
  void changeTotal(){
    totalPrice = 0;
    for(int i = 0; i < quantityValA.length; i++){
      totalPrice += quantityValA[i] * percostVal[i];
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  color: Colors.transparent,
                  height: 160,
                  width: 1600,
                  child: Row(
                    children: [
                      const SizedBox(height: 1, width: 50),
                      SizedBox(height: 90, child: Align(alignment: Alignment.topCenter, child: IconButton(onPressed: (){Navigator.of(context).pop();}, icon: const Icon(Icons.arrow_back, color: Color(0xFF469597), size: 45), padding: EdgeInsets.zero,))),
                      const SizedBox(height: 1, width: 50),
                      SizedBox(
                        height: 180,
                        width: 300,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 40,
                              width: 300,
                              child: Text('ITEM', style: TextStyle(color: Color(0xFF469597), fontSize: 32, fontWeight: FontWeight.bold)),
                            ),
                            const SizedBox(
                              height: 40,
                              width: 300,
                              child: Text('REQUEST', style: TextStyle(color: Color(0xFF469597), fontSize: 32, fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(
                              height: 40,
                              width: 300,
                              child: Row(
                                children: [
                                  Text('Total Cost:  ', style: TextStyle(color: Colors.grey.shade400, fontSize: 24, fontWeight: FontWeight.w500, fontStyle: FontStyle.italic)),
                                  Text(formatCurrency.format(totalPrice), style: TextStyle(color: Colors.grey.shade500, fontSize: 24, fontWeight: FontWeight.bold)),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 1, width: 650),
                      Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFDDBEAA),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0)
                                )
                            ),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => RequestDelivery(requestPrice: totalPrice, session: isAdmin ? 'admin' : 'user')));
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                              child: Row(
                                children: const [
                                  Text(
                                      'Proceed to request delivery  ',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Color(0xFF469597), decoration: TextDecoration.underline, fontSize: 20, fontWeight: FontWeight.w600)
                                  ),
                                  Icon(Icons.arrow_forward_rounded, color: Color(0xFF469597), size: 24),
                                ],
                              ),
                            )
                        ),
                      ),
                    ],
                  )
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Divider(color: Color(0x55138B7E), thickness: 2),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: SizedBox(
                  height: 550,
                  width: 1600,
                  child: Scrollbar(
                    thumbVisibility: true,
                    controller: _scrollController,
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      child: SizedBox(
                        height: 650,
                        width: 1480,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 80,
                              child: Column(
                                children: [
                                  InkWell(
                                    splashFactory: NoSplash.splashFactory, borderRadius: const BorderRadius.all(Radius.circular(50)),
                                    onTap: () {
                                      setState(() {
                                        checkVal = [false, false, false, false, false, false, false];
                                      });
                                    },
                                    child: const MouseRegion(
                                      opaque: false,
                                      cursor: SystemMouseCursors.click,
                                      child: SizedBox(
                                        height: 80,
                                        width: 80,
                                        child: Center(
                                            child: Icon(Icons.delete, color: Color(0xFFDDBEAA), size: 48)
                                        ),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    children:
                                    List.generate(quantityValA.length, (index) => SizedBox(height: 80, width: 80, child: Center(child: Checkbox(fillColor: const MaterialStatePropertyAll(Colors.brown), side: const BorderSide(color: Color(0xFFDDBEAA), width: 2), value: checkVal[index], onChanged: (e){setState(() {checkVal[index] = !checkVal[index];});}))))
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
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
                                  ///DataColumn(label: Expanded(child: Icon(Icons.delete, color: Color(0xFFDDBEAA), size: 48))),
                                  DataColumn(label: Expanded(child: Text('Brand Name', textAlign: TextAlign.center))),
                                  DataColumn(label: Expanded(child: Text('Generic Name', textAlign: TextAlign.center))),
                                  DataColumn(label: Expanded(child: Text('Quantity', textAlign: TextAlign.center))),
                                  DataColumn(label: Expanded(child: Text('Per Cost', textAlign: TextAlign.center))),
                                ],
                                rows: List.generate(quantityValA.length, (index) => NewDataRow(brand: brands[index], generic: generic[index], quantity: quantityValA[index], pcost: percostVal[index], callback: refresh, position: index, min: quantityValB[index]).generate(),)
                              ),
                            ),
                          ],
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
