class ReportData {
  final String date;
  final int totalTransactions;
  final double profitLoss;
  final double revenue;
  final Map<String, PaymentMethod> paymentMethods;
  final double residualCapital;

  ReportData({
    required this.date,
    required this.totalTransactions,
    required this.profitLoss,
    required this.revenue,
    required this.paymentMethods,
    required this.residualCapital,
  });
}

class PaymentMethod {
  final int count;
  final double amount;

  PaymentMethod({
    required this.count,
    required this.amount,
  });
}