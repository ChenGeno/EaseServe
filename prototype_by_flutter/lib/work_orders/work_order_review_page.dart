import 'package:flutter/material.dart';

class WorkOrderReviewPage extends StatelessWidget {
  const WorkOrderReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F8),
      body: SafeArea(
        child: Column(
          children: [
            const _ReviewHeader(),
            const SizedBox(height: 12),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(24),
                  ),
                ),
                child: Column(
                  children: const [
                    _ReviewFilters(),
                    Divider(height: 1, color: Color(0xFFE5E9F0)),
                    Expanded(child: _ReviewEmptyState()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ReviewHeader extends StatelessWidget {
  const _ReviewHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 22),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF2A8BF2), Color(0xFF53A0FD)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const _StatusBarMock(time: '18:56'),
              Row(
                children: const [
                  Icon(Icons.network_cell, color: Colors.white, size: 18),
                  SizedBox(width: 6),
                  Icon(Icons.network_wifi, color: Colors.white, size: 18),
                  SizedBox(width: 6),
                  Icon(Icons.battery_full, color: Colors.white, size: 20),
                ],
              ),
            ],
          ),
          const SizedBox(height: 18),
          SizedBox(
            height: 44,
            child: Stack(
              alignment: Alignment.center,
              children: [
                const Text(
                  '点评',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(
                      height: 36,
                      width: 36,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.25),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ReviewFilters extends StatefulWidget {
  const _ReviewFilters();

  @override
  State<_ReviewFilters> createState() => _ReviewFiltersState();
}

class _ReviewFiltersState extends State<_ReviewFilters> {
  String _statusValue = '待回复';
  String _ratingValue = '全部';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '点评(0)',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Color(0xFF1B1D1F),
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: _FilterDropdown<String>(
                  label: '状态',
                  value: _statusValue,
                  items: const ['全部', '待回复', '已回复', '已追评'],
                  onChanged: (value) =>
                      setState(() => _statusValue = value ?? _statusValue),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _FilterDropdown<String>(
                  label: '星级',
                  value: _ratingValue,
                  items: const ['全部', '1-4星', '1星', '2星', '3星', '4星', '5星'],
                  onChanged: (value) =>
                      setState(() => _ratingValue = value ?? _ratingValue),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}

class _FilterDropdown<T> extends StatelessWidget {
  final String label;
  final T value;
  final List<T> items;
  final ValueChanged<T?> onChanged;

  const _FilterDropdown({
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: const Color(0xFFF3F5F8),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xFFE0E6F1)),
          ),
          child: Row(
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 13,
                  color: Color(0xFF7C8797),
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<T>(
                    value: value,
                    icon: const Icon(Icons.keyboard_arrow_down_rounded,
                        size: 18, color: Color(0xFF8C96A4)),
                    elevation: 0,
                    borderRadius: BorderRadius.circular(16),
                    dropdownColor: Colors.white,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF2A8BF2),
                    ),
                    onChanged: onChanged,
                    items: items
                        .map(
                          (item) => DropdownMenuItem<T>(
                            value: item,
                            child: Text(
                              item.toString(),
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF2A8BF2),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ReviewEmptyState extends StatelessWidget {
  const _ReviewEmptyState();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Center(
        child: Text(
          '没有更多内容了',
          style: TextStyle(
            color: Color(0xFFB0B7C3),
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

class _StatusBarMock extends StatelessWidget {
  final String time;

  const _StatusBarMock({required this.time});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          time,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: 8),
        const Icon(Icons.keyboard_arrow_up, color: Colors.white, size: 18),
      ],
    );
  }
}
