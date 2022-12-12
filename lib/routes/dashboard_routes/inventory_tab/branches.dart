import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:rmpwebapp/routes/dashboard_routes/inventory_tab/manage_inventory.dart';
import 'package:rmpwebapp/structures/database.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

final formatNum = NumberFormat.currency(symbol: '');

Widget _barData({required String text, required double front, required double back}) {
  return Container(
    width: 1100,
    height: 120,
    color: Colors.transparent,
    child: Row(
      children: [
        Container(color: Colors.transparent, width: 300,
            child: Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 30, right: 30),
              child: Text(text, textAlign: TextAlign.right, style: GoogleFonts.getFont('Open Sans', fontWeight: FontWeight.normal, color: const Color(0xFF138B7E), fontSize: 20)),
            )
        ),
        Stack(
          children: [
            Container(
              width: (back*700).round().toDouble(),
              height: 90,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
              ),
            ),
            Container(
              width: (front*700).round().toDouble(),
              height: 90,
              decoration: const BoxDecoration(
                color:  Color(0xFFDDBEAA),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
              ),
            ),
          ],
        )
      ],
    ),
  );
}

class Branches extends StatefulWidget {
  final String session;
  final Map<String, String> credentials;
  const Branches({required this.session, required this.credentials, Key? key}) : super(key: key);

  @override
  State<Branches> createState() => _BranchesState();
}

class _BranchesState extends State<Branches> {
  final _scrollController = ScrollController();
  bool isAdmin = false;
  int aspaceTotal = 0;
  int quantityTotal = 0;
  List<dynamic> fetchedUser = Database.ilig1;

  @override
  void initState() {
    updateAspaceTotal();
    updateQuantityTotal();
    verifySession();
    updateGraph();
    super.initState();
  }

  void verifySession(){
    if(widget.session == 'admin'){
      isAdmin = true;
    }else if(widget.session == 'user'){
      isAdmin = false;
    }
  }

  void updateAspaceTotal(){
    aspaceTotal = 0;
    for(int i=0; i<fetchedUser[1].length; i++){
      aspaceTotal += fetchedUser[1][i] as int;
    }
  }

  void updateQuantityTotal(){
    quantityTotal = 0;
    for(int i=0; i<fetchedUser[0].length; i++){
      quantityTotal += fetchedUser[0][i] as int;
    }
  }

  void updateGraph(){
    setState(() {
      if(isAdmin){
        if(dropdownvalue == items[0]){
          fetchedUser = Database.ilig1;
        }else if(dropdownvalue == items[1]){
          fetchedUser = Database.ilig2;
        }else if(dropdownvalue == items[2]){
          fetchedUser = Database.kapat;
        }else if(dropdownvalue == items[3]){
          fetchedUser = Database.maran;
        }else if(dropdownvalue == items[4]){
          fetchedUser = Database.auro;
        }
      }else{
        if(widget.credentials.values.first == 'Iligan 1'){
          fetchedUser = Database.ilig1;
        }else if(widget.credentials.values.first == 'Iligan 2'){
          fetchedUser = Database.ilig2;
        }else if(widget.credentials.values.first == 'Kapatagan'){
          fetchedUser = Database.kapat;
        }else if(widget.credentials.values.first == 'Maranding'){
          fetchedUser = Database.maran;
        }else if(widget.credentials.values.first == 'Aurora'){
          fetchedUser = Database.auro;
        }
      }
      updateQuantityTotal();
      updateAspaceTotal();
    });
  }

  String dropdownvalue = 'Iligan Branch 1';

