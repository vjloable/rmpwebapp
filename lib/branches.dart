import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

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
              child: Text(text, textAlign: TextAlign.right, style: const TextStyle(color: Color(0xFF138B7E), fontSize: 24, fontWeight: FontWeight.normal)),
            )
        ),
        Stack(
          children: [
            Container(
              width: ((back/1250)*700)+9,
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
              width: ((front/1250)*700)+9,
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
  const Branches({required this.session, Key? key}) : super(key: key);

  @override
  State<Branches> createState() => _BranchesState();
}

class _BranchesState extends State<Branches> {
  final _scrollController = ScrollController();
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
                              child: Text('BRANCHES', style: TextStyle(color: Color(0xFF138B7E), fontSize: 24, fontWeight: FontWeight.bold)),
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
                                              width: 1050,
                                              height: 50,
                                              child: Row(
                                                children: const [
                                                  SizedBox(width: 128),
                                                  VerticalDivider(),
                                                  SizedBox(width: 128),
                                                  VerticalDivider(),
                                                  SizedBox(width: 128),
                                                  VerticalDivider(),
                                                  SizedBox(width: 128),
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
                                            _barData(text: 'BACLOFEN', front: 570, back: 900),
                                            _barData(text: 'BUSPIRONE HCL', front: 470, back: 600),
                                            _barData(text: 'CIMETIDINE', front: 593, back: 1020),
                                            _barData(text: 'PINDOLOL', front: 500, back: 982),
                                            _barData(text: 'ZOPICLONE', front: 700, back: 1023),
                                            _barData(text: '-', front: 0, back: 0),
                                            _barData(text: '-', front: 0, back: 0),
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
                                  Text('0', textAlign: TextAlign.center, style: TextStyle(color: Color(0xFF138B7E), fontSize: 16, fontWeight: FontWeight.w100)),
                                  SizedBox(width: 116),
                                  Text('250', textAlign: TextAlign.center, style: TextStyle(color: Color(0xFF138B7E), fontSize: 16, fontWeight: FontWeight.w100)),
                                  SizedBox(width: 118),
                                  Text('500', textAlign: TextAlign.center, style: TextStyle(color: Color(0xFF138B7E), fontSize: 16, fontWeight: FontWeight.w100)),
                                  SizedBox(width: 117),
                                  Text('750', textAlign: TextAlign.center, style: TextStyle(color: Color(0xFF138B7E), fontSize: 16, fontWeight: FontWeight.w100)),
                                  SizedBox(width: 112),
                                  Text('1000', textAlign: TextAlign.center, style: TextStyle(color: Color(0xFF138B7E), fontSize: 16, fontWeight: FontWeight.w100)),
                                  SizedBox(width: 94),
                                  Text('1250', textAlign: TextAlign.center, style: TextStyle(color: Color(0xFF138B7E), fontSize: 16, fontWeight: FontWeight.w100)),
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
                                child: SfRadialGauge(
                                    axes: <RadialAxis>[
                                      RadialAxis(minimum: 0, maximum: 100,
                                          pointers: <GaugePointer>[
                                            RangePointer(
                                              value: isAdmin ? 67 : 56,
                                              width: 60,
                                              cornerStyle: CornerStyle.bothCurve,
                                              color: const Color(0xFFDDBEAA),
                                            )
                                          ],
                                          showLabels: false,
                                          showAxisLine: true,
                                          showTicks: false,
                                          axisLineStyle: const AxisLineStyle(
                                            thickness: 60,
                                            color: Colors.white,
                                          ),
                                          startAngle: 270,
                                          endAngle: 270+360,
                                      )
                                    ]
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 500,
                              height: 400,
                              child: Center(child: Text(isAdmin ? '67%' : '56%',textAlign: TextAlign.center, style: const TextStyle(color: Color(0xFF138B7E), fontSize: 100,fontWeight:FontWeight.w300))),
                            ),
                            const Positioned(top: 285, child: SizedBox(width: 500, height: 150, child: VerticalDivider(color: Color(0xFF138B7E)))),
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
                                      children: const [
                                        SizedBox(
                                          width: 150,
                                          child: Text('Total Stocks:',textAlign: TextAlign.center, style: TextStyle(color: Color(0xFF138B7E), fontSize: 22,fontWeight:FontWeight.w300)),
                                        ),
                                        SizedBox(
                                          width: 150,
                                          child: Text('2750',textAlign: TextAlign.center, style: TextStyle(color: Color(0xFF138B7E), fontSize: 22,fontWeight:FontWeight.w300)),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: const [
                                        SizedBox(
                                          width: 150,
                                          child: Text('Available Space:',textAlign: TextAlign.center, style: TextStyle(color: Color(0xFF138B7E), fontSize: 22,fontWeight:FontWeight.w300)),
                                        ),
                                        SizedBox(
                                          width: 150,
                                          child: Text('1843',textAlign: TextAlign.center, style: TextStyle(color: Color(0xFF138B7E), fontSize: 22,fontWeight:FontWeight.w300)),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
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
