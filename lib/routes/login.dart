import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rmpwebapp/routes/dashboard.dart';
import 'package:rmpwebapp/services/auth.dart';


class Login extends StatefulWidget {
  final String session;
  const Login({required this.session, Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController emailTC = TextEditingController();
  late TextEditingController passwordTC = TextEditingController();
  bool isAdmin = false;

  String dropdownvalue = 'Iligan';

  List<String> branch_loc = [
    'Iligan',
    'Kapatagan',
    'Maranding',
    'Aurora'
  ];


  @override
  void initState() {
    verifySession();
    resetForm();
    super.initState();
  }

  void verifySession(){
    if(widget.session == 'admin'){
      isAdmin = true;
    }else if(widget.session == 'user'){
      isAdmin = false;
    }
  }

  void resetForm(){
    setState(() {
      emailTC.clear();
      passwordTC.clear();
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
            fit: BoxFit.fitWidth,
            child: Container(
              color: Colors.transparent,
              height: 1200,
              width: 1600,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                        child: SizedBox(
                            height: 60,
                            width: 600 ,
                            child: Text(
                                'Sign in to continue',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.getFont('Montserrat', fontWeight: FontWeight.bold, color: const Color(0xFF469597), fontSize: 19.7)
                            )
                        )
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        color: Color(0xFFBBC6C8),
                      ),
                      height: isAdmin ? 320 : 450,
                      width: 650,
                      child: Column(
                        children: [
                          isAdmin ? const SizedBox(height: 0) : const SizedBox(height: 40),
                          isAdmin ? Container() : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 75,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 14),
                                  child: Text(('Branches:'), textAlign: TextAlign.left, style: GoogleFonts.getFont('Montserrat', fontWeight: FontWeight.normal, color: const Color(0xFF469597), fontSize: 15)),
                                ),
                              ),
                              const SizedBox(width: 30),
                              Padding(
                                padding: const EdgeInsets.only(top: 0),
                                child: Container(
                                  color: const Color(0xFFE5E3E4),
                                    width: 435,
                                    child: !isAdmin
                                        ? DropdownButton(
                                            style: GoogleFonts.getFont('Open Sans', color: const Color(0xFF86BAB5), fontSize: 14, fontStyle: FontStyle.italic, fontWeight: FontWeight.w600),
                                            alignment: Alignment.center,
                                            isExpanded: true,
                                            value: dropdownvalue,
                                            dropdownColor: const Color(0xFFE5E3E4),
                                            icon: const Icon(Icons.keyboard_arrow_down),
                                            items: branch_loc.map((String items) {
                                              return DropdownMenuItem(
                                                value: items,
                                                alignment: Alignment.centerLeft,
                                                child: Text(items),
                                              );
                                            }).toList(),
                                            onChanged: (newValue) {
                                              setState(() {
                                                dropdownvalue = newValue!;
                                                //updateOrders();
                                              });
                                            },
                                          )
                                        : Container()
                                ),
                              ),
                              /*
                              SizedBox(
                                height: 60,
                                width: 440,
                                child: TextFormField(
                                  cursorColor: Colors.black,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    fillColor: const Color(0xFFE5E3E4),
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
                                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                                    filled: true,
                                    suffixIcon: const Padding(
                                      padding: EdgeInsets.only(left: 0, right: 20),
                                      child: RotatedBox(quarterTurns: 3,child: Icon(Icons.arrow_back_ios_rounded, size: 14, color: Colors.white)),
                                    ),
                                  ),
                                ),
                              ),*/
                            ],
                          ),
                          const SizedBox(height: 40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 130,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 14),
                                  child: Text('E-MAIL', textAlign: TextAlign.left, style: GoogleFonts.getFont('Montserrat', fontWeight: FontWeight.bold, color: const Color(0xFF469597), fontSize: 16.4, letterSpacing: 3)),
                                ),
                              ),
                              const SizedBox(width: 30),
                              SizedBox(
                                height: 60,
                                width: 380,
                                child: TextFormField(
                                  cursorColor: Colors.black,
                                  keyboardType: TextInputType.text,
                                  controller: emailTC,
                                  decoration: InputDecoration(
                                    fillColor: const Color(0xFFE5E3E4),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(0),
                                      borderSide: const BorderSide(
                                          color: Colors.transparent, width: 1
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(0),
                                      borderSide: const BorderSide(
                                          color: Colors.transparent, width: 1
                                      ),
                                    ),
                                    enabledBorder:  OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(0),
                                      borderSide: const BorderSide(
                                          color: Colors.transparent, width: 1
                                      ),
                                    ),
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                                    filled: true,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 130,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 14),
                                  child: Text('PASSWORD', textAlign: TextAlign.left, style: GoogleFonts.getFont('Montserrat', fontWeight: FontWeight.bold, color: const Color(0xFF469597), fontSize: 16.4, letterSpacing: 3)),
                                ),
                              ),
                              const SizedBox(width: 30),
                              SizedBox(
                                height: 60,
                                width: 380,
                                child: TextFormField(
                                  obscureText: true,
                                  enableSuggestions: false,
                                  autocorrect: false,
                                  cursorColor: Colors.black,
                                  keyboardType: TextInputType.text,
                                  controller: passwordTC,
                                  decoration: InputDecoration(
                                    fillColor: const Color(0xFFE5E3E4),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(0),
                                      borderSide: const BorderSide(
                                          color: Colors.transparent, width: 1
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(0),
                                      borderSide: const BorderSide(
                                          color: Colors.transparent, width: 1
                                      ),
                                    ),
                                    enabledBorder:  OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(0),
                                      borderSide: const BorderSide(
                                          color: Colors.transparent, width: 1
                                      ),
                                    ),
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                                    filled: true,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          /*
                          SizedBox(height: 30, width: 560,
                              child: MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: Text(
                                    'Forgot password?',
                                    textAlign: TextAlign.right,
                                    style: GoogleFonts.getFont('Montserrat', fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 12, decoration: TextDecoration.underline, fontStyle: FontStyle.italic),
                                  )
                              )
                          ),*/
                          const SizedBox(height: 30),
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
                                        Navigator.of(context).pop();
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                                        child: Text('Back', textAlign: TextAlign.center, style: GoogleFonts.getFont('Montserrat', fontWeight: FontWeight.normal, color: Colors.white, fontSize: 11)),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 60),
                                  SizedBox(
                                    width: 180,
                                    child: ElevatedButton(
                                      style: const ButtonStyle(
                                          backgroundColor: MaterialStatePropertyAll(Color(0xFF469597)),
                                          shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50))))
                                      ),
                                      onPressed: (){
                                        Map<String, String> cred = AuthService().signIn(emailTC.text, passwordTC.text, widget.session, dropdownvalue);
                                        if(cred.isNotEmpty){
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard(session: cred.keys.first, credential: cred)));
                                        }else{
                                          print('Invalid credentials');
                                        }
                                        resetForm();
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                                        child: Text('Log in', textAlign: TextAlign.center, style: GoogleFonts.getFont('Montserrat', fontWeight: FontWeight.normal, color: Colors.white, fontSize: 11)),
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
        )
    );
  }
}