import 'package:flutter/material.dart';
import 'package:rmpwebapp/branches.dart';
import 'package:rmpwebapp/delivery_status.dart';
import 'package:rmpwebapp/item_request.dart';
import 'package:rmpwebapp/reg_debt.dart';
import 'package:rmpwebapp/stock_ordered_main.dart';
import 'package:rmpwebapp/warehouse.dart';

Widget _dashboardUp(BuildContext context, Function callback, bool state, bool session){
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
                    const SizedBox(width: 950, child: Padding(
                      padding: EdgeInsets.only(left: 150),
                      child: Text('Inventory Tab', style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),),
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
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const Warehouse()));
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
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const Branches(session: 'admin')));
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
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const Branches(session: 'user')));
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
                    const SizedBox(width: 950, child: Padding(
                      padding: EdgeInsets.only(left: 150),
                      child: Text('Item Request', style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),),
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
                                Navigator.push(context, MaterialPageRoute(builder: (context) => ItemRequest(session: session ? 'admin' : 'user')));
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
                            crossFadeState: state ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                            duration: const Duration(milliseconds: 100),
                            reverseDuration: const Duration(milliseconds: 100),
                          ),
                          AnimatedCrossFade(
                            firstChild: SizedBox(width: 950, child: Padding(
                              padding: const EdgeInsets.only(left: 150),
                              child: Text(state ? '' : 'Transaction and Delivery', style: const TextStyle(fontSize: 34, fontWeight: FontWeight.bold),),
                            )),
                            secondChild: Container(),
                            crossFadeState: state ? CrossFadeState.showSecond : CrossFadeState.showFirst,
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
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(0xFFDDBEAA),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(50.0)
                                        )
                                    ),
                                    onPressed: (){
                                      callback();
                                    },
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                                      child: SizedBox(width: 150, child: Text('Supplier', textAlign: TextAlign.center, style: TextStyle(fontSize: 16))),
                                    )
                                ),
                                const SizedBox(width: 60),
                                AnimatedCrossFade(
                                  firstChild: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color(0xFFDDBEAA),
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(50.0)
                                          )
                                      ),
                                      onPressed: () {},
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                                        child: SizedBox(width: 150, child: Text('Branches', textAlign: TextAlign.center, style: TextStyle(fontSize: 16))),
                                      )
                                  ),
                                  secondChild: Container(),
                                  crossFadeState: state ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                                  duration: const Duration(milliseconds: 100),
                                  reverseDuration: const Duration(milliseconds: 100),
                                ),
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
                          width: 300,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => const StockOrderedMain()));
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
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => const DeliveryStatus()));
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
                          ),
                        ),
                        crossFadeState: state ? CrossFadeState.showSecond : CrossFadeState.showFirst,
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
                    const SizedBox(width: 950, child: Padding(
                      padding: EdgeInsets.only(left: 150),
                      child: Text('Register/Debt', style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),),
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
  const Dashboard({required this.session, Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late bool _inUp = true;
  static bool _isSupplierClicked = false;
  bool isAdmin = false;

  @override
  void initState() {
    verifySession();
    super.initState();
  }

  void _changeDashboard(){
    setState(() {
      _inUp = !_inUp;
      if(_inUp){_isSupplierClicked=false;}
    });
  }

  void _clickSupplier(){
    setState(() {
      _isSupplierClicked = !_isSupplierClicked;
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
        body: SafeArea(
          child: Container(
            color: Colors.transparent,
            height: double.infinity,
            width: 2000,
            child: FittedBox(
              alignment: Alignment.topLeft,
              fit: BoxFit.fitWidth,
              child: Row(
                children: [
                  Container(
                    color: const Color(0xFFBBC6C8),
                    height: 1200,
                    width: 400,
                    child: Column(
                      children: [
                        const SizedBox(
                          width: 400,
                          child: Padding(
                            padding: EdgeInsets.only(left: 50, top: 60),
                            child: Text('RM Pharmacy', style: TextStyle(color: Color(0xFF138B7E), fontSize: 30, fontWeight: FontWeight.bold)),
                          ),
                        ),
                        const SizedBox(
                          width: 400,
                          child: Padding(
                            padding: EdgeInsets.only(left: 50, bottom: 100),
                            child: Text('Health Meds', style: TextStyle(color: Color(0xFF138B7E), fontSize: 30, fontWeight: FontWeight.w100)),
                          ),
                        ),
                        SizedBox(
                          height: 90,
                          width: 400,
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
                                  const Text('Dashboard', style: TextStyle(color: Colors.black, fontSize: 24)),
                                ],
                              )
                          ),
                        ),
                        SizedBox(
                          height: 90,
                          width: 400,
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
                                  const Text('Themes', style: TextStyle(color: Colors.black, fontSize: 24)),
                                ],
                              )
                          ),
                        ),
                        SizedBox(
                          height: 90,
                          width: 400,
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
                                  const Text('Help', style: TextStyle(color: Colors.black, fontSize: 24)),
                                ],
                              )
                          ),
                        ),
                        SizedBox(
                          height: 90,
                          width: 400,
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
                                  const Text('Rate AIMS', style: TextStyle(color: Colors.black, fontSize: 24)),
                                ],
                              )
                          ),
                        ),
                        SizedBox(
                          height: 90,
                          width: 400,
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
                                  const Text('Settings', style: TextStyle(color: Colors.black, fontSize: 24)),
                                ],
                              )
                          ),
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    children: [
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
                                    const SizedBox(height: 1, width: 100),
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
                                            child: Text((isAdmin ? 'Admin' : 'User'), style: const TextStyle(color: Color(0xFF00654F), fontSize: 14, fontWeight: FontWeight.w600, letterSpacing: 2)),
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
                                        onPressed: () {},
                                        child: const Icon(Icons.notifications_none_rounded, size: 22, color: Color(0xFF86BAB5))
                                    ),
                                    const SizedBox(height: 1, width: 10),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                        },
                                        child: const Icon(Icons.logout_rounded, size: 22, color: Color(0xFF86BAB5))
                                    ),
                                  ],
                                )
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 40),
                              child: AnimatedCrossFade(
                                  firstChild: _dashboardUp(context, _clickSupplier, _isSupplierClicked, isAdmin),
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
                    ],
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}
