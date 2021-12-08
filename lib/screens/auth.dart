import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/services/auth.dart';
import 'package:flutter_application_2/domain/myuser.dart';
import 'package:fluttertoast/fluttertoast.dart';

// class AutorizationPage extends StatefulWidget {
//   AutorizationPage({Key? key}) : super(key: key);

//   @override
//   _AutorizationPageState createState() => _AutorizationPageState();
// }

// class _AutorizationPageState extends State<AutorizationPage> {
//   TextEditingController _emailController = TextEditingController();
//   TextEditingController _passwordController = TextEditingController();

//   late String _email;
//   late String _password;
//   bool showLogin = true;

//   AuthServise _authService = AuthServise();

//   Widget _logo() {
//     return Padding(
//         padding: EdgeInsets.only(top: 100),
//         child: Container(
//             child: Align(
//                 child: Text(
//           'MAXFITT',
//           style: TextStyle(
//               fontSize: 45, fontWeight: FontWeight.bold, color: Colors.white),
//         ))));
//   }

//   Widget _input(
//       Icon icon, String hint, TextEditingController controller, bool obscure) {
//     return Container(
//       padding: EdgeInsets.only(left: 20, right: 20),
//       child: TextField(
//         controller: controller,
//         obscureText: obscure,
//         style: TextStyle(fontSize: 20, color: Colors.white),
//         decoration: InputDecoration(
//             hintStyle: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 20,
//                 color: Colors.white30),
//             hintText: hint,
//             focusedBorder: OutlineInputBorder(
//                 borderSide: BorderSide(color: Colors.white, width: 3)),
//             enabledBorder: OutlineInputBorder(
//                 borderSide: BorderSide(color: Colors.white54, width: 1)),
//             prefixIcon: Padding(
//                 padding: EdgeInsets.only(left: 10, right: 10),
//                 child: IconTheme(
//                     data: IconThemeData(color: Colors.white), child: icon))),
//       ),
//     );
//   }

//   Widget _button(String text, void func()) {
//     return ElevatedButton(
//       style: ElevatedButton.styleFrom(
//         primary: Colors.white, // background
//         onPrimary: Theme.of(context).primaryColor,
//       ),
//       child: Text(
//         text,
//         style: TextStyle(
//             fontWeight: FontWeight.bold,
//             color: Theme.of(context).primaryColor,
//             fontSize: 20),
//       ),
//       onPressed: () {
//         func();
//       },
//     );
//   }

//   Widget _form(String label, void func()) {
//     return Container(
//       child: Column(
//         children: <Widget>[
//           Padding(
//               padding: EdgeInsets.only(bottom: 20, top: 10),
//               child:
//                   _input(Icon(Icons.email), 'EMAIL', _emailController, false)),
//           Padding(
//               padding: EdgeInsets.only(bottom: 20),
//               child: _input(
//                   Icon(Icons.lock), 'PASSWORD', _passwordController, true)),
//           SizedBox(
//             height: 20,
//           ),
//           Padding(
//               padding: EdgeInsets.only(left: 20, right: 20),
//               child: Container(
//                   height: 50,
//                   width: MediaQuery.of(context).size.width,
//                   child: _button(label, func)))
//         ],
//       ),
//     );
//   }

//   Future<void> _loginButtonAction() async {
//     _email = _emailController.text;
//     _password = _passwordController.text;

//     if (_email.isEmpty || _password.isEmpty) return;

//     MyUser user = await _authService.signInWithEmailAndPassword(
//         _email.trim(), _password.trim());
//     if (user == null) {
//       Fluttertoast.showToast(
//           msg: "Cant SignIn you! Please check your email/password",
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.CENTER,
//           timeInSecForIosWeb: 1,
//           backgroundColor: Colors.red,
//           textColor: Colors.white,
//           fontSize: 16.0);
//     } else {
//       _emailController.clear();
//       _passwordController.clear();
//     }
//   }

//   Future<void> _registerButtonAction() async {
//     _email = _emailController.text;
//     _password = _passwordController.text;

//     if (_email.isEmpty || _password.isEmpty) return;

//     MyUser user = await _authService.registerWithEmailAndPassword(
//         _email.trim(), _password.trim());
//     if (user == null) {
//       Fluttertoast.showToast(
//           msg: "Cant Register you! Please check your email/password",
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.CENTER,
//           timeInSecForIosWeb: 1,
//           backgroundColor: Colors.red,
//           textColor: Colors.white,
//           fontSize: 16.0);
//     } else {
//       _emailController.clear();
//       _passwordController.clear();
//     }
//   }

