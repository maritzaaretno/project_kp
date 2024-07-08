import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DailyReportController {
  final String userId;
  final FlutterSecureStorage secureStorage;

  DailyReportController(this.userId, this.secureStorage);

  Future<String?> _getToken() async {
    return await secureStorage.read(key: 'access_token');
  }

  Future<Map<String, dynamic>?> getDailyTransactions(DateTime date) async {
    final dio = Dio();
    final url = 'https://33c8-114-5-110-243.ngrok-free.app/api/daily-report/transaction-by-day';

    print('Fetching daily transactions from: $url');
    print('Date: ${date.toIso8601String().substring(0, 10)}');

    try {
      final token = await _getToken();
      if (token == null) {
        print('Error: No token found');
        return null;
      }
      print('Token: $token');

      final response = await dio.get(
        url,
        queryParameters: {
          'user_id': userId,
          'date': date.toIso8601String().substring(0, 10),
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );

      print('Response status: ${response.statusCode}');
      print('Response data: ${response.data}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data as Map<String, dynamic>;
        print('Response Data: $responseData');

        final List<dynamic> incomes = responseData['incomes'] ?? [];
        final List<dynamic> expenses = responseData['expenses'] ?? [];

        List<Map<String, dynamic>> incomeList = incomes.map((income) {
          return {
            'title': income['name'],
            'date': income['date_time'],
            'amount': double.tryParse(income['amount'].toString()) ?? 0.0,
            'color': Colors.green,
          };
        }).toList();

        List<Map<String, dynamic>> expenseList = expenses.map((expense) {
          return {
            'title': expense['name'],
            'date': expense['date_time'],
            'amount': double.tryParse(expense['amount'].toString()) ?? 0.0,
            'color': Colors.red,
          };
        }).toList();

        Map<String, dynamic> dailyTransactions = {
          'income': incomeList,
          'expense': expenseList,
        };

        print('Parsed Daily Transactions: $dailyTransactions');
        return dailyTransactions;
      } else {
        print('Failed to fetch data');
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  Future<Map<String, double>?> getTotalIncomesAndExpenses() async {
    final dio = Dio();
    final url = 'https://33c8-114-5-110-243.ngrok-free.app/api/daily-report/totals-incomes-expanse';

    print('Fetching total incomes and expenses from: $url');

    try {
      final token = await _getToken();
      if (token == null) {
        print('Error: No token found');
        return null;
      }
      print('Token: $token');

      final response = await dio.get(
        url,
        queryParameters: {
          'user_id': userId,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );

      print('Response status: ${response.statusCode}');
      print('Response data: ${response.data}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data as Map<String, dynamic>;
        print('Response Data: $responseData');

        double totalIncome = double.tryParse(responseData['total_income'].toString()) ?? 0.0;
        double totalExpense = double.tryParse(responseData['total_expense'].toString()) ?? 0.0;

        Map<String, double> totals = {
          'income': totalIncome,
          'expense': totalExpense,
        };

        print('Parsed Totals: $totals');
        return totals;
      } else {
        print('Failed to fetch data');
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}
