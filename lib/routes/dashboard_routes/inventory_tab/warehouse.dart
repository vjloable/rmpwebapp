import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rmpwebapp/routes/dashboard_routes/inventory_tab/manage_inventory.dart';
import 'package:rmpwebapp/structures/database.dart';

class NewDataRow{
  final String brand, generic;
  late int quantity, aspace;
  NewDataRow({required this.generic, required this.brand, required this.quantity, required this.aspace});

  DataRow generate() {
    return DataRow(
        cells: [
          DataCell(Center(child: Text(generic))),
          DataCell(Center(child: Text(brand))),
          DataCell(Center(child: Text(quantity.toString()))),
          DataCell(Center(child: Text(aspace.toString()))),
        ]
    );
  }
}

class Warehouse extends StatefulWidget {
  final String session;
  final Map<String, String> credentials;
  const Warehouse({required this.session, required this.credentials, Key? key}) : super(key: key);

  @override
  State<Warehouse> createState() => _WarehouseState();
}

class _WarehouseState extends State<Warehouse> {
  final _scrollController = ScrollController();
  List<String> generic = ['GEN-Baclofen', 'GEN-Buspirone', 'GEN-Cimetidine'];
  List<String> brands = ['Baclofen', 'Buspirone-HCL', 'Cimetidine'];

  int aspaceTotal = 0;
  int quantityTotal = 0;

  @override
  void initState() {
    updateAspaceTotal();
    updateQuantityTotal();
    super.initState();
  }

  void updateAspaceTotal(){
    aspaceTotal = 0;
    for(int i=0; i<Database.admin[1].length; i++){
      aspaceTotal += Database.admin[1][i] as int;
    }
  }

  void updateQuantityTotal(){
    quantityTotal = 0;
    for(int i=0; i<Database.admin[0].length; i++){
      quantityTotal += Database.admin[0][i] as int;
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
                      SizedBox(height: 100, child: Center(child: IconButton(onPressed: (){Navigator.of(context).pop();}, icon: const Icon(Icons.arrow_back, color: Color(0xFF469597), size: 30), padding: EdgeInsets.zero,))),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: SizedBox(
                          height: 50,
                          width: 30,
                          child: VerticalDivider(
                            color: Color(0xFF469597),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 100,
                        width: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 30,
                              width: 200,
                              child: Text('WAREHOUSE', style: GoogleFonts.getFont('Antonio', fontWeight: FontWeight.bold, color: const Color(0xFF138B7E), fontSize: 24.8)),
                            ),
                            SizedBox(
                              height: 30,
                              width: 200,
                              child: Text('INVENTORY', style: GoogleFonts.getFont('Antonio', fontWeight: FontWeight.bold, color: const Color(0xFF138B7E), fontSize: 24.8)),
                            ),
                          ],
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
                      SizedBox(
                        height: 120,
                        width: 300,
                        child: FittedBox(fit: BoxFit.scaleDown, child: Text('Capacity', style: GoogleFonts.getFont('Playfair Display', fontWeight: FontWeight.bold, color: const Color(0xFF138B7E), fontSize: 74))),
                      ),
                      const SizedBox(height: 1, width: 30),
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
                                    width: (600 * (quantityTotal/aspaceTotal)).floorToDouble(),
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
                      SizedBox(
                        width: 100,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: FittedBox(fit: BoxFit.scaleDown, child: Text('${((quantityTotal/aspaceTotal)*100).floorToDouble()}%', style: const TextStyle(color: Color(0xFF469597), fontSize: 50, fontWeight: FontWeight.w100))),
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
                                  Text('Stocks', style: TextStyle(color: Color(0xFF469597), fontSize: 20, fontWeight: FontWeight.bold)),
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
                                  Text('Available Stocks', style: TextStyle(color: Color(0xFF469597), fontSize: 20, fontWeight: FontWeight.bold)),
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
                height: 460,
                width: 1600,
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: FittedBox(
                    alignment: Alignment.topCenter,
                    fit: BoxFit.fitWidth,
                    child: Container(
                      height: 450,
                      width: 1500,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: const Color(0xFF469597)),
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
                              headingTextStyle: GoogleFonts.getFont('Open Sans', fontWeight: FontWeight.bold, color: const Color(0xFF138B7E), fontSize: 20),
                              dataTextStyle: GoogleFonts.getFont('Open Sans', fontWeight: FontWeight.normal, color: const Color(0xFF138B7E), fontSize: 20),
                              border: TableBorder.all(width: 1, color: const Color(0xFF469597)),
                              //['Generic Name', 'Brand Name', 'Quantity', 'Available Space']
                              columns: const [
                                DataColumn(label: Expanded(child: Text('Generic Name', textAlign: TextAlign.center))),
                                DataColumn(label: Expanded(child: Text('Brand Name', textAlign: TextAlign.center))),
                                DataColumn(label: Expanded(child: Text('Quantity', textAlign: TextAlign.center))),
                                DataColumn(label: Expanded(child: Text('Available Space', textAlign: TextAlign.center))),
                              ],
                              rows: List.generate(brands.length, (index) => NewDataRow(generic: generic[index], brand: brands[index], quantity: Database.admin[0][index], aspace: Database.admin[1][index]).generate()),
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