//   Widget _bottomWave() {
//     return Expanded(
//       child: Align(
//         child: ClipPath(
//           child: Container(
//             color: Colors.white,
//             height: 300,
//           ),
//           clipper: BottomWaveClipper(),
//         ),
//         alignment: Alignment.bottomCenter,
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Theme.of(context).primaryColor,
//         body: Column(
//           children: <Widget>[
//             Container(
//               child: Text('123'),
//             )
//             //_logo(),
//             // SizedBox(
//             //   height: 100,
//             // ),
//             // (showLogin
//             //     ? Column(
//             //         children: <Widget>[
//             //           _form('LOGIN', _loginButtonAction),
//             //           Padding(
//             //             padding: EdgeInsets.all(10),
//             //             child: GestureDetector(
//             //                 child: Text(
//             //                   'Not registered yet? Register!',
//             //                   style:
//             //                       TextStyle(fontSize: 20, color: Colors.white),
//             //                 ),
//             //                 onTap: () {
//             //                   setState(() {
//             //                     showLogin = false;
//             //                   });
//             //                 }),
//             //           )
//             //         ],
//             //       )
//             //     : Column(
//             //         children: <Widget>[
//             //           _form('REGISTER', _registerButtonAction),
//             //           Padding(
//             //             padding: EdgeInsets.all(10),
//             //             child: GestureDetector(
//             //                 child: Text(
//             //                   'Already registered? Login!',
//             //                   style:
//             //                       TextStyle(fontSize: 20, color: Colors.white),
//             //                 ),
//             //                 onTap: () {
//             //                   setState(() {
//             //                     showLogin = true;
//             //                   });
//             //                 }),
//             //           )
//             //   ],
//             // )),
//             //_bottomWave()
//           ],
//         ));
//   }
// }

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.lineTo(0.0, size.height + 5);
    var secondControlPoint = Offset(size.width - (size.width / 6), size.height);
    var secondEndPoint = Offset(size.width, 0.0);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldCliper) => false;
}

class AutorizationPage extends StatefulWidget {
  AutorizationPage({Key? key}) : super(key: key);

  @override
  _AutorizationPageState createState() => _AutorizationPageState();
}

class _AutorizationPageState extends State<AutorizationPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  late String _email;
  late String _password;
  bool showLogin = true;

  Widget _logo() {
    return const Padding(
        padding: EdgeInsets.only(top: 100),
        child: Align(
            child: Text(
          'MAXFITT',
          style: TextStyle(
              fontSize: 45, fontWeight: FontWeight.bold, color: Colors.white),
        )));
  }

  Widget _input(
      Icon icon, String hint, TextEditingController controller, bool obscure) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: TextField(
        controller: controller,
        obscureText: obscure,
        style: TextStyle(fontSize: 20, color: Colors.white),
        decoration: InputDecoration(
            hintStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white30),
            hintText: hint,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 3)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white54, width: 1)),
            prefixIcon: Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: IconTheme(
                    data: IconThemeData(color: Colors.white), child: icon))),
      ),
    );
  }

  Widget _button(String text, Function func) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.white, // background
        onPrimary: Theme.of(context).primaryColor,
      ),
      child: Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
            fontSize: 20),
      ),
      onPressed: () {
        if (_passwordController.text.length <= 5) {
          print('пароль должен быть длинее 6 символов');
        } else {
          func();
        }
      },
    );
  }

  Widget _form(String label, Function func) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(bottom: 20, top: 10),
              child:
                  _input(Icon(Icons.email), 'EMAIL', _emailController, false)),
          Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: _input(
                  Icon(Icons.lock), 'PASSWORD', _passwordController, true)),
          SizedBox(
            height: 20,
          ),
          Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: _button(label, func)))
        ],
      ),
    );
  }

  Future<void> _loginButtonAction() async {
    _email = _emailController.text;
    _password = _passwordController.text;

    if (_email.isEmpty || _password.isEmpty) return;

    MyUser user = await fbAuth.signInWithEmailAndPassword(
        _email.trim(), _password.trim());
    if (user == null) {
      Fluttertoast.showToast(
          msg: "Cant SignIn you! Please check your email/password",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      _emailController.clear();
      _passwordController.clear();
    }
  }

  Future<void> _registerButtonAction() async {
    _email = _emailController.text;
    _password = _passwordController.text;

    if (_email.isEmpty || _password.isEmpty) return;

    MyUser user = await fbAuth.registerWithEmailAndPassword(
        _email.trim(), _password.trim());
    if (user == null) {
      Fluttertoast.showToast(
          msg: "Cant Register you! Please check your email/password",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      _emailController.clear();
      _passwordController.clear();
    }
  }

  Widget _bottomWave() {
    return Expanded(
      child: Align(
        child: ClipPath(
          child: Container(
            color: Colors.white,
            height: 300,
          ),
          clipper: BottomWaveClipper(),
        ),
        alignment: Alignment.bottomCenter,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          _logo(),
          SizedBox(
            height: 100,
          ),
          (showLogin
              ? Column(
                  children: <Widget>[
                    _form('LOGIN', _loginButtonAction),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: GestureDetector(
                          child: Text(
                            'Not registered yet? Register!',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          onTap: () {
                            setState(() {
                              showLogin = false;
                            });
                          }),
                    )
                  ],
                )
              : Column(
                  children: <Widget>[
                    _form('REGISTER', _registerButtonAction),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: GestureDetector(
                          child: Text(
                            'Already registered? Login!',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          onTap: () {
                            setState(() {
                              showLogin = true;
                            });
                          }),
                    )
                  ],
                )),
          _bottomWave()
        ],
      ),
    );
  }
}
