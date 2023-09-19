// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../bloc/auth/login/login_event.dart';
//
//
//
// class LoginPage extends StatelessWidget {
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     final authBloc = BlocProvider.of<AuthBloc>(context);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Login Page'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             TextField(
//               controller: _usernameController,
//               decoration: InputDecoration(labelText: 'Username'),
//             ),
//             TextField(
//               controller: _passwordController,
//               decoration: InputDecoration(labelText: 'Password'),
//               obscureText: true,
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 final username = _usernameController.text;
//                 final password = _passwordController.text;
//
//                 authBloc.add(LoginEvent(username: "kminchelle", password: "0lelplR"));
//               },
//               child: Text('Login'),
//             ),
//             BlocBuilder<AuthBloc, AuthState>(
//               builder: (context, state) {
//                 if (state is AuthenticatedState) {
//                   return Text('Logged in as ${state.username}');
//                 } else if (state is UnauthenticatedState) {
//                   return Text('Not logged in');
//                 }
//                 return SizedBox.shrink();
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
// // import 'package:flutter/material.dart';
// //
// // class LoginForm extends StatelessWidget {
// //   LoginForm({super.key});
// //   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.blue.shade50,
// //       appBar: AppBar(
// //         automaticallyImplyLeading: false,
// //         title: const Text("Login Page"),
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(15.0),
// //         child: Form(
// //           key: _formKey,
// //           child: Column(
// //             mainAxisAlignment: MainAxisAlignment.start,
// //             crossAxisAlignment: CrossAxisAlignment.center,
// //             children: <Widget>[
// //               const SizedBox(
// //                 height: 10,
// //               ),
// //               const FlutterLogo(
// //                 size: 150,
// //               ),
// //               const SizedBox(
// //                 height: 20,
// //               ),
// //               Container(
// //                 margin: const EdgeInsets.symmetric(vertical: 10),
// //                 child: TextFormField(
// //                   validator: (v) {
// //                     if (v == null || v.isEmpty) {
// //                       return "Required";
// //                     }
// //                     return null;
// //                   },
// //                   decoration: InputDecoration(
// //                     labelText: 'Username',
// //                     fillColor: Colors.white,
// //                     filled: true,
// //                     prefixIcon: const Icon(Icons.person),
// //                     border: OutlineInputBorder(
// //                         borderRadius: BorderRadius.circular(10)),
// //                   ),
// //                 ),
// //               ),
// //               Container(
// //                 margin: const EdgeInsets.symmetric(vertical: 10),
// //                 child: TextFormField(
// //                   obscureText: true,
// //                   validator: (v) {
// //                     if (v == null || v.isEmpty) {
// //                       return "Required";
// //                     }
// //                     return null;
// //                   },
// //                   decoration: InputDecoration(
// //                     fillColor: Colors.white,
// //                     filled: true,
// //                     prefixIcon: const Icon(Icons.person),
// //                     border: OutlineInputBorder(
// //                         borderRadius: BorderRadius.circular(10)),
// //                     labelText: 'Password',
// //                   ),
// //                 ),
// //               ),
// //               const SizedBox(height: 20),
// //               Container(
// //                 constraints: const BoxConstraints(
// //                   maxWidth: double.infinity,
// //                 ),
// //                 child: SizedBox(
// //                   height: 55,
// //                   child: ElevatedButton(
// //                     style: ButtonStyle(
// //                         splashFactory: NoSplash.splashFactory,
// //                         elevation: MaterialStateProperty.all<double>(0),
// //                         padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
// //                             const EdgeInsets.all(0)),
// //                         backgroundColor: MaterialStateProperty.all<Color>(
// //                             Colors.transparent),
// //                         shape:
// //                             MaterialStateProperty.all<RoundedRectangleBorder>(
// //                           const RoundedRectangleBorder(
// //                             borderRadius: BorderRadius.all(Radius.circular(8)),
// //                           ),
// //                         )),
// //                     onPressed: () {
// //                       if (_formKey.currentState!.validate()) {}
// //                     },
// //                     child: Ink(
// //                       decoration: BoxDecoration(
// //                           color: Colors.blue,
// //                           borderRadius: BorderRadius.circular(8.0)),
// //                       child: Container(
// //                         alignment: Alignment.center,
// //                         padding: const EdgeInsets.all(8),
// //                         child: const Text(
// //                           "Login",
// //                           maxLines: 1,
// //                           overflow: TextOverflow.ellipsis,
// //                           textAlign: TextAlign.center,
// //                           style: TextStyle(
// //                             color: Colors.white,
// //                             fontSize: 16,
// //                             fontWeight: FontWeight.w600,
// //                           ),
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
