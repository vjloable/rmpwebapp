import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rmpwebapp/routes/dashboard_routes/inventory_tab/branches.dart';
import 'package:rmpwebapp/structures/database.dart';

final formatCurrency = NumberFormat.currency(symbol: '₱');

class NewDataRow {
  late bool value = false;
  final String brand;
  late int stocks, space, min = 0, position;
  final void Function(int x, int y) spaceCallback, stocksCallback;
  NewDataRow(
      {required this.brand,
      required this.stocks,
      required this.space,
      required this.spaceCallback,
      required this.stocksCallback,
      required this.position});

  DataRow generate() {
    return DataRow(cells: [
      DataCell(Center(child: Text(brand))),
      DataCell(Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            (stocks > 0)
                ? SizedBox(
                    height: 45,
                    width: 45,
                    child: ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.brown),
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(50))))),
                        onPressed: () {
                          stocksCallback(position, (stocks - 50));
                        },
                        child: const Text('-',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold))))
                : Container(
                    height: 45,
                    width: 45,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Color(0xFFDDBEAA)),
                    child: const Center(
                        child: Text('-',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)))),
            SizedBox(width: 160, child: Center(child: Text(stocks.toString()))),
            (stocks < space)
                ? SizedBox(
                    height: 45,
                    width: 45,
                    child: ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.brown),
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(50))))),
                        onPressed: () {
                          stocksCallback(position, (stocks + 50));
                        },
                        child: const Text('+',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold))))
                : Container(
                    height: 45,
                    width: 45,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Color(0xFFDDBEAA)),
                    child: const Center(
                        child: Text('+',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)))),
          ],
        ),
      )),
      DataCell(Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            (space > stocks)
                ? SizedBox(
                    height: 45,
                    width: 45,
                    child: ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.brown),
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(50))))),
                        onPressed: () {
                          spaceCallback(position, (space - 50));
                        },
                        child: const Text('-',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold))))
                : Container(
                    height: 45,
                    width: 45,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Color(0xFFDDBEAA)),
                    child: const Center(
                        child: Text('-',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)))),
            SizedBox(width: 160, child: Center(child: Text(space.toString()))),
            (space <= 4950)
                ? SizedBox(
                    height: 45,
                    width: 45,
                    child: ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.brown),
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(50))))),
                        onPressed: () {
                          spaceCallback(position, (space + 50));
                        },
                        child: const Text('+',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold))))
                : Container(
                    height: 45,
                    width: 45,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Color(0xFFDDBEAA)),
                    child: const Center(
                        child: Text('+',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)))),
          ],
        ),
      )),
    ]);
  }
}

class ManageInventory extends StatefulWidget {
  final String session;
  final Map<String, String> credentials;
  const ManageInventory(
      {required this.session, required this.credentials, Key? key})
      : super(key: key);

  @override
  State<ManageInventory> createState() => _ManageInventoryState();
}

class _ManageInventoryState extends State<ManageInventory> {
  final _scrollController = ScrollController();
  List<String> brands = ['Baclofen', 'Buspirone-HCL', 'Cimetidine'];
  bool isAdmin = false;
  List<dynamic> fetchedUser = Database.ilig1;
  List<dynamic> fetchedUserStocks = [];
  List<dynamic> fetchedUserAvail = [];
  int pos = 0;

  @override
  void initState() {
    verifySession();
    updateGraph();
    super.initState();
  }

  void verifySession() {
    if (widget.session == 'admin') {
      isAdmin = true;
    } else if (widget.session == 'user') {
      isAdmin = false;
    }
  }

  void updateGraph() {
    setState(() {
      if (widget.credentials.values.first == 'Iligan 1') {
        fetchedUser = Database.ilig1;
      } else if (widget.credentials.values.first == 'Iligan 2') {
        fetchedUser = Database.ilig2;
      } else if (widget.credentials.values.first == 'Kapatagan') {
        fetchedUser = Database.kapat;
      } else if (widget.credentials.values.first == 'Maranding') {
        fetchedUser = Database.maran;
      } else if (widget.credentials.values.first == 'Aurora') {
        fetchedUser = Database.auro;
      }
      fetchedUserStocks = fetchedUser[0];
      fetchedUserAvail = fetchedUser[1];
    });
  }

  void changeStocks(int x, int y) {
    setState(() {
      fetchedUserStocks[x] = y;
    });
  }

  void changeSpace(int x, int y) {
    setState(() {
      fetchedUserAvail[x] = y;
    });
  }

