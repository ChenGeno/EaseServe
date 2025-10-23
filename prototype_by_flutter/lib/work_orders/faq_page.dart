import 'package:flutter/material.dart';

class FaqPage extends StatelessWidget {
  const FaqPage({super.key});

  static const _faqs = [
    _FaqItem(icon: Icons.assignment_outlined, title: '如何接单'),
    _FaqItem(icon: Icons.alarm_on_outlined, title: '如何抢单'),
    _FaqItem(icon: Icons.copy_outlined, title: '如何复制客户信息'),
    _FaqItem(icon: Icons.support_agent_outlined, title: '如何寻求支持'),
    _FaqItem(icon: Icons.event_available_outlined, title: '如何改约'),
    _FaqItem(icon: Icons.close_fullscreen_outlined, title: '如何快速关单'),
    _FaqItem(icon: Icons.forum_outlined, title: '如何反馈'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F8),
      body: SafeArea(
        child: Column(
          children: [
            const _FaqHeader(),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(16, 20, 16, 12),
                      child: Text(
                        '常见问题',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF1B1D1F),
                        ),
                      ),
                    ),
                    const Divider(height: 1, color: Color(0xFFE5E9F0)),
                    Expanded(
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        itemCount: _faqs.length,
                        separatorBuilder: (_, __) =>
                            const Divider(indent: 72, height: 1),
                        itemBuilder: (context, index) {
                          final item = _faqs[index];
                          return _FaqTile(item: item);
                        },
                      ),
                    ),
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

class _FaqHeader extends StatelessWidget {
  const _FaqHeader();

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
              const _StatusBarMock(time: '20:06'),
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
                  '帮助',
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

class _FaqItem {
  final IconData icon;
  final String title;

  const _FaqItem({required this.icon, required this.title});
}

class _FaqTile extends StatelessWidget {
  final _FaqItem item;

  const _FaqTile({required this.item});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      leading: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: const Color(0xFFE8F0FF),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(item.icon, color: const Color(0xFF2A8BF2), size: 22),
      ),
      title: Text(
        item.title,
        style: const TextStyle(
          fontSize: 15,
          color: Color(0xFF1B1D1F),
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: const Icon(Icons.chevron_right, color: Color(0xFFB8C0CE)),
      onTap: () {},
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
        const Icon(Icons.volume_off, color: Colors.white, size: 18),
      ],
    );
  }
}
