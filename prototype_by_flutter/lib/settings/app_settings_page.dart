import 'package:flutter/material.dart';

import 'about_page.dart';

class AppSettingsPage extends StatelessWidget {
  const AppSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F8),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const _SettingsHeader(),
            const SizedBox(height: 12),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    _SettingsCard(
                      items: [
                        const _SettingsRowData(
                          title: '导航地图设置',
                          subtitle: '尚未选择',
                        ),
                        const _SettingsRowData(
                          title: '服务信息同步',
                          subtitle: '始终',
                        ),
                        _SettingsRowData(
                          title: '关于',
                          subtitle: '',
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => const AboutPage(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
            const _LogoutButton(),
          ],
        ),
      ),
    );
  }
}

class _SettingsHeader extends StatelessWidget {
  const _SettingsHeader();

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
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const _StatusBarTime(),
              Row(
                children: const [
                  Icon(Icons.signal_cellular_alt,
                      color: Colors.white, size: 18),
                  SizedBox(width: 6),
                  Icon(Icons.wifi, color: Colors.white, size: 18),
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
                  '设置',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
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

class _StatusBarTime extends StatelessWidget {
  const _StatusBarTime();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Text(
          '17:15',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(width: 8),
        Icon(Icons.volume_off, color: Colors.white, size: 18),
      ],
    );
  }
}

class _SettingsRowData {
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  const _SettingsRowData({
    required this.title,
    required this.subtitle,
    this.onTap,
  });
}

class _SettingsCard extends StatelessWidget {
  final List<_SettingsRowData> items;

  const _SettingsCard({required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0C000000),
            blurRadius: 16,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          for (var i = 0; i < items.length; i++) ...[
            _SettingsRow(data: items[i]),
            if (i != items.length - 1)
              Divider(
                height: 1,
                color: const Color(0xFFE9EDF5),
                indent: 20,
                endIndent: 20,
              ),
          ],
        ],
      ),
    );
  }
}

class _SettingsRow extends StatelessWidget {
  final _SettingsRowData data;

  const _SettingsRow({required this.data});

  @override
  Widget build(BuildContext context) {
    final hasSubtitle = data.subtitle.trim().isNotEmpty;

    return InkWell(
      onTap: data.onTap,
      borderRadius: BorderRadius.circular(22),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF384250),
                    ),
                  ),
                ],
              ),
            ),
            if (hasSubtitle)
              Text(
                data.subtitle,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF8A94A6),
                  fontWeight: FontWeight.w500,
                ),
              ),
            const SizedBox(width: 8),
            const Icon(Icons.arrow_forward_ios,
                size: 16, color: Color(0xFFCBD3E1)),
          ],
        ),
      ),
    );
  }
}

class _LogoutButton extends StatelessWidget {
  const _LogoutButton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
            side: const BorderSide(color: Color(0xFFEB5757)),
          ),
        ),
        child: const Text(
          '退出登录',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Color(0xFFEB5757),
          ),
        ),
      ),
    );
  }
}
