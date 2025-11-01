import 'package:flutter/material.dart';

import '../settings/about_page.dart';
import '../settings/default_navigation_map_page.dart';
import 'engineer_badge_page.dart';
import 'feedback_page.dart';
import 'host_info_page.dart';
import 'scan_validation_page.dart';
import 'faq_page.dart';
import 'work_order_review_page.dart';

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
            _DrawerProfileHeader(
              onBadgeTap: () => _openBadge(context),
              onBadgeButtonTap: () => _openBadge(context),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    _DrawerSection(
                      title: '常用工具',
                      columns: 3,
                      items: [
                        _DrawerMenuItemData(
                          icon: Icons.desktop_windows_outlined,
                          label: '主机信息',
                          accentColor: const Color(0xFF2A8BF2),
                          onSelected: _openHostInfo,
                        ),
                        _DrawerMenuItemData(
                          icon: Icons.assignment_turned_in_outlined,
                          label: '装箱单验证',
                          accentColor: const Color(0xFF00B8A9),
                          onSelected: _openScanValidation,
                        ),
                        _DrawerMenuItemData(
                          icon: Icons.rate_review_outlined,
                          label: '工单点评',
                          accentColor: const Color(0xFFF2994A),
                          onSelected: _openReview,
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    _DrawerSection(
                      title: '问题与反馈',
                      columns: 2,
                      items: [
                        _DrawerMenuItemData(
                          icon: Icons.help_outline,
                          label: '常见问题',
                          accentColor: const Color(0xFF2A8BF2),
                          onSelected: _openFaq,
                        ),
                        _DrawerMenuItemData(
                          icon: Icons.edit_note_outlined,
                          label: '我要吐槽',
                          accentColor: const Color(0xFFEB5757),
                          onSelected: (context) => _openFeedback(context),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    const _DrawerConfigSection(),
                    const SizedBox(height: 18),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: _LogoutButton(),
            ),
          ],
        ),
      ),
    );
  }
}

class _DrawerProfileHeader extends StatelessWidget {
  final VoidCallback onBadgeTap;
  final VoidCallback onBadgeButtonTap;

  const _DrawerProfileHeader({
    required this.onBadgeTap,
    required this.onBadgeButtonTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GestureDetector(
        onTap: onBadgeTap,
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
                      children: const [
                        Text(
                          '陈昊炜',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 6),
                        Text(
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
                  _DrawerBadgeButton(onTap: onBadgeButtonTap),
                ],
              ),
              const SizedBox(height: 18),
            ],
          ),
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
  final void Function(BuildContext context)? onSelected;

  const _DrawerMenuItemData({
    required this.icon,
    required this.label,
    required this.accentColor,
    this.onSelected,
  });
}

class _DrawerMenuItem extends StatelessWidget {
  final _DrawerMenuItemData data;

  const _DrawerMenuItem({required this.data});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: data.onSelected == null ? null : () => data.onSelected!(context),
        child: Container(
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
        ),
      ),
    );
  }
}

void _openFeedback(BuildContext context) {
  final navigator = Navigator.of(context);
  navigator.pop();
  navigator.push(
    MaterialPageRoute(builder: (_) => const FeedbackPage()),
  );
}

void _openBadge(BuildContext context) {
  final navigator = Navigator.of(context);
  navigator.pop();
  navigator.push(
    MaterialPageRoute(
      builder: (_) => const EngineerBadgePage(
        badge: EngineerBadge(
          name: '陈昊炜',
          badgeId: 'L24118',
          title: '联想服务认证工程师',
          ratingLabel: '新锐工程师',
          serviceCount: 157,
          ratingScore: 4.9,
          experienceYears: 10,
          certifications: ['PC认证资质'],
        ),
      ),
    ),
  );
}

void _openHostInfo(BuildContext context) {
  final navigator = Navigator.of(context);
  navigator.pop();
  navigator.push(
    MaterialPageRoute(builder: (_) => const HostInfoPage()),
  );
}

void _openScanValidation(BuildContext context) {
  final navigator = Navigator.of(context);
  navigator.pop();
  navigator.push(
    MaterialPageRoute(builder: (_) => const ScanValidationPage()),
  );
}

void _openFaq(BuildContext context) {
  final navigator = Navigator.of(context);
  navigator.pop();
  navigator.push(
    MaterialPageRoute(builder: (_) => const FaqPage()),
  );
}

void _openReview(BuildContext context) {
  final navigator = Navigator.of(context);
  navigator.pop();
  navigator.push(
    MaterialPageRoute(builder: (_) => const WorkOrderReviewPage()),
  );
}

void _showPlaceholder(BuildContext context, String label) {
  final navigator = Navigator.of(context);
  final messenger = ScaffoldMessenger.of(context);
  navigator.pop();
  messenger
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text('$label 功能正在建设中'),
        behavior: SnackBarBehavior.floating,
      ),
    );
}

class _DrawerConfigSection extends StatelessWidget {
  const _DrawerConfigSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 18),
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
          const Text(
            '应用配置',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Color(0xFF2A2E39),
            ),
          ),
          const SizedBox(height: 18),
          Row(
            children: const [
              Expanded(
                child: _ConfigTile(
                  icon: Icons.navigation_outlined,
                  label: '默认导航地图',
                  accentColor: Color(0xFF2A8BF2),
                  onTap: _DrawerConfigSection._handleDefaultMap,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: _ConfigTile(
                  icon: Icons.info_outline,
                  label: '关于服务无忧',
                  accentColor: Color(0xFFF2994A),
                  onTap: _DrawerConfigSection._handleAbout,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  static void _handleDefaultMap(BuildContext context) {
    final navigator = Navigator.of(context);
    navigator.pop();
    navigator.push(
      MaterialPageRoute(builder: (_) => const DefaultNavigationMapPage()),
    );
  }

  static void _handleAbout(BuildContext context) {
    final navigator = Navigator.of(context);
    navigator.pop();
    navigator.push(
      MaterialPageRoute(builder: (_) => const AboutPage()),
    );
  }
}

class _ConfigTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final void Function(BuildContext context) onTap;
  final Color accentColor;

  const _ConfigTile({
    required this.icon,
    required this.label,
    required this.onTap,
    this.accentColor = const Color(0xFF2A8BF2),
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => onTap(context),
        borderRadius: BorderRadius.circular(18),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: const Color(0xFFF7F9FE),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: accentColor.withOpacity(0.18)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 46,
                width: 46,
                decoration: BoxDecoration(
                  color: accentColor.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(icon, color: accentColor, size: 24),
              ),
              const SizedBox(height: 10),
              Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF384250),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LogoutButton extends StatelessWidget {
  const _LogoutButton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: () {
          Navigator.of(context).pop();
          final messenger = ScaffoldMessenger.of(context);
          messenger
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                content: Text('已退出登录（示例）'),
                behavior: SnackBarBehavior.floating,
              ),
            );
        },
        icon: const Icon(Icons.logout, color: Color(0xFFEB5757)),
        label: const Text(
          '退出登录',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Color(0xFFEB5757),
          ),
        ),
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: const Color(0xFFEB5757),
          padding: const EdgeInsets.symmetric(vertical: 16),
          side: const BorderSide(color: Color(0xFFEB5757), width: 1.4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      ),
    );
  }
}
