// import 'package:flutter/material.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import '../auth/controller/login_controller.dart';
// import '../widgets/button_card.dart';
// import '../theme/text_theme.dart';
// import 'controller/monthly_report_controller.dart';
// import 'detail_report.dart'; // Pastikan import halaman DetailReportScreen
//
// class MonthlyReportScreen extends StatefulWidget {
//   final String userId;
//
//   MonthlyReportScreen({required this.userId});
//
//   @override
//   _MonthlyReportScreenState createState() => _MonthlyReportScreenState();
// }
//
// class _MonthlyReportScreenState extends State<MonthlyReportScreen> {
//   late final MonthlyReportController _controller;
//   List<Map<String, dynamic>>? _monthlyReports;
//
//   @override
//   void initState() {
//     super.initState();
//     print('MonthlyReportScreen UserId: ${widget.userId}');
//     _controller = MonthlyReportController(const FlutterSecureStorage());
//     _fetchMonthlyReports();
//   }
//
//   Future<void> _fetchMonthlyReports() async {
//     try {
//       final reports = await _controller.getMonthlyReport(widget.userId);
//       if (mounted) {
//         setState(() {
//           _monthlyReports = reports;
//         });
//       }
//     } catch (e) {
//       print('Error fetching monthly reports: $e');
//       // Handle error, e.g., show error message to the user
//     }
//   }
//
//   // Fungsi untuk mengonversi nama bulan menjadi angka bulan
//   int convertMonthNameToNumber(String monthName) {
//     Map<String, int> monthMap = {
//       'January': 1,
//       'February': 2,
//       'March': 3,
//       'April': 4,
//       'May': 5,
//       'June': 6,
//       'July': 7,
//       'August': 8,
//       'September': 9,
//       'October': 10,
//       'November': 11,
//       'December': 12,
//     };
//
//     return monthMap[monthName] ?? 1; // Default ke Januari jika tidak ditemukan
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Monthly Report'),
//       ),
//       body: _monthlyReports == null
//           ? Center(child: CircularProgressIndicator())
//           : ListView.builder(
//         itemCount: _monthlyReports!.length,
//         itemBuilder: (context, index) {
//           final report = _monthlyReports![index];
//
//           // Konversi nama bulan ke angka bulan
//           int monthInt = convertMonthNameToNumber(report['month']);
//
//           return GestureDetector(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => DetailReport(
//                     loginController: LoginController(),
//                     report: {
//                       'year': report['year'],
//                       'month': monthInt,
//                       'monthName': report['month'], // Sertakan nama bulan
//                     },
//                   ),
//                 ),
//               );
//             },
//             child: Container(
//               margin: EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(10),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.5),
//                     spreadRadius: 1,
//                     blurRadius: 5,
//                     offset: Offset(0, 1),
//                   ),
//                 ],
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           '${report['month']} ${report['year']}',
//                           style: primaryText2.copyWith(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         SizedBox(height: 10),
//                         Row(
//                           mainAxisAlignment:
//                           MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               'Pemasukkan',
//                               style: primaryText2.copyWith(fontSize: 14),
//                             ),
//                             Text(
//                               'Rp ${report['total_income'].toString()}',
//                               style: TextStyle(color: Colors.green),
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 5),
//                         Row(
//                           mainAxisAlignment:
//                           MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               'Pengeluaran',
//                               style: primaryText2.copyWith(fontSize: 14),
//                             ),
//                             Text(
//                               '- Rp ${report['total_expenses'].toString()}',
//                               style: TextStyle(color: Colors.red),
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 5),
//                         Divider(
//                           color: Colors.grey,
//                           thickness: 1,
//                         ),
//                         Row(
//                           mainAxisAlignment:
//                           MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               'Profit',
//                               style: primaryText2.copyWith(fontSize: 14),
//                             ),
//                             Text(
//                               'Rp ${report['remaining_balance'].toString()}',
//                               style: TextStyle(
//                                 color: Colors.green,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   ButtonCard(
//                     buttonText: 'Lihat Detail',
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => //DetailReport(
//                             loginController: LoginController(),
//                             report: {
//                               'year': report['year'],
//                               'month': report['month'],
//                               //'monthName': report['month'], // Sertakan nama bulan
//                             },
//                           ),
//                         ),
//                       );
//                     },
//                     loginController: LoginController(),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
