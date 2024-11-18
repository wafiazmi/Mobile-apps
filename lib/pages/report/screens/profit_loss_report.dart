import 'package:flutter/material.dart';

class ProfitLossReport extends StatelessWidget {
  const ProfitLossReport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Laporan Laba Rugi'),
        actions: const [
          Icon(Icons.info_outline),
          SizedBox(width: 8),
          Icon(Icons.file_copy_outlined),
          SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Date Selector
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Hari Ini'),
                  Icon(Icons.keyboard_arrow_down),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Checkbox option
            Row(
              children: [
                Checkbox(
                  value: false,
                  onChanged: (value) {},
                ),
                const Expanded(
                  child: Text('Tampilkan Pemasukan Sebelum Piutang dibayar'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Summary Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  _buildSummaryRow('Total Pemasukan', 'Total Pengeluaran'),
                  _buildAmountRow('Rp 0', 'Rp 0', true),
                  const Divider(),
                  _buildSummaryRow('Penjualan', 'Harga Pokok Penjualan'),
                  _buildAmountRow('Rp 0', 'Rp 0', true),
                  const Divider(),
                  _buildSummaryRow('Pemasukan Lain', 'Pengeluaran Lain'),
                  _buildAmountRow('Rp 0', 'Rp 0', true),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Net Profit
            Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Column(
                children: [
                  Text(
                    'Rp 0',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('Laba bersih'),
                ],
              ),
            ),
            const Expanded(
              child: Center(
                child: Text(
                  'There is no data in this time range.\nChoose another timeframe or download your data here.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            // Sync Button
            Padding(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade50,
                  foregroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  minimumSize: const Size(double.infinity, 48),
                ),
                child: const Text('Synchronize?'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String left, String right) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(left),
        Text(right),
      ],
    );
  }

  Widget _buildAmountRow(String left, String right, bool colored) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          left,
          style: TextStyle(
            color: colored ? Colors.green : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          right,
          style: TextStyle(
            color: colored ? Colors.red : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}