import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _ProfileHeader(),
        Expanded(
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: const _ProfileMenu(),
          ),
        ),
      ],
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF3C8BFF), Color(0xFF1581FF)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(24),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(24, 18, 24, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              const _MockStatusBar(),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.settings_outlined, color: Colors.white),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 28),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 86,
                width: 86,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(48),
                ),
                padding: const EdgeInsets.all(16),
                child: const Icon(
                  Icons.engineering,
                  color: Color(0xFF1581FF),
                  size: 40,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                '陈昊炜',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Text(
                  '编号 FSR000190',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MockStatusBar extends StatelessWidget {
  const _MockStatusBar();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(Icons.access_time, color: Colors.white70, size: 16),
        SizedBox(width: 4),
        Text(
          '18:25',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        SizedBox(width: 12),
        Icon(Icons.navigation, color: Colors.white70, size: 16),
      ],
    );
  }
}

class _ProfileMenu extends StatelessWidget {
  const _ProfileMenu();

  @override
  Widget build(BuildContext context) {
    const items = [
      _ProfileMenuItemData(
        icon: Icons.badge_outlined,
        iconColor: Color(0xFF2A8BF2),
        title: '电子工牌',
      ),
      _ProfileMenuItemData(
        icon: Icons.message_outlined,
        iconColor: Color(0xFF4A90E2),
        title: '消息中心',
      ),
      _ProfileMenuItemData(
        icon: Icons.local_florist_outlined,
        iconColor: Color(0xFFE67E22),
        title: '点评',
      ),
      _ProfileMenuItemData(
        icon: Icons.fact_check_outlined,
        iconColor: Color(0xFF5C6BC0),
        title: '我要吐槽',
      ),
      _ProfileMenuItemData(
        icon: Icons.help_outline,
        iconColor: Color(0xFF26A69A),
        title: '常见问题',
      ),
      _ProfileMenuItemData(
        icon: Icons.info_outline,
        iconColor: Color(0xFF2ECC71),
        title: '关于',
      ),
    ];
    return Column(
      children: [
        const SizedBox(height: 12),
        for (var i = 0; i < items.length; i++) ...[
          _ProfileMenuItem(item: items[i]),
          const Divider(height: 1, color: Color(0xFFEAEAEA)),
        ],
      ],
    );
  }
}

class _ProfileMenuItemData {
  final IconData icon;
  final Color iconColor;
  final String title;

  const _ProfileMenuItemData({
    required this.icon,
    required this.iconColor,
    required this.title,
  });
}

class _ProfileMenuItem extends StatelessWidget {
  final _ProfileMenuItemData item;

  const _ProfileMenuItem({required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18),
        child: Row(
          children: [
            Container(
              height: 36,
              width: 36,
              decoration: BoxDecoration(
                color: item.iconColor.withOpacity(0.12),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(item.icon, color: item.iconColor),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                item.title,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFF1B1D1F),
                ),
              ),
            ),
            const Icon(Icons.chevron_right, color: Color(0xFFCDD1D8)),
          ],
        ),
      ),
    );
  }
}
