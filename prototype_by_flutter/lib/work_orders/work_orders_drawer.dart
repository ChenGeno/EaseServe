import 'package:flutter/material.dart';

import '../settings/app_settings_page.dart';

class WorkOrdersDrawer extends StatelessWidget {
  const WorkOrdersDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Drawer(
      width: screenWidth * 0.82,
      backgroundColor: const Color(0xFFF6F7FB),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            const _DrawerProfileHeader(),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: const [
                    _DrawerSection(
                      title: '常用工具',
                      columns: 3,
                      items: [
                        _DrawerMenuItemData(
                          icon: Icons.desktop_windows_outlined,
                          label: '主机信息',
                          accentColor: Color(0xFF2A8BF2),
                        ),
                        _DrawerMenuItemData(
                          icon: Icons.assignment_turned_in_outlined,
                          label: '装箱单验证',
                          accentColor: Color(0xFF00B8A9),
                        ),
                        _DrawerMenuItemData(
                          icon: Icons.rate_review_outlined,
                          label: '工单点评',
                          accentColor: Color(0xFFF2994A),
                        ),
                      ],
                    ),
                    SizedBox(height: 18),
                    _DrawerSection(
                      title: '问题与反馈',
                      columns: 2,
                      items: [
                        _DrawerMenuItemData(
                          icon: Icons.help_outline,
                          label: '常见问题',
                          accentColor: Color(0xFF2A8BF2),
                        ),
                        _DrawerMenuItemData(
                          icon: Icons.edit_note_outlined,
                          label: '我要吐槽',
                          accentColor: Color(0xFFEB5757),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: _DrawerSettingsButton(),
            ),
          ],
        ),
      ),
    );
  }
}

class _DrawerProfileHeader extends StatelessWidget {
  const _DrawerProfileHeader();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF2A8BF2), Color(0xFF53A0FD)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 56,
                  width: 56,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white.withOpacity(0.4)),
                  ),
                  child: const CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text(
                      '陈',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF2A8BF2),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '陈昊炜',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        'FSR000190',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                _DrawerBadgeButton(onTap: () {}),
              ],
            ),
            const SizedBox(height: 18),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.16),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: const [
                  Icon(Icons.verified_user_outlined,
                      color: Colors.white, size: 20),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'A级服务工程师 · 已连续服务 128 天',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DrawerBadgeButton extends StatelessWidget {
  final VoidCallback onTap;

  const _DrawerBadgeButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 56,
        width: 56,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.badge_outlined, color: Colors.white, size: 24),
            SizedBox(height: 4),
            Text(
              '工牌',
              style: TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DrawerSection extends StatelessWidget {
  final String title;
  final List<_DrawerMenuItemData> items;
  final int columns;

  const _DrawerSection({
    required this.title,
    required this.items,
    this.columns = 3,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0F000000),
            blurRadius: 18,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Color(0xFF2A2E39),
            ),
          ),
          const SizedBox(height: 18),
          LayoutBuilder(
            builder: (context, constraints) {
              final totalSpacing = 12.0 * (columns - 1);
              final itemWidth = (constraints.maxWidth - totalSpacing) / columns;

              return Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  for (final item in items)
                    SizedBox(
                      width: itemWidth,
                      child: _DrawerMenuItem(data: item),
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _DrawerMenuItemData {
  final IconData icon;
  final String label;
  final Color accentColor;

  const _DrawerMenuItemData({
    required this.icon,
    required this.label,
    required this.accentColor,
  });
}

class _DrawerMenuItem extends StatelessWidget {
  final _DrawerMenuItemData data;

  const _DrawerMenuItem({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F9FE),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: data.accentColor.withOpacity(0.18)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 46,
            width: 46,
            decoration: BoxDecoration(
              color: data.accentColor.withOpacity(0.12),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              data.icon,
              color: data.accentColor,
              size: 24,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            data.label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Color(0xFF384250),
            ),
          ),
        ],
      ),
    );
  }
}

class _DrawerSettingsButton extends StatelessWidget {
  const _DrawerSettingsButton();

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);

    return OutlinedButton(
      onPressed: () {
        navigator.pop();
        navigator.push(
          MaterialPageRoute(
            builder: (_) => const AppSettingsPage(),
          ),
        );
      },
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        side: const BorderSide(color: Color(0xFF2A8BF2)),
      ),
      child: const Text(
        '应用设置',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: Color(0xFF2A8BF2),
        ),
      ),
    );
  }
}
