import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final formatCurrency = NumberFormat.currency(symbol: '₱');

class RequestDelivery extends StatefulWidget {
  final double requestPrice;
  final String session;
  const RequestDelivery({required this.requestPrice, required this.session, Key? key}) : super(key: key);

  @override
  State<RequestDelivery> createState() => _RequestDeliveryState();
}

class _RequestDeliveryState extends State<RequestDelivery> {
  bool isAdmin = false;

  @override
  void initState() {
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
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: SizedBox(
                          width: 60,
                          height: 60,
                          child: IconButton(
                            splashRadius: 30,
                            icon: const Icon(Icons.home, size: 40),
                            color: const Color(0xFF469597),
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.pop(context);
                              },
                          ),
                        ),
                      ),
                      const SizedBox(height: 1, width: 50),
                      SizedBox(
                        height: 180,
                        width: 300,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            SizedBox(
                              height: 40,
                              width: 300,
                              child: Text('REQUEST', style: TextStyle(color: Color(0xFF469597), fontSize: 30, fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(
                              height: 40,
                              width: 300,
                              child: Text('DELIVERY', style: TextStyle(color: Color(0xFF469597), fontSize: 30, fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 1, width: 650),
                    ],
                  )
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Divider(color: Color(0x55138B7E), thickness: 2),
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
                      Stack(
                        children: [
                          Container(
                              width: 1300,
                              height: 300,
                              decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30)), color: Color(0xFFD9D9D9)),
                              child: Center(
                                child: Text(
                                    formatCurrency.format(widget.requestPrice),
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(color: Color(0xFF469597), fontSize: 42, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)
                                ),
                              )
                          ),
                          const Positioned(
                            top: 50,
                            left: 70,
                            child: Text(
                                'Total Items:',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Color(0xFF469597), fontSize: 38, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Text(
                          isAdmin ? 'Are you sure to order these items from the supplier?'
                          : 'Are you sure to order these items from warehouse?',
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Color(0xFF469597), fontSize: 30, fontWeight: FontWeight.w200, fontStyle: FontStyle.italic)
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 300,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  side: const BorderSide(width: 3, color: Color(0xFFDDBEAA)),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                                  child: Text(
                                      'BACK',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Color(0xFF469597), fontSize: 20, fontWeight: FontWeight.w600)
                                  ),
                                )
                            ),
                          ),
                          const SizedBox(width: 80),
                          SizedBox(
                            width: 300,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFDDBEAA),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                },
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                                  child: Text(
                                      'CONFIRM',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Color(0xFF469597), fontSize: 20, fontWeight: FontWeight.w600)
                                  ),
                                )
                            ),
                          ),
                        ],
                      ),
                    ],
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
