import 'package:flutter/material.dart';
import 'package:rmpwebapp/dashboard.dart';

class Login extends StatefulWidget {
  final String session;
  const Login({required this.session, Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
            fit: BoxFit.fitWidth,
            child: Container(
              color: Colors.transparent,//const Color(0xFFE5E3E4),
              height: 1200,
              width: 1600,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Center(child: SizedBox(height: 60, width: 600 , child: Text('Sign in to continue', textAlign: TextAlign.center, style: TextStyle(color: Color(0xFF138B7E), fontSize: 26, fontWeight: FontWeight.bold)))),
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        color: Color(0xFFBBC6C8),
                      ),
                      height: 450,
                      width: 650,
                      child: Column(
                        children: [
                          const SizedBox(height: 40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: isAdmin ? 150 : 90,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 14),
                                  child: Text((isAdmin ? 'HQ/Warehouse:' : 'Branches:'), textAlign: TextAlign.left, style: const TextStyle(color: Color(0xFF138B7E), fontSize: 20, fontWeight: FontWeight.w100)),
                                ),
                              ),
                              const SizedBox(width: 30),
                              SizedBox(
                                height: 60,
                                width: isAdmin ? 380 : 440,
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
                              ),
                            ],
                          ),
                          const SizedBox(height: 40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 150,
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 14),
                                  child: Text('USERNAME', textAlign: TextAlign.left, style: TextStyle(color: Color(0xFF138B7E), fontSize: 26, fontWeight: FontWeight.bold)),
                                ),
                              ),
                              const SizedBox(width: 30),
                              SizedBox(
                                height: 60,
                                width: 380,
                                child: TextFormField(
                                  cursorColor: Colors.black,
                                  keyboardType: TextInputType.text,
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
                              const SizedBox(
                                width: 150,
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 14),
                                  child: Text('PASSWORD', textAlign: TextAlign.left, style: TextStyle(color: Color(0xFF138B7E), fontSize: 26, fontWeight: FontWeight.bold)),
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
                          const SizedBox(height: 30, width: 560,
                              child: MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: Text(
                                      'Forgot password?',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(color: Colors.black, decoration: TextDecoration.underline, fontSize: 14, fontWeight: FontWeight.w100, fontStyle: FontStyle.italic)
                                  )
                              )
                          ),
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
                                          backgroundColor: MaterialStatePropertyAll(Color(0xFF138B7E)),
                                          shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50))))
                                      ),
                                      onPressed: (){
                                        Navigator.of(context).pop();
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(vertical: 10.0),
                                        child: Text('Back', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.normal)),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 60),
                                  SizedBox(
                                    width: 180,
                                    child: ElevatedButton(
                                      style: const ButtonStyle(
                                          backgroundColor: MaterialStatePropertyAll(Color(0xFF138B7E)),
                                          shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50))))
                                      ),
                                      onPressed: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard(session: widget.session,)));
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(vertical: 10.0),
                                        child: Text('Log in', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.normal)),
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