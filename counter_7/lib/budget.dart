import 'package:counter_7/form_budget.dart';

class Budget {
  String judul;
  int? nominal;
  String jenis;
  String date;

  Budget(this.judul, this.nominal, this.jenis, this.date);
}

class BudgetStorage {
  static List<Budget> listBudget = [];
}