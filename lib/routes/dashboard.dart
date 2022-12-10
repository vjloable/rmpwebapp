import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rmpwebapp/routes/dashboard_routes/inventory_tab/branches.dart';
import 'package:rmpwebapp/routes/dashboard_routes/inventory_tab/warehouse.dart';
import 'package:rmpwebapp/routes/dashboard_routes/item_request/item_request.dart';
import 'package:rmpwebapp/routes/dashboard_routes/register_or_debit/reg_debt.dart';
import 'package:rmpwebapp/routes/dashboard_routes/transaction_and_delivery/branches/delivery_confirmation.dart';
import 'package:rmpwebapp/routes/dashboard_routes/transaction_and_delivery/branches/delivery_status.dart';
import 'package:rmpwebapp/routes/dashboard_routes/transaction_and_delivery/branches/stock_ordered_main.dart';
import 'package:rmpwebapp/routes/dashboard_routes/transaction_and_delivery/supplier/delivery_status.dart';
import 'package:rmpwebapp/routes/dashboard_routes/transaction_and_delivery/supplier/stock_ordered_main.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:rmpwebapp/services/notifications.dart';
import 'package:rmpwebapp/structures/database.dart';

Widget _dashboardUp(BuildContext context, Function callback, bool stateSupplier, bool stateBranches, bool session, Map<String, String> credential){
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Stack(
        children: [
          Container(
            width: 1300,
            height: 220,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.white,
            ),
            child: Row(
              children: [
                Container(
                  height: 220,
                  width: 350,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
                    color: Colors.grey,
                    image: DecorationImage(fit: BoxFit.cover, image: AssetImage('assets/inventory_tab.png')),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    SizedBox(width: 950, child: Padding(
                      padding: const EdgeInsets.only(left: 150),
                      child: Text('Inventory Tab', style: GoogleFonts.getFont('Tenor Sans', color: const Color(0xFF423d27), fontSize: 25, fontWeight: FontWeight.bold)),
                    )),
                    const SizedBox(height: 40),
                    SizedBox(
                      width: 950,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: session ?
                        [
                          const SizedBox(width: 150),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFDDBEAA),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50.0)
                                  )
                              ),
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Warehouse(session: session ? 'admin' : 'user', credentials: credential)));
                              },
                              child: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                                child: SizedBox(width: 150, child: Text('Warehouse Inventory', textAlign: TextAlign.center, style: TextStyle(fontSize: 16))),
                              )
                          ),
                          const SizedBox(width: 60),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFDDBEAA),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50.0)
                                  )
                              ),
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Branches(session: 'admin', credentials: credential)));
                              },
                              child: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                                child: SizedBox(width: 150, child: Text('Branches Inventory', textAlign: TextAlign.center, style: TextStyle(fontSize: 16))),
                              )
                          ),
                        ] :
                        [
                          const SizedBox(width: 150),
                          ElevatedButton  (
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFDDBEAA),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50.0)
                                  )
                              ),
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Branches(session: 'user', credentials: credential)));
                              },
                              child: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                                child: SizedBox(width: 150, child: Text('Open', textAlign: TextAlign.center, style: TextStyle(fontSize: 16))),
                              )
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Positioned(top: 15,
              right: 20,
              child: IconButton(icon: const Icon(Icons.more_vert_rounded, size: 26, color: Colors.grey), onPressed: () {})
          )
        ],
      ),
      const SizedBox(height: 30),
      Stack(
        children: [
          Container(
            width: 1300,
            height: 220,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.white,
            ),
            child: Row(
              children: [
                Container(
                  height: 220,
                  width: 350,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
                    color: Colors.grey,
                    image: DecorationImage(fit: BoxFit.cover, image: AssetImage('assets/item_request.png')),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    SizedBox(width: 950, child: Padding(
                      padding: const EdgeInsets.only(left: 150),
                      child: Text('Item Request', style: GoogleFonts.getFont('Tenor Sans', color: const Color(0xFF423d27), fontSize: 25, fontWeight: FontWeight.bold)),
                    )),
                    const SizedBox(height: 40),
                    SizedBox(
                      width: 950,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(width: 150),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFDDBEAA),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50.0)
                                  )
                              ),
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => ItemRequest(session: session ? 'admin' : 'user', credentials: credential)));
                              },
                              child: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                                child: SizedBox(width: 150, child: Text('Open', textAlign: TextAlign.center, style: TextStyle(fontSize: 16))),
                              )
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Positioned(top: 15,
              right: 20,
              child: IconButton(icon: const Icon(Icons.more_vert_rounded, size: 26, color: Colors.grey), onPressed: () {})
          )
        ],
      ),
      const SizedBox(height: 30),
      Stack(
        children: [
          Container(
            width: 1300,
            height: 220,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.white,
            ),
            child: Row(
              children: [
                Container(
                  height: 220,
                  width: 350,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
                    color: Colors.grey,
                    image: DecorationImage(fit: BoxFit.cover, image: AssetImage('assets/trans_deliv.png')),
                  ),
                ),
                Stack(
                  children: [
                    SizedBox(
                      height: 220,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AnimatedCrossFade(
                            firstChild: const SizedBox(height: 40),
                            secondChild: const SizedBox(height: 0),
                            crossFadeState: stateSupplier || stateBranches ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                            duration: const Duration(milliseconds: 100),
                            reverseDuration: const Duration(milliseconds: 100),
                          ),
                          AnimatedCrossFade(
                            firstChild: SizedBox(width: 950, child: Padding(
                              padding: const EdgeInsets.only(left: 150),
                              child: Text(stateSupplier || stateBranches ? '' : 'Transaction and Delivery', style: GoogleFonts.getFont('Tenor Sans', color: const Color(0xFF423d27), fontSize: 25, fontWeight: FontWeight.bold)),
                            )),
                            secondChild: Container(),
                            crossFadeState: stateSupplier || stateBranches ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                            duration: const Duration(milliseconds: 100),
                            reverseDuration: const Duration(milliseconds: 100),
                          ),
                          const SizedBox(height: 40),
                          SizedBox(
                            width: 950,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(width: 150),
                                AnimatedCrossFade(
                                  firstChild: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color(0xFFDDBEAA),
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(50.0)
                                          )
                                      ),
                                      onPressed: (){
                                        callback('supplier');
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                                        child: SizedBox(width: 150, child: Text(session ? 'Supplier' : 'Open', textAlign: TextAlign.center, style: const TextStyle(fontSize: 16))),
                                      )
                                  ),
                                  secondChild: Container(),
                                  crossFadeState: stateBranches ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                                  duration: const Duration(milliseconds: 100),
                                  reverseDuration: const Duration(milliseconds: 100),
                                ),
                                SizedBox(width: stateBranches ? 0 : 60),
                                session ? AnimatedCrossFade(
                                  firstChild: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color(0xFFDDBEAA),
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(50.0)
                                          )
                                      ),
                                      onPressed: () {
                                        callback('branches');
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                                        child: SizedBox(width: 150, child: Text('Branches', textAlign: TextAlign.center, style: TextStyle(fontSize: 16))),
                                      )
                                  ),
                                  secondChild: Container(),
                                  crossFadeState: stateSupplier ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                                  duration: const Duration(milliseconds: 100),
                                  reverseDuration: const Duration(milliseconds: 100),
                                ) : Container(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 90,
                      left: 155,
                      child: AnimatedCrossFade(
                        firstChild: const SizedBox(height: 0),
                        secondChild: SizedBox(
                          height: 130,
                          width: 500,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: TextButton(
                                        onPressed: () {
                                          if(stateSupplier){
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => StockOrderedMainSupplier(session: session ? 'admin' : 'user', credentials: credential)));
                                          }else if(stateBranches){
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => StockOrderedMainBranches(session: session ? 'admin' : 'user', credentials: credential)));
                                          }
                                        },
                                        child: Row(
                                          children: const [
                                            Icon(Icons.arrow_forward_ios_rounded, color: Color(0xFFDDBEAA)),
                                            Text('  Stock Ordered', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const Divider(height: 5, color: Color(0xFFDDBEAA), thickness: 1),
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: TextButton(
                                        onPressed: () {
                                          if(stateSupplier){
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => DeliveryStatusSupplier(session: session ? 'admin' : 'user', credentials: credential)));
                                          }else if(stateBranches){
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => DeliveryStatusBranches(session: session ? 'admin' : 'user', credentials: credential)));
                                          }
                                        },
                                        child: Row(
                                          children: const [
                                            Icon(Icons.arrow_forward_ios_rounded, color: Color(0xFFDDBEAA)),
                                            Text('  Delivery Status', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                stateSupplier ? Container() : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => DeliveryConfirmation(credentials: credential, session: session ? 'admin' : 'user')));
                                        },
                                        child: Row(
                                          children: const [
                                            Icon(Icons.arrow_forward_ios_rounded, color: Color(0xFFDDBEAA)),
                                            Text('  Delivery Confirmation', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const Divider(height: 5, color: Color(0xFFDDBEAA), thickness: 1),
                                    const SizedBox(
                                      height: 50,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        crossFadeState: stateSupplier || stateBranches ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                        reverseDuration: const Duration(milliseconds: 100),
                        duration: const Duration(milliseconds: 100),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Positioned(top: 15,
              right: 20,
              child: IconButton(icon: const Icon(Icons.more_vert_rounded, size: 26, color: Colors.grey), onPressed: () {})
          )
        ],
      ),
    ],
  );
}
Widget _dashboardDown(BuildContext context){
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Stack(
        children: [
          Container(
            width: 1300,
            height: 220,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.white,
            ),
            child: Row(
              children: [
                Container(
                  height: 220,
                  width: 350,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
                    color: Colors.grey,
                    image: DecorationImage(fit: BoxFit.cover, image: AssetImage('assets/register_debt.png')),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    SizedBox(width: 950, child: Padding(
                      padding: const EdgeInsets.only(left: 150),
                      child: Text('Register/Debit', style: GoogleFonts.getFont('Tenor Sans', color: const Color(0xFF423d27), fontSize: 25, fontWeight: FontWeight.bold)),
                    )),
                    const SizedBox(height: 40),
                    SizedBox(
                      width: 950,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(width: 150),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFDDBEAA),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50.0)
                                  )
                              ),
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterDebt()));
                              },
                              child: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                                child: SizedBox(width: 150, child: Text('Open', textAlign: TextAlign.center, style: TextStyle(fontSize: 16))),
                              )
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Positioned(top: 15,
              right: 20,
              child: IconButton(icon: const Icon(Icons.more_vert_rounded, size: 26, color: Colors.grey), onPressed: () {})
          )
        ],
      ),
    ],
  );
}

