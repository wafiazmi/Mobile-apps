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
        actions: [
          Row(
            children: [
              const Icon(Icons.sync, size: 20),
              const SizedBox(width: 4),
              Text(
                'Update: ${_getTimeAgo()}',
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(width: 16),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Promotion Banner
            Container(
              height: 150,
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.blue.shade50,
              ),
              child: Stack(
                children: [
                  const Positioned(
                    left: 16,
                    top: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Atur dan Kirim Slip',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Gaji Lebih Mudah\nPakai Pintar HR !',
                          style: TextStyle(
                            fontSize: 16,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 16,
                    top: 16,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade100,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        'Diskon 50%',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Menu Items
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