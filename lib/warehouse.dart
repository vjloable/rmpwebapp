import 'package:flutter/material.dart';

class Warehouse extends StatefulWidget {
  const Warehouse({Key? key}) : super(key: key);

  @override
  State<Warehouse> createState() => _WarehouseState();
}

class _WarehouseState extends State<Warehouse> {
  final _scrollController = ScrollController();

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
            color: const Color(0xFFE5E3E4),
            height: 1200,
            width: 1600,
            child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  color: const Color(0xFFEDECED),
                  height: 100,
                  width: 1600,
                  child: Row(
                    children: [
                      const SizedBox(height: 1, width: 50),
                      SizedBox(height: 100, child: Center(child: IconButton(onPressed: (){Navigator.of(context).pop();}, icon: const Icon(Icons.arrow_back, color: Color(0xFF138B7E), size: 30), padding: EdgeInsets.zero,))),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: SizedBox(
                          height: 50,
                          width: 30,
                          child: VerticalDivider(
                            color: Color(0xFF138B7E),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 100,
                        width: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            SizedBox(
                              height: 30,
                              width: 200,
                              child: Text('WAREHOUSE', style: TextStyle(color: Color(0xFF138B7E), fontSize: 24, fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(
                              height: 30,
                              width: 200,
                              child: Text('INVENTORY', style: TextStyle(color: Color(0xFF138B7E), fontSize: 24, fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 1, width: 700),
                      TextButton(
                          onPressed: () {},
                          child: const Padding(
                            padding: EdgeInsets.only(bottom: 20, top: 10),
                            child: Icon(Icons.pin_drop, size: 40, color: Color(0xFF86BAB5)),
                          )
                      ),
                      const SizedBox(height: 1, width: 10),
                      SizedBox(
                        height: 60,
                        width: 400,
                        child: TextFormField(
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            prefixIcon: const Padding(
                              padding: EdgeInsets.only(left: 30, right: 10),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: const BorderSide(
                                  color: Colors.transparent, width: 1
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: const BorderSide(
                                  color: Colors.transparent, width: 1
                              ),
                            ),
                            enabledBorder:  OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: const BorderSide(
                                  color: Colors.transparent, width: 1
                              ),
                            ),
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.zero,
                            hintText: 'Location',
                            hintStyle: const TextStyle(color: Color(0xFF86BAB5), fontSize: 14, fontStyle: FontStyle.italic, fontWeight: FontWeight.w300),
                            filled: true,
                            suffixIcon: const Padding(
                              padding: EdgeInsets.only(left: 0, right: 20),
                              child: RotatedBox(quarterTurns: 3,child: Icon(Icons.arrow_back_ios_rounded, size: 12, color: Color(0xFF86BAB5))),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
              ),
              Container(
                  color: Colors.transparent,
                  height: 120,
                  width: 1600,
                  child: Row(
                    children: [
                      const SizedBox(height: 1, width: 50),
                      const SizedBox(
                        width: 300,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text('Capacity', style: TextStyle(color: Color(0xFF138B7E), fontSize: 60, fontWeight: FontWeight.bold)),
                        ),
                      ),
                      Container(
                        height: 120,
                        width: 600,
                        color: Colors.transparent,
                        child: Center(
                            child: Stack(
                              children: [
                                Container(
                                  height: 60,
                                  width: 600,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(50)),
                                    color: Colors.white,
                                  ),
                                ),
                                Positioned(
                                  left: 0,
                                  child: Container(
                                    height: 60,
                                    width: 250,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(50)),
                                      color: Color(0xFFDDBEAA),
                                    ),
                                  ),
                                ),
                              ],
                            )
                        ),
                      ),
                      const SizedBox(width: 40),
                      const SizedBox(
                        width: 100,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text('45%', style: TextStyle(color: Color(0xFF138B7E), fontSize: 50, fontWeight: FontWeight.w100)),
                        ),
                      ),
                      const SizedBox(width: 40),
                      SizedBox(
                        height: 100,
                        width: 300,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 30,
                              width: 300,
                              child: Row(
                                children: const [
                                  CircleAvatar(backgroundColor: Color(0xFFDDBEAA), radius: 11),
                                  SizedBox(width: 20),
                                  Text('Stocks', style: TextStyle(color: Color(0xFF138B7E), fontSize: 20, fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 30,
                              width: 300,
                              child: Row(
                                children: const [
                                  CircleAvatar(backgroundColor: Colors.white, radius: 11),
                                  SizedBox(width: 20),
                                  Text('Available Stocks', style: TextStyle(color: Color(0xFF138B7E), fontSize: 20, fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
              ),
              Container(
                height: 980,
                width: 1600,
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: FittedBox(
                    alignment: Alignment.topCenter,
                    fit: BoxFit.fitWidth,
                    child: Container(
                      height: 550,
                      width: 1500,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: const Color(0xFF138B7E)),
                        color: Colors.transparent,
                      ),
                      child: Scrollbar(
                        thumbVisibility: true,
                        controller: _scrollController,
                        child: ListView(
                          controller: _scrollController,
                          children: [
                            DataTable(
                              headingRowHeight: 80,
                              dataRowHeight: 80,
                              border: TableBorder.all(width: 1, color: const Color(0xFF138B7E)),
                              columns: const [
                                DataColumn(label: Text('Generic Name', style: TextStyle(color: Color(0xFF138B7E), fontSize: 16, fontWeight: FontWeight.bold))),
                                DataColumn(label: Text('Brand Name', style: TextStyle(color: Color(0xFF138B7E), fontSize: 16, fontWeight: FontWeight.bold))),
                                DataColumn(label: Text('Quantity', style: TextStyle(color: Color(0xFF138B7E), fontSize: 16, fontWeight: FontWeight.bold))),
                                DataColumn(label: Text('Available Space', style: TextStyle(color: Color(0xFF138B7E), fontSize: 16, fontWeight: FontWeight.bold))),
                              ],
                              rows: const [
                                DataRow(cells: [
                                  DataCell(Text('Baclufen', style: TextStyle(color: Color(0xFF138B7E), fontSize: 16, fontWeight: FontWeight.w100))),
                                  DataCell(Text('', style: TextStyle(color: Color(0xFF138B7E), fontSize: 16, fontWeight: FontWeight.w100))),
                                  DataCell(Text('250', style: TextStyle(color: Color(0xFF138B7E), fontSize: 16, fontWeight: FontWeight.w100))),
                                  DataCell(Text('750', style: TextStyle(color: Color(0xFF138B7E), fontSize: 16, fontWeight: FontWeight.w100))),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Buspirone-HCL', style: TextStyle(color: Color(0xFF138B7E), fontSize: 16, fontWeight: FontWeight.w100))),
                                  DataCell(Text('', style: TextStyle(color: Color(0xFF138B7E), fontSize: 16, fontWeight: FontWeight.w100))),
                                  DataCell(Text('600', style: TextStyle(color: Color(0xFF138B7E), fontSize: 16, fontWeight: FontWeight.w100))),
                                  DataCell(Text('400', style: TextStyle(color: Color(0xFF138B7E), fontSize: 16, fontWeight: FontWeight.w100))),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Test', style: TextStyle(color: Color(0xFF138B7E), fontSize: 16, fontWeight: FontWeight.w100))),
                                  DataCell(Text('', style: TextStyle(color: Color(0xFF138B7E), fontSize: 16, fontWeight: FontWeight.w100))),
                                  DataCell(Text('0', style: TextStyle(color: Color(0xFF138B7E), fontSize: 16, fontWeight: FontWeight.w100))),
                                  DataCell(Text('0', style: TextStyle(color: Color(0xFF138B7E), fontSize: 16, fontWeight: FontWeight.w100))),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Test', style: TextStyle(color: Color(0xFF138B7E), fontSize: 16, fontWeight: FontWeight.w100))),
                                  DataCell(Text('', style: TextStyle(color: Color(0xFF138B7E), fontSize: 16, fontWeight: FontWeight.w100))),
                                  DataCell(Text('0', style: TextStyle(color: Color(0xFF138B7E), fontSize: 16, fontWeight: FontWeight.w100))),
                                  DataCell(Text('0', style: TextStyle(color: Color(0xFF138B7E), fontSize: 16, fontWeight: FontWeight.w100))),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Test', style: TextStyle(color: Color(0xFF138B7E), fontSize: 16, fontWeight: FontWeight.w100))),
                                  DataCell(Text('', style: TextStyle(color: Color(0xFF138B7E), fontSize: 16, fontWeight: FontWeight.w100))),
                                  DataCell(Text('0', style: TextStyle(color: Color(0xFF138B7E), fontSize: 16, fontWeight: FontWeight.w100))),
                                  DataCell(Text('0', style: TextStyle(color: Color(0xFF138B7E), fontSize: 16, fontWeight: FontWeight.w100))),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Test', style: TextStyle(color: Color(0xFF138B7E), fontSize: 16, fontWeight: FontWeight.w100))),
                                  DataCell(Text('', style: TextStyle(color: Color(0xFF138B7E), fontSize: 16, fontWeight: FontWeight.w100))),
                                  DataCell(Text('0', style: TextStyle(color: Color(0xFF138B7E), fontSize: 16, fontWeight: FontWeight.w100))),
                                  DataCell(Text('0', style: TextStyle(color: Color(0xFF138B7E), fontSize: 16, fontWeight: FontWeight.w100))),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Test', style: TextStyle(color: Color(0xFF138B7E), fontSize: 16, fontWeight: FontWeight.w100))),
                                  DataCell(Text('', style: TextStyle(color: Color(0xFF138B7E), fontSize: 16, fontWeight: FontWeight.w100))),
                                  DataCell(Text('0', style: TextStyle(color: Color(0xFF138B7E), fontSize: 16, fontWeight: FontWeight.w100))),
                                  DataCell(Text('0', style: TextStyle(color: Color(0xFF138B7E), fontSize: 16, fontWeight: FontWeight.w100))),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Test', style: TextStyle(color: Color(0xFF138B7E), fontSize: 16, fontWeight: FontWeight.w100))),
                                  DataCell(Text('', style: TextStyle(color: Color(0xFF138B7E), fontSize: 16, fontWeight: FontWeight.w100))),
                                  DataCell(Text('0', style: TextStyle(color: Color(0xFF138B7E), fontSize: 16, fontWeight: FontWeight.w100))),
                                  DataCell(Text('0', style: TextStyle(color: Color(0xFF138B7E), fontSize: 16, fontWeight: FontWeight.w100))),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Test', style: TextStyle(color: Color(0xFF138B7E), fontSize: 16, fontWeight: FontWeight.w100))),
                                  DataCell(Text('', style: TextStyle(color: Color(0xFF138B7E), fontSize: 16, fontWeight: FontWeight.w100))),
                                  DataCell(Text('0', style: TextStyle(color: Color(0xFF138B7E), fontSize: 16, fontWeight: FontWeight.w100))),
                                  DataCell(Text('0', style: TextStyle(color: Color(0xFF138B7E), fontSize: 16, fontWeight: FontWeight.w100))),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Test', style: TextStyle(color: Color(0xFF138B7E), fontSize: 16, fontWeight: FontWeight.w100))),
                                  DataCell(Text('', style: TextStyle(color: Color(0xFF138B7E), fontSize: 16, fontWeight: FontWeight.w100))),
                                  DataCell(Text('0', style: TextStyle(color: Color(0xFF138B7E), fontSize: 16, fontWeight: FontWeight.w100))),
                                  DataCell(Text('0', style: TextStyle(color: Color(0xFF138B7E), fontSize: 16, fontWeight: FontWeight.w100))),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Test', style: TextStyle(color: Color(0xFF138B7E), fontSize: 16, fontWeight: FontWeight.w100))),
                                  DataCell(Text('', style: TextStyle(color: Color(0xFF138B7E), fontSize: 16, fontWeight: FontWeight.w100))),
                                  DataCell(Text('0', style: TextStyle(color: Color(0xFF138B7E), fontSize: 16, fontWeight: FontWeight.w100))),
                                  DataCell(Text('0', style: TextStyle(color: Color(0xFF138B7E), fontSize: 16, fontWeight: FontWeight.w100))),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Test', style: TextStyle(color: Color(0xFF138B7E), fontSize: 16, fontWeight: FontWeight.w100))),
                                  DataCell(Text('', style: TextStyle(color: Color(0xFF138B7E), fontSize: 16, fontWeight: FontWeight.w100))),
                                  DataCell(Text('0', style: TextStyle(color: Color(0xFF138B7E), fontSize: 16, fontWeight: FontWeight.w100))),
                                  DataCell(Text('0', style: TextStyle(color: Color(0xFF138B7E), fontSize: 16, fontWeight: FontWeight.w100))),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Test', style: TextStyle(color: Color(0xFF138B7E), fontSize: 16, fontWeight: FontWeight.w100))),
                                  DataCell(Text('', style: TextStyle(color: Color(0xFF138B7E), fontSize: 16, fontWeight: FontWeight.w100))),
                                  DataCell(Text('0', style: TextStyle(color: Color(0xFF138B7E), fontSize: 16, fontWeight: FontWeight.w100))),
                                  DataCell(Text('0', style: TextStyle(color: Color(0xFF138B7E), fontSize: 16, fontWeight: FontWeight.w100))),
                                ]),
                              ],
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
