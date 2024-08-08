// part of 'pages.dart';

// class ChangeMachineCondition extends StatefulWidget {
//   ChangeMachineCondition({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   State<ChangeMachineCondition> createState() => _ChangeMachineConditionState();
// }

// class _ChangeMachineConditionState extends State<ChangeMachineCondition> {
//     final _formKey = GlobalKey<FormState>();
//   final _scaffoldKey = GlobalKey<ScaffoldState>();

//   TextEditingController nameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController mobileNoController = TextEditingController();
//   TextEditingController feedbackController = TextEditingController();
//     void _submitForm() {
//     if (_formKey.currentState?.validate() ?? false) {
//       FeedbackForm feedbackForm = FeedbackForm(
//         nameController.text,
//         emailController.text,
//         mobileNoController.text,
//         feedbackController.text,
//       );

//       FormController formController = FormController();

//       _showSnackbar("Submitting Feedback");

//       formController.submitForm(feedbackForm, (String response) {
//         print("Response: $response");
//         if (response == FormController.STATUS_SUCCESS) {
//           _showSnackbar("Feedback Submitted");
//         } else {
//           _showSnackbar("Error Occurred!");
//         }
//       });
//     }
//   }
//     _showSnackbar(String message) {
//     final snackBar = SnackBar(content: Text(message));
//     _scaffoldKey.currentState?.showSnackBar(snackBar);
//   }
//  @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: <Widget>[
//             Form(
//               key: _formKey,
//               child: Padding(
//                 padding: EdgeInsets.all(16),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     TextFormField(
//                       controller: nameController,
//                       validator: (value) {
//                         if (value?.isEmpty ?? true) {
//                           return 'Enter Valid Name';
//                         }
//                         return null;
//                       },
//                       decoration: InputDecoration(labelText: 'Name'),
//                     ),
//                     TextFormField(
//                       controller: emailController,
//                       validator: (value) {
//                         if (!(value?.contains("@") ?? false)) {
//                           return 'Enter Valid Email';
//                         }
//                         return null;
//                       },
//                       keyboardType: TextInputType.emailAddress,
//                       decoration: InputDecoration(labelText: 'Email'),
//                     ),
//                     TextFormField(
//                       controller: mobileNoController,
//                       validator: (value) {
//                         if ((value?.trim().length ?? 0) != 10) {
//                           return 'Enter 10 Digit Mobile Number';
//                         }
//                         return null;
//                       },
//                       keyboardType: TextInputType.number,
//                       decoration: InputDecoration(
//                         labelText: 'Mobile Number',
//                       ),
//                     ),
//                     TextFormField(
//                       controller: feedbackController,
//                       validator: (value) {
//                         if (value?.isEmpty ?? true) {
//                           return 'Enter Valid Feedback';
//                         }
//                         return null;
//                       },
//                       keyboardType: TextInputType.multiline,
//                       decoration: InputDecoration(labelText: 'Feedback'),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 primary: Colors.blue,
//                 onPrimary: Colors.white,
//               ),
//               onPressed: _submitForm,
//               child: Text('Submit Feedback'),
//             ),
//           ],
//         ),
//       ),
//     );
// }



