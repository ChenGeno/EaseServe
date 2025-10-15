import 'package:flutter/material.dart';

import 'scan_icon.dart';

class ScanValidationPage extends StatelessWidget {
  const ScanValidationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F8),
      body: SafeArea(
        child: Column(
          children: [
            const _ScanHeader(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: const [
                    _ScanValidationCard(),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
              child: SizedBox(
                height: 48,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2A8BF2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    '验证',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ScanHeader extends StatelessWidget {
  const _ScanHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF2A8BF2), Color(0xFF53A0FD)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(24),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(12, 12, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
          const SizedBox(height: 4),
          const Center(
            child: Text(
              '装箱单验证',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}

class _ScanValidationCard extends StatelessWidget {
  const _ScanValidationCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Color(0x11000000),
            blurRadius: 10,
            offset: Offset(0, 6),
          ),
        ],
      ),
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          Text(
            '装箱单验证',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1B1D1F),
            ),
          ),
          SizedBox(height: 18),
          _ScanInputRow(
            label: '主机号',
            placeholder: '主机号',
            showDivider: true,
          ),
          _ScanInputRow(
            label: '部件条码',
            placeholder: '部件条码',
            showDivider: false,
          ),
        ],
      ),
    );
  }
}

class _ScanInputRow extends StatelessWidget {
  final String label;
  final String placeholder;
  final bool showDivider;

  const _ScanInputRow({
    required this.label,
    required this.placeholder,
    required this.showDivider,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 72,
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF5B6574),
                ),
              ),
            ),
            Expanded(
              child: Text(
                placeholder,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFFBAC2CF),
                ),
              ),
            ),
            Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                color: const Color(0xFFE8F0FF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: ScanIcon(size: 16, color: Color(0xFF2A8BF2)),
              ),
            ),
          ],
        ),
        if (showDivider)
          Container(
            margin: const EdgeInsets.symmetric(vertical: 12),
            height: 1,
            color: const Color(0xFFE8EDF5),
          )
        else
          const SizedBox(height: 12),
      ],
    );
  }
}
