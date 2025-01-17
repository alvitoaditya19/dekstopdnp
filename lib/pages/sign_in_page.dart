// part of 'pages.dart';

// class SignInPage extends StatefulWidget {
//   @override
//   _SignInPageState createState() => _SignInPageState();
// }

// class _SignInPageState extends State<SignInPage> {
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   AutovalidateMode _autoValidate = AutovalidateMode.disabled;

//    DatabaseReference _databaseReference =
//       FirebaseDatabase.instance.reference().child('izin_signup');

//   bool isEmailValid = false;
//   bool isPasswordValid = false;
//   bool isSigningIn = false;
//   bool _isObscure = true;

//   bool shouldPop = false;
//   @override
//   Widget build(BuildContext context) {
//     Widget title() {
//       return Container(
//         margin: EdgeInsets.only(
//           top: defaultMargin,
//         ),
//         child: Text(
//           'Mohon untuk memasukan akun yang terdaftar',
//           style: blackTextStyle.copyWith(
//             fontSize: 24,
//             fontWeight: semiBold,
//           ),
//         ),
//       );
//     }

//     Widget inputSection() {
//       Widget emailInput() {
//         return Container(
//           margin: EdgeInsets.only(bottom: 20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Alamat Email',
//                 style: blackTextStyle,
//               ),
//               SizedBox(
//                 height: 6,
//               ),
//               TextFormField(
//                 onChanged: (text) {
//                   setState(() {
//                     isEmailValid = EmailValidator.validate(text);
//                   });
//                 },
//                 controller: emailController,
//                 cursorColor: blackColor,
//                 decoration: InputDecoration(
//                   hintText: 'Alamat Email',
//                   hintStyle: blackTextStyle.copyWith(
//                     fontSize: 16,
//                   ),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(
//                       defaultRadius,
//                     ),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(
//                       defaultRadius,
//                     ),
//                     borderSide: BorderSide(
//                       width: 2,
//                       color: blueColor,
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         );
//       }

//       Widget passwordInput() {
//         return Container(
//           margin: EdgeInsets.only(bottom: 32),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Kata Sandi',
//                 style: blackTextStyle,
//               ),
//               SizedBox(
//                 height: 6,
//               ),
//               TextFormField(
//                 onChanged: (text) {
//                   setState(() {
//                     isPasswordValid = text.length >= 6;
//                   });
//                 },
//                 controller: passwordController,
//                 cursorColor: blackColor,
//                 obscureText: _isObscure,
//                 decoration: InputDecoration(
//                     hintText: 'Kata Sandi',
//                     hintStyle: blackTextStyle.copyWith(
//                       fontSize: 16,
//                     ),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(
//                         defaultRadius,
//                       ),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(
//                         defaultRadius,
//                       ),
//                       borderSide: BorderSide(
//                         width: 2,
//                         color: blueColor,
//                       ),
//                     ),
//                     suffixIcon: IconButton(
//                         icon: Icon(_isObscure
//                             ? Icons.visibility_off
//                             : Icons.visibility),
//                         onPressed: () {
//                           setState(() {
//                             _isObscure = !_isObscure;
//                           });
//                         })),
//               )
//             ],
//           ),
//         );
//       }

//       Widget signInButton() {
//         return Container(
//           height: 55,
//           width: double.infinity,
//           margin: EdgeInsets.only(bottom: 32),
//           child: isSigningIn
//               ? SpinKitFadingCircle(
//                   color: blueColor,
//                 )
//               : TextButton(
//                   onPressed: isEmailValid && isPasswordValid
//                       ? () async {
//                           setState(() {
//                             isSigningIn = true;
//                           });

//                           SignInSignUpResult result = await AuthServices.signIn(
//                               emailController.text, passwordController.text);

//                           if (result.user == null) {
//                             setState(() {
//                               isSigningIn = false;
//                             });

//                             Flushbar(
//                               duration: Duration(seconds: 4),
//                               flushbarPosition: FlushbarPosition.TOP,
//                               backgroundColor: Color(0xFFFF5C83),
//                               message: result.message,
//                             )..show(context);
//                           }
//                         }
//                       : null,
//                   style: TextButton.styleFrom(
//                     backgroundColor: blueColor,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(defaultRadius),
//                     ),
//                   ),
//                   child: Text(
//                     'Masuk',
//                     style: whiteTextStyle.copyWith(
//                       fontWeight: medium,
//                       fontSize: 18,
//                     ),
//                   ),
//                 ),
//         );
//       }
//   Widget optionButton() {
//     return Container(
//       margin: EdgeInsets.only(bottom: 30),
//       child: StreamBuilder(
//         stream: _databaseReference.onValue,
//         builder: (context, snapshot) {
//           if (snapshot.hasData && snapshot.data!.snapshot.value != null) {
//             String izin = snapshot.data!.snapshot.value.toString();

//             return izin.toLowerCase() == 'yes'
//                 ? Row(
//                     children: [
//                       Text(
//                         'Kamu belum punya akun?',
//                         style: blackTextStyle.copyWith(
//                           fontWeight: medium,
//                           fontSize: 14,
//                         ),
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           context
//                               .read<PageBloc>()
//                               .add(GoToRegistrationPage(RegistrationData()));
//                         },
//                         child: Text(
//                           ' Daftar disini!',
//                           style: blueTextStyle.copyWith(
//                             fontWeight: medium,
//                             fontSize: 14,
//                           ),
//                         ),
//                       ),
//                     ],
//                   )
//                 : Column(
//                     children: [
                     
//                     ],
//                   );
//           } else {
//             return Container(); // Menampilkan widget kosong atau indikator loading jika data belum ada
//           }
//         },
//       ),
//     );
//   }

//       return Container(
//         margin: EdgeInsets.only(
//           top: 30,
//         ),
//         padding: EdgeInsets.symmetric(
//           horizontal: 20,
//           vertical: 30,
//         ),
//         decoration: BoxDecoration(
//             color: whiteColor,
//             borderRadius: BorderRadius.circular(
//               defaultRadius,
//             )),
//         child: Column(
//           children: [
//             emailInput(),
//             passwordInput(),
//             signInButton(),
//             optionButton(),

//           ],
//         ),
//       );
//     }

//     return WillPopScope(
//       onWillPop: () async {
//         context.read<PageBloc>().add(GoToSplashPage());

//         return shouldPop;
//       },
//       child: Scaffold(
//         backgroundColor: backgroundColor,
//         body: SafeArea(
//           child: ListView(
//             padding: EdgeInsets.symmetric(
//               horizontal: defaultMargin,
//             ),
//             children: [
//               title(),
//               inputSection(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
