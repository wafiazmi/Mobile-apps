import 'package:flutter/material.dart';
import '../widgets/report_menu_item.dart' as widget_report;
import 'profit_loss_report.dart';
import 'general_report.dart';

class ReportHome extends StatelessWidget {
  const ReportHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REPORT'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
      
            widget_report.ReportMenuItem(
              icon: Icons.balance,
              title: 'Laporan Laba Rugi',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfitLossReport(),
                ),
              ),
            ),
            const widget_report.ReportMenuItem(
              icon: Icons.account_balance_wallet,
              title: 'Laporan Arus Keuangan',
            ),
            widget_report.ReportMenuItem(
              icon: Icons.assessment,
              title: 'General Report',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const GeneralReport(),
                ),
              ),
            ),
            const widget_report.ReportMenuItem(
              icon: Icons.receipt_long,
              title: 'All Transaction Report',
            ),
            const widget_report.ReportMenuItem(
              icon: Icons.shopping_cart,
              title: 'Sales Reports per Goods',
            ),
            const widget_report.ReportMenuItem(
              icon: Icons.article,
              title: 'PPOB Report',
            ),
            const widget_report.ReportMenuItem(
              icon: Icons.card_giftcard,
              title: 'Laporan Poin',
            ),
            const widget_report.ReportMenuItem(
              icon: Icons.payments,
              title: 'Laporan Cicilan',
            ),
          ],
        ),
      ),
    );
  }

  String _getTimeAgo() {
    return '1 min ago';
  }
}