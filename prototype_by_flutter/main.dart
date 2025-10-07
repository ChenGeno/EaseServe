import 'package:flutter/material.dart';

void main() {
  runApp(const EaseServeApp());
}

class EaseServeApp extends StatelessWidget {
  const EaseServeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EaseServe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF5F6F8),
        fontFamily: 'Roboto',
      ),
      home: const EaseServeHomePage(),
    );
  }
}

class EaseServeHomePage extends StatelessWidget {
  const EaseServeHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F8),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            _HeaderSection(),
            SizedBox(height: 12),
            _ServiceToolsSection(),
            SizedBox(height: 12),
            _QuickActionsSection(),
            SizedBox(height: 16),
            _ProgressIndicatorSection(),
            SizedBox(height: 16),
            Expanded(child: _PlaceholderCard()),
          ],
        ),
      ),
      bottomNavigationBar: const _EaseServeBottomNav(),
    );
  }
}

class _HeaderSection extends StatelessWidget {
  const _HeaderSection();

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
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              _StatusBarMock(),
              Icon(Icons.signal_cellular_alt, color: Colors.white),
            ],
          ),
          const SizedBox(height: 12),
          const Center(
            child: Text(
              '首页',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              _HeaderAction(icon: Icons.assignment_turned_in, label: '接单'),
              _HeaderAction(icon: Icons.task_alt, label: '抢单'),
              _HeaderAction(icon: Icons.support_agent, label: '待办'),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatusBarMock extends StatelessWidget {
  const _StatusBarMock();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(Icons.more_horiz, size: 18, color: Colors.white),
        SizedBox(width: 8),
        Text(
          '21:17',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class _HeaderAction extends StatelessWidget {
  final IconData icon;
  final String label;

  const _HeaderAction({
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            boxShadow: const [
              BoxShadow(
                color: Color(0x332A8BF2),
                blurRadius: 12,
                offset: Offset(0, 6),
              ),
            ],
          ),
          padding: const EdgeInsets.all(18),
          child: Icon(icon, color: const Color(0xFF2A8BF2), size: 28),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class _ServiceToolsSection extends StatelessWidget {
  const _ServiceToolsSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Color(0x11000000),
              blurRadius: 10,
              offset: Offset(0, 6),
            ),
          ],
        ),
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '常用工具',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1B1D1F),
              ),
            ),
            const SizedBox(height: 14),
            GridView.count(
              crossAxisCount: 4,
              mainAxisSpacing: 18,
              crossAxisSpacing: 18,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                _ToolShortcut(icon: Icons.badge, label: '电子工牌'),
                _ToolShortcut(icon: Icons.computer, label: '主机信息'),
                _ToolShortcut(icon: Icons.assignment, label: '接单分派'),
                _ToolShortcut(icon: Icons.qr_code_scanner, label: '装机验证'),
                _ToolShortcut(icon: Icons.help_outline, label: '帮助'),
                _ToolShortcut(icon: Icons.chat_bubble_outline, label: '吐槽'),
                _ToolShortcut(icon: Icons.grid_view, label: '更多'),
                _ToolShortcut(icon: Icons.more_horiz, label: '…'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ToolShortcut extends StatelessWidget {
  final IconData icon;
  final String label;

  const _ToolShortcut({
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 44,
          width: 44,
          decoration: BoxDecoration(
            color: const Color(0xFFE8F2FF),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Icon(icon, color: const Color(0xFF2A8BF2)),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF5B6574),
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _QuickActionsSection extends StatelessWidget {
  const _QuickActionsSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x11000000),
                    blurRadius: 10,
                    offset: Offset(0, 6),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    '待办工单',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1B1D1F),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '今日新增 3 条',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF6F7C8F),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x11000000),
                    blurRadius: 10,
                    offset: Offset(0, 6),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    '预约提醒',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1B1D1F),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '两小时后客户上门',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF6F7C8F),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProgressIndicatorSection extends StatelessWidget {
  const _ProgressIndicatorSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                '本周服务进度',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1B1D1F),
                ),
              ),
              Text(
                '60%',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2A8BF2),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Container(
          height: 5,
          margin: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            color: const Color(0xFFE1E4EB),
            borderRadius: BorderRadius.circular(3),
          ),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: 0.6,
            child: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF2A8BF2), Color(0xFF53A0FD)],
                ),
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _PlaceholderCard extends StatelessWidget {
  const _PlaceholderCard();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFFE8EBF0)),
        ),
        child: const Center(
          child: Text(
            '内容占位区，可填充最新通知或社区动态',
            style: TextStyle(
              color: Color(0xFF8A94A6),
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }
}

class _EaseServeBottomNav extends StatelessWidget {
  const _EaseServeBottomNav();

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      selectedItemColor: const Color(0xFF2A8BF2),
      unselectedItemColor: const Color(0xFF9AA3B1),
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
      unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
      showUnselectedLabels: true,
      currentIndex: 0,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: '首页'),
        BottomNavigationBarItem(icon: Icon(Icons.work_outline), label: '工单'),
        BottomNavigationBarItem(icon: Icon(Icons.forum_outlined), label: '社区'),
        BottomNavigationBarItem(icon: Icon(Icons.school_outlined), label: '学习'),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: '我的'),
      ],
    );
  }
}
