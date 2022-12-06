import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterDebt extends StatefulWidget {
  const RegisterDebt({Key? key}) : super(key: key);

  @override
  State<RegisterDebt> createState() => _RegisterDebtState();
}

class _RegisterDebtState extends State<RegisterDebt> {
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
                  color: Colors.transparent,
                  height: 220,
                  width: 1600,
                  child: Row(
                    children: [
                      const SizedBox(height: 1, width: 50),
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: Center(
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(Icons.keyboard_return, size: 45, color: Color(0xFF469597)),
                          ),
                        ),
                      ),
                      const SizedBox(height: 1, width: 50),
                      SizedBox(
                        width: 500,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text('REGISTER/\nDEBIT', style: GoogleFonts.getFont('Work Sans', fontSize: 70, fontWeight: FontWeight.w900, color: const Color(0xFF469597)))
                          //TextStyle(color: Color(0xFF469597), letterSpacing: 3, fontSize: 70, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  )
              ),
              Container(
                height: 450,
                width: 1600,
                color: Colors.transparent,
                child: const Center(
                  child: SizedBox(
                    width: 400,
                    height: 400,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Image(image: AssetImage('assets/qr.png')),
                    ),
                  ),
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