class Dashboard extends StatefulWidget {
  final String session;
  final Map<String, String> credential;
  const Dashboard({required this.session, Key? key, required this.credential}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late bool _inUp = true;
  static bool _isSupplierClicked = false;
  static bool _isBranchesClicked = false;
  static bool _showNotifications = false;
  static bool _showBadge = false;
  bool isAdmin = false;

  int aspaceTotal = 0;
  int quantityTotal = 0;

  @override
  void initState() {
    verifySession();
    updateAspaceTotal();
    updateQuantityTotal();
    checkUnderload();
    checkBadge(widget);
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

  void _changeDashboard(){
    setState(() {
      _inUp = !_inUp;
      if(_inUp){
        _isSupplierClicked=false;
        _isBranchesClicked=false;
      }
    });
  }

  void _clickButtons(String button){
    setState(() {
      if(button == 'supplier'){
        _isSupplierClicked = !_isSupplierClicked;
        _isBranchesClicked=false;
      }else if(button == 'branches'){
        _isBranchesClicked = !_isBranchesClicked;
        _isSupplierClicked=false;
      }
    });
  }

  void verifySession(){
    if(widget.session == 'admin'){
      isAdmin = true;
    }else if(widget.session == 'user'){
      isAdmin = false;
    }
  }

  void showNotifications() {
    setState(() {
      checkUnderload();
      _showNotifications = !_showNotifications;
    });
  }

  void checkUnderload() {
    if(((quantityTotal/aspaceTotal)*100).floorToDouble() <= 50){
      Notifications.warn();
    }
    setState(() {});
  }

  static void checkBadge(var widget) {
    _showBadge = Notifications.checkReadAll(widget.credential.values.first);
  }

  void closeBadge() {
    setState(() {
      _showBadge = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Container(
            color: Colors.transparent,
            height: double.infinity,
            width: 2000,
            child: FittedBox(
              alignment: Alignment.topLeft,
              fit: BoxFit.fitWidth,
              child: Stack(
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        height: 1200,
                        width: 300,
                      ),
                      Container(
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
                                    const SizedBox(height: 1, width: 150),
                                    SizedBox(
                                      height: 60,
                                      width: 600,
                                      child: TextFormField(
                                        cursorColor: const Color(0xFF00654F),
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          prefixIcon: const Padding(
                                            padding: EdgeInsets.only(left: 30, right: 10),
                                            child: Icon(
                                              size: 25,
                                              Icons.search,
                                              color: Color(0xFF00654F),
                                            ),
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
                                          hintText: 'Search',
                                          hintStyle: const TextStyle(color: Color(0xFF86BAB5), fontSize: 14, fontStyle: FontStyle.italic, fontWeight: FontWeight.w300),
                                          filled: true,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 1, width: 400),
                                    TextButton(
                                      onPressed: () {},
                                      child: Row(
                                        children: [
                                          Stack(
                                            children: [
                                              Container(
                                                height: 40,
                                                width: 40,
                                                color: Colors.transparent,
                                                child: const Icon(Icons.account_circle_rounded, size: 40, color: Colors.grey),
                                              ),
                                              const Positioned(
                                                top: 1,
                                                right: 1,
                                                child: CircleAvatar(
                                                  radius: 6,
                                                  backgroundColor: Colors.green,
                                                ),
                                              )
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                            child: Text((widget.credential.values.first),
                                                style: const TextStyle(color: Color(0xFF00654F), fontSize: 14, fontWeight: FontWeight.w600, letterSpacing: 2)),
                                          ),
                                          const RotatedBox(quarterTurns: 3,child: Icon(Icons.arrow_back_ios_rounded, size: 12, color: Color(0xFF86BAB5))),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 1, width: 10),
                                    TextButton(
                                        onPressed: () {},
                                        child: const Icon(Icons.mail_outline_rounded, size: 22, color: Color(0xFF86BAB5))
                                    ),
                                    const SizedBox(height: 1, width: 10),
                                    TextButton(
                                        onPressed: () {
                                          showNotifications();
                                          closeBadge();
                                          //Notifications.hasReadAll(widget.credential.values.first);
                                        },
                                        child: Badge(
                                            showBadge: _showBadge,
                                            badgeColor: Colors.red,
                                            position: BadgePosition.topEnd(),
                                            child: Icon(_showNotifications ? Icons.notifications : Icons.notifications_none_rounded, size: 22, color: const Color(0xFF86BAB5))
                                        )
                                    ),
                                    const SizedBox(height: 1, width: 10),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                          _isSupplierClicked = false;
                                        },
                                        child: const Icon(Icons.logout_rounded, size: 22, color: Color(0xFF86BAB5))
                                    ),
                                  ],
                                )
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 40),
                              child: AnimatedCrossFade(
                                  firstChild: _dashboardUp(context, _clickButtons, _isSupplierClicked, _isBranchesClicked, isAdmin, widget.credential),
                                  secondChild: _dashboardDown(context),
                                  crossFadeState: _inUp ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                                  firstCurve: Curves.easeIn,
                                  secondCurve: Curves.easeIn,
                                  duration: const Duration(milliseconds: 200),
                              )
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    left: 0,
                    child: Material(
                      elevation: 25,
                      shadowColor: Colors.black,
                      child: Container(
                        color: const Color(0xFFBBC6C8),
                        height: 1200,
                        width: 300,
                        child: Column(
                          children: [
                            SizedBox(
                              width: 300,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 50, top: 60),
                                child: Text('RM Pharmacy', style: GoogleFonts.getFont('Spectral', letterSpacing: 3, color: const Color(0xFF469597), fontSize: 23, fontWeight: FontWeight.bold)),
                              ),
                            ),
                            SizedBox(
                              width: 300,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 50, bottom: 100),
                                child: Text('Health Meds', style: GoogleFonts.getFont('Spectral', letterSpacing: 2, color: const Color(0xFF469597), fontSize: 23, fontWeight: FontWeight.w200)),
                              ),
                            ),
                            SizedBox(
                              height: 90,
                              width: 300,
                              child: RawMaterialButton(
                                  fillColor: const Color(0xFFC4C3BF),
                                  shape: const Border(
                                    top: BorderSide(width: 0.5, color: Color(0xFFA88B71)),
                                    bottom: BorderSide(width: 0.5, color: Color(0xFFA88B71)),
                                    right: BorderSide(width: 0.5, color: Color(0xFFA88B71)),
                                  ),
                                  onPressed: null,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(width: 30, color: const Color(0xFFB09D8A)),
                                      const SizedBox(width: 40),
                                      Text('Dashboard', style: GoogleFonts.getFont('Tenor Sans', color: const Color(0xFF000000), fontSize: 18, fontWeight: FontWeight.normal)),
                                    ],
                                  )
                              ),
                            ),
                            SizedBox(
                              height: 90,
                              width: 300,
                              child: RawMaterialButton(
                                  shape: const Border(
                                    top: BorderSide(width: 0.5, color: Color(0xFFA88B71)),
                                    bottom: BorderSide(width: 0.5, color: Color(0xFFA88B71)),
                                    right: BorderSide(width: 0.5, color: Color(0xFFA88B71)),
                                  ),
                                  onPressed: () {},
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(width: 30, color: Colors.transparent),
                                      const SizedBox(width: 40),
                                      Text('Themes', style: GoogleFonts.getFont('Tenor Sans', color: const Color(0xFF000000), fontSize: 18, fontWeight: FontWeight.normal)),
                                    ],
                                  )
                              ),
                            ),
                            SizedBox(
                              height: 90,
                              width: 300,
                              child: RawMaterialButton(
                                  shape: const Border(
                                    top: BorderSide(width: 0.5, color: Color(0xFFA88B71)),
                                    bottom: BorderSide(width: 0.5, color: Color(0xFFA88B71)),
                                    right: BorderSide(width: 0.5, color: Color(0xFFA88B71)),
                                  ),
                                  onPressed: () {},
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(width: 30, color: Colors.transparent),
                                      const SizedBox(width: 40),
                                      Text('Help', style: GoogleFonts.getFont('Tenor Sans', color: const Color(0xFF000000), fontSize: 18, fontWeight: FontWeight.normal)),
                                    ],
                                  )
                              ),
                            ),
                            SizedBox(
                              height: 90,
                              width: 300,
                              child: RawMaterialButton(
                                  shape: const Border(
                                    top: BorderSide(width: 0.5, color: Color(0xFFA88B71)),
                                    bottom: BorderSide(width: 0.5, color: Color(0xFFA88B71)),
                                    right: BorderSide(width: 0.5, color: Color(0xFFA88B71)),
                                  ),
                                  onPressed: () {},
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(width: 30, color: Colors.transparent),
                                      const SizedBox(width: 40),
                                      Text('Rate AIMS', style: GoogleFonts.getFont('Tenor Sans', color: const Color(0xFF000000), fontSize: 18, fontWeight: FontWeight.normal)),
                                    ],
                                  )
                              ),
                            ),
                            SizedBox(
                              height: 90,
                              width: 300,
                              child: RawMaterialButton(
                                  shape: const Border(
                                    top: BorderSide(width: 0.5, color: Color(0xFFA88B71)),
                                    bottom: BorderSide(width: 0.5, color: Color(0xFFA88B71)),
                                    right: BorderSide(width: 0.5, color: Color(0xFFA88B71)),
                                  ),
                                  onPressed: () {},
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(width: 30, color: Colors.transparent),
                                      const SizedBox(width: 40),
                                      Text('Settings', style: GoogleFonts.getFont('Tenor Sans', color: const Color(0xFF000000), fontSize: 18, fontWeight: FontWeight.normal)),
                                    ],
                                  )
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      right: 40,
                      top: _inUp ? 750 : 120,
                      child: RotatedBox(
                        quarterTurns: _inUp ? 4 : 2,
                        child: Container(
                          width: 120,
                          height: 120,
                          color: Colors.transparent,
                          child: IconButton(
                            icon: const Icon(Icons.arrow_drop_down_circle_rounded, size: 100, color: Color(0xAF86BAB5)),
                            onPressed: () {
                              _changeDashboard();
                            },
                          ),
                        ),
                      )
                  ),
                  Positioned(
                    top: 80,
                    right: 50,
                    child: Material(
                      elevation: 20,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                      child: AnimatedCrossFade(
                        firstChild: SizedBox(
                            width: 400,
                            height: 180,
                            child: SingleChildScrollView(
                              child: Column(
                                children: List.generate(
                                    Notifications.getNotifBox(widget.credential.values.first).length, (index) =>
                                    SizedBox(

                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Center(
                                                child: SizedBox(
                                                  width: 330,
                                                  height: 90,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 15.0, bottom: 10, top: 10),
                                                    child: FittedBox(fit: BoxFit.scaleDown, child: Align(alignment: Alignment.center, child: Text(maxLines: 3, Notifications.getNotifBox(widget.credential.values.first).reversed.toList().elementAt(index).message, style: const TextStyle(fontSize: 20, color: Color(0xFF00654F)), textAlign: TextAlign.justify,))),
                                                  ),
                                                ),
                                              ),
                                              Center(
                                                child: SizedBox(
                                                  width: 60,
                                                  height: 90,
                                                  child: Align(alignment: Alignment.center, child: CircleAvatar(radius: 5, backgroundColor: Notifications.getNotifBox(widget.credential.values.first).reversed.toList().elementAt(index).isRead ? Colors.grey : Colors.red)),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(width: 340, child: Center(child: Divider(color: Colors.grey.shade200)))
                                        ],
                                      ),
                                    ),
                                ).toList(),
                              ),
                            ),
                          ),
                        secondChild: Container(),
                        crossFadeState: _showNotifications ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                        duration: const Duration(milliseconds: 100),
                        //reverseDuration: const Duration(milliseconds: 150),
                        firstCurve: Curves.bounceOut,
                        //secondCurve: Curves.easeInQuart,
                      ),
                    )
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
  @override
  void dispose(){
    _inUp = true;
    _isSupplierClicked = false;
    _isBranchesClicked = false;
    _showNotifications = false;
    super.dispose();
  }

}