  var items = [
    'Iligan Branch 1',
    'Iligan Branch 2',
    'Kapatagan Branch',
    'Maranding Branch',
    'Aurora Branch'
  ];

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
                              child:
                              Text('BRANCHES', style: GoogleFonts.getFont('Antonio', fontWeight: FontWeight.bold, color: const Color(0xFF138B7E), fontSize: 24.8)),//TextStyle(color: Color(0xFF138B7E), fontSize: 24, fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(
                              height: 30,
                              width: 200,
                              child: Text('INVENTORY', style: GoogleFonts.getFont('Antonio', fontWeight: FontWeight.bold, color: const Color(0xFF138B7E), fontSize: 24.8)),//style: TextStyle(color: Color(0xFF138B7E), fontSize: 24, fontWeight: FontWeight.bold)),
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
                        width: 350,
                        child:
                        isAdmin ? DropdownButton(
                          style: GoogleFonts.getFont('Open Sans', color: const Color(0xFF86BAB5), fontSize: 14, fontStyle: FontStyle.italic, fontWeight: FontWeight.w600),
                          isExpanded: true,
                          value: dropdownvalue,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              alignment: Alignment.centerLeft,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              dropdownvalue = newValue!;
                              updateGraph();
                            });
                          },
                        )
                        : Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            widget.credentials.values.first,
                            style: GoogleFonts.getFont('Open Sans', color: const Color(0xFF86BAB5), fontSize: 14, fontStyle: FontStyle.italic, fontWeight: FontWeight.w600),
                          ),
                        )
                      ),
                    ],
                  )
              ),
              Row(
                children: [
                  Container(
                    width: 1100,
                    height: 700,
                    color: Colors.transparent,
                    child: Center(
                      child: SizedBox(
                        width: 1050,
                        height: 600,
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width: 1050,
                                  height: 550,
                                  color: Colors.transparent,
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 300,
                                        height: 550,
                                        color: Colors.transparent,
                                      ),
                                      Stack(
                                        children: [
                                          Container(
                                            width: 700,
                                            height: 550,
                                            decoration: const BoxDecoration(
                                              border: Border.symmetric(
                                                vertical: BorderSide(
                                                  width: 0.2,
                                                )
                                              ),
                                              color: Colors.transparent,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 700,
                                            height: 550,
                                            child: SizedBox(
                                              width: 700,
                                              height: 50,
                                              child: Row(
                                                children: const [
                                                  SizedBox(width: 132),
                                                  VerticalDivider(),
                                                  SizedBox(width: 124),
                                                  VerticalDivider(),
                                                  SizedBox(width: 124),
                                                  VerticalDivider(),
                                                  SizedBox(width: 124),
                                                  VerticalDivider(),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        width: 50,
                                        height: 550,
                                        color: Colors.transparent,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 1050,
                                  height: 550,
                                  child: Scrollbar(
                                    controller: _scrollController,
                                    thumbVisibility: false,
                                    scrollbarOrientation: ScrollbarOrientation.left,
                                    child: SingleChildScrollView(
                                      controller: _scrollController,
                                      primary: false,
                                      child: SizedBox(
                                        width: 1049,
                                        child: Column(
                                          children: [
                                            _barData(text: 'BACLOFEN', front: fetchedUser[0][0]/5000, back: fetchedUser[1][0]/5000),
                                            _barData(text: 'BUSPIRONE HCL', front: fetchedUser[0][1]/5000, back: fetchedUser[1][1]/5000),
                                            _barData(text: 'CIMETIDINE', front: fetchedUser[0][2]/5000, back: fetchedUser[1][2]/5000),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Container(
                              width: 1050,
                              height: 50,
                              color: Colors.transparent,
                              child: Row(
                                children: const [
                                  SizedBox(width: 297),
                                  Text('0', textAlign: TextAlign.center, style: TextStyle(color: Color(0xFF469597), fontSize: 16, fontWeight: FontWeight.w100)),
                                  SizedBox(width: 109),
                                  Text('1,000', textAlign: TextAlign.center, style: TextStyle(color: Color(0xFF469597), fontSize: 16, fontWeight: FontWeight.w100)),
                                  SizedBox(width: 103),
                                  Text('2,000', textAlign: TextAlign.center, style: TextStyle(color: Color(0xFF469597), fontSize: 16, fontWeight: FontWeight.w100)),
                                  SizedBox(width: 103),
                                  Text('3,000', textAlign: TextAlign.center, style: TextStyle(color: Color(0xFF469597), fontSize: 16, fontWeight: FontWeight.w100)),
                                  SizedBox(width: 104),
                                  Text('4,000', textAlign: TextAlign.center, style: TextStyle(color: Color(0xFF469597), fontSize: 16, fontWeight: FontWeight.w100)),
                                  SizedBox(width: 95),
                                  Text('5,000', textAlign: TextAlign.center, style: TextStyle(color: Color(0xFF469597), fontSize: 16, fontWeight: FontWeight.w100)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 500,
                    height: 700,
                    color: Colors.transparent,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 100),
                        child: Stack(
                          children: [
                            Container(
                              width: 500,
                              height: 500,
                              padding: const EdgeInsets.only(bottom: 100),
                              color: Colors.transparent,
                              child: FittedBox(
                                fit: BoxFit.contain,
                                child: RotatedBox(
                                  quarterTurns: 3,
                                  child: SfRadialGauge(
                                      axes: <RadialAxis>[
                                        RadialAxis(minimum: 0, maximum: 100,
                                            pointers: <GaugePointer>[
                                              RangePointer(
                                                value: ((quantityTotal/aspaceTotal)*100).floorToDouble(),
                                                width: 70,
                                                cornerStyle: CornerStyle.bothFlat,
                                                color: const Color(0xFFDDBEAA),
                                              )
                                            ],
                                            showLabels: false,
                                            showAxisLine: true,
                                            showTicks: false,
                                            axisLineStyle: const AxisLineStyle(
                                              thickness: 70,
                                              color: Colors.white,
                                            ),
                                            startAngle: 0,
                                            endAngle: 360,
                                        )
                                      ]
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 500,
                              height: 400,
                              child: Center(child: Text('${((quantityTotal/aspaceTotal)*100).floorToDouble()}%',textAlign: TextAlign.center, style: GoogleFonts.getFont('Open Sans', fontWeight: FontWeight.normal, color: const Color(0xFF138B7E), fontSize: 73.3))),
                            ),
                            const Positioned(top: 285, child: SizedBox(width: 500, height: 150, child: VerticalDivider(color: Color(0xFF469597)))),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                color: Colors.transparent,
                                height: 190,
                                width: 400,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        SizedBox(
                                          width: 150,
                                          child: Text('Total Stocks:', textAlign: TextAlign.center, style: GoogleFonts.getFont('Open Sans', fontWeight: FontWeight.normal, color: const Color(0xFF138B7E), fontSize: 17.7)),
                                        ),
                                        SizedBox(
                                          width: 150,
                                          child: Text(formatNum.format(quantityTotal).split('.').first, textAlign: TextAlign.center, style: GoogleFonts.getFont('Open Sans', fontWeight: FontWeight.normal, color: const Color(0xFF138B7E), fontSize: 17.7)),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        SizedBox(
                                          width: 150,
                                          child: Text('Available Space:',textAlign: TextAlign.center, style: GoogleFonts.getFont('Open Sans', fontWeight: FontWeight.normal, color: const Color(0xFF138B7E), fontSize: 17.7)),
                                        ),
                                        SizedBox(
                                          width: 150,
                                          child: Text(formatNum.format(aspaceTotal).split('.').first,textAlign: TextAlign.center, style: GoogleFonts.getFont('Open Sans', fontWeight: FontWeight.normal, color: const Color(0xFF138B7E), fontSize: 17.7)),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 50,
                              right: 117,
                              child: SizedBox(
                                width: 500,
                                height: 100,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 50),
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: SizedBox(
                                      width: 170,
                                      height: 40,
                                      child: isAdmin ? Container() : ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: const Color(0xFFDDBEAA),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(50.0)
                                              )
                                          ),
                                          onPressed: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => ManageInventory(credentials: widget.credentials, session: widget.session)));
                                          },
                                          child: const Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                                            child: Text(
                                                'Manage Inventory',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(color: Color(0xFF469597), decoration: TextDecoration.underline, fontSize: 12, fontWeight: FontWeight.w600)
                                            ),
                                          )
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ),
                ],
              ),
            ],
          ),
          )
        )
      ),
    );
  }
}
