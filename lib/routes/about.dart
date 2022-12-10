import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rmpwebapp/routes/login.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.transparent,
        height: double.infinity,
        width: 2000,
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Container(
            color: const Color(0xFFE5E3E4),
            height: 1200,
            width: 1600,
            child: Center(
              child: Container(
                color: Colors.transparent,//const Color(0xFFE5E3E4),
                height: 600,
                width: 1200,
                child: Row(
                  children: [
                    Column(
                      children: [
                        const SizedBox(height: 60),
                        Container(
                          color: Colors.transparent,//const Color(0xFFE5E3E4),
                          height: 540,
                          width: 500,
                          child: const FittedBox(fit: BoxFit.fill, child: Padding(
                            padding: EdgeInsets.all(40.0),
                            child: Image(image: AssetImage('assets/about_photo.png')),
                          )),
                        ),
                      ],
                    ),
                    const SizedBox(width: 20),
                    Container(
                      color: Colors.transparent,
                      height: 600,
                      width: 680,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 50,
                            width: 300,
                            child: Text('About Us', textAlign: TextAlign.center, style: GoogleFonts.getFont('Montserrat', fontWeight: FontWeight.bold, color: const Color(0xFF469597), fontSize: 35.4)),//TextStyle(color: Color(0xFF138B7E), fontSize: 45, fontWeight: FontWeight.bold)),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            height: 160,
                            width: 680,
                            child: Text(
                                'RM Pharmacy is a healthmed pharmacy and a general\nmerchandise that was found in 2014. However, back in\n1982, it is used to be a family business. RM Pharmacy has six\nbranches - two branches in Iligan, one in Maigo, one in\nKapatagan, one in Maranding, and one in Aurora.',
                                textAlign: TextAlign.center, style: GoogleFonts.getFont('Montserrat', fontWeight: FontWeight.normal, color: const Color(0xFF635355), fontSize: 18),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                            width: 600,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 180,
                                  child: ElevatedButton(
                                    style: const ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(Color(0xFF469597)),
                                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50))))
                                    ),
                                    onPressed: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Login(session: 'admin')));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                                      child: Text('Admin', textAlign: TextAlign.center, style: GoogleFonts.getFont('Montserrat', fontWeight: FontWeight.normal, color: Colors.white, fontSize: 11)),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                SizedBox(
                                  width: 180,
                                  child: ElevatedButton(
                                    style: const ButtonStyle(
                                        backgroundColor: MaterialStatePropertyAll(Color(0xFF469597)),
                                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50))))
                                    ),
                                    onPressed: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Login(session: 'user')));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                                      child: Text('User', textAlign: TextAlign.center, style: GoogleFonts.getFont('Montserrat', fontWeight: FontWeight.normal, color: Colors.white, fontSize: 11)),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      )
    );
  }
}