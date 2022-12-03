import 'package:flutter/material.dart';

class Branches extends StatefulWidget {
  const Branches({Key? key}) : super(key: key);

  @override
  State<Branches> createState() => _BranchesState();
}

class _BranchesState extends State<Branches> {
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
            ],
          ),
          )
        )
      ),
    );
  }
}