  void update() {
    if (widget.credentials.values.first == 'Iligan 1') {
      Database.ilig1[0] = fetchedUserStocks;
      Database.ilig1[1] = fetchedUserAvail;
    } else if (widget.credentials.values.first == 'Iligan 2') {
      Database.ilig2[0] = fetchedUserStocks;
      Database.ilig2[1] = fetchedUserAvail;
    } else if (widget.credentials.values.first == 'Kapatagan') {
      Database.kapat[0] = fetchedUserStocks;
      Database.kapat[1] = fetchedUserAvail;
    } else if (widget.credentials.values.first == 'Maranding') {
      Database.maran[0] = fetchedUserStocks;
      Database.maran[1] = fetchedUserAvail;
    } else if (widget.credentials.values.first == 'Aurora') {
      Database.auro[0] = fetchedUserStocks;
      Database.auro[1] = fetchedUserAvail;
    }
    setState(() {
      fetchedUserStocks = [0, 0, 0];
      fetchedUserAvail = [0, 0, 0];
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              color: Colors.transparent,
                              height: 160,
                              width: 1600,
                              child: const Padding(
                              padding: EdgeInsets.only(top: 50, left: 50),
                              child: SizedBox(
                                height: 60,
                                width: 400,
                                child: Text('Manage Inventory', style: TextStyle(color: Color(0xFF469597), letterSpacing: 2, fontSize: 50, fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 40),
                            child:
                                Divider(color: Color(0x55138B7E), thickness: 2),
                          ),
                          const SizedBox(height: 30),
                          Container(
                            height: 550,
                            width: 1600,
                            color: Colors.transparent,
                            child: Center(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 40),
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 20.0),
                                      child: Container(
                                        color: Colors.transparent,
                                        height: 380,
                                        width: 1600,
                                        child: Scrollbar(
                                          thumbVisibility: true,
                                          controller: _scrollController,
                                          child: SingleChildScrollView(
                                            controller: _scrollController,
                                            child: SizedBox(
                                              height: 380,
                                              width: 1480,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    color: Colors.transparent,
                                                    height: 350,
                                                    width: 1400,
                                                    child: DataTable(
                                                        headingRowHeight: 80,
                                                        dataRowHeight: 80,
                                                        showCheckboxColumn:
                                                            true,
                                                        headingTextStyle:
                                                            const TextStyle(
                                                                color: Color(
                                                                    0xFF469597),
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                        dataTextStyle:
                                                            const TextStyle(
                                                                color: Color(
                                                                    0xFF469597),
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w100),
                                                        border: TableBorder.all(
                                                            width: 1,
                                                            color: const Color(
                                                                0xFF469597)),
                                                        columns: const [
                                                          DataColumn(
                                                              label: Expanded(
                                                                  child: Text(
                                                                      'Brand Name',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center))),
                                                          DataColumn(
                                                              label: Expanded(
                                                                  child: Text(
                                                                      'Stocks',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center))),
                                                          DataColumn(
                                                              label: Expanded(
                                                                  child: Text(
                                                                      'Available Space',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center))),
                                                        ],
                                                        rows: List.generate(
                                                          brands.length,
                                                          (index) => NewDataRow(
                                                                  brand: brands[
                                                                      index],
                                                                  stocks:
                                                                      fetchedUserStocks[
                                                                          index],
                                                                  space:
                                                                      fetchedUserAvail[
                                                                          index],
                                                                  stocksCallback:
                                                                      changeStocks,
                                                                  spaceCallback:
                                                                      changeSpace,
                                                                  position:
                                                                      index)
                                                              .generate(),
                                                        )),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Stack(children: [
                                    const SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 300,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.white,
                                                side: const BorderSide(
                                                    width: 3,
                                                    color: Color(0xFFDDBEAA)),
                                              ),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 50,
                                                    vertical: 20),
                                                child: Text('BACK',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFF469597),
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w600)),
                                              )),
                                        ),
                                        const SizedBox(width: 80),
                                        SizedBox(
                                          width: 300,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    const Color(0xFFDDBEAA),
                                              ),
                                              onPressed: () {
                                                update();
                                                Navigator.pop(context);
                                                Navigator.pop(context);
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) => Branches(
                                                            session: isAdmin
                                                                ? 'admin'
                                                                : 'user',
                                                            credentials: widget
                                                                .credentials)));
                                              },
                                              child: const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 50,
                                                    vertical: 20),
                                                child: Text('CONFIRM',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFF469597),
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w600)),
                                              )),
                                        ),
                                      ],
                                    ),
                                  ])
                                ])),
                          )
                        ])))));
  }
}
