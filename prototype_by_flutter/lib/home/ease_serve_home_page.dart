import 'package:flutter/material.dart';

import '../ai_helper/ai_helper_view.dart';
import '../community/community_view.dart';
import '../profile/profile_view.dart';
import '../study/study_view.dart';
import '../work_orders/work_orders_view.dart';

class EaseServeHomePage extends StatefulWidget {
  const EaseServeHomePage({super.key});

  @override
  State<EaseServeHomePage> createState() => _EaseServeHomePageState();
}

class _EaseServeHomePageState extends State<EaseServeHomePage> {
  int _selectedIndex = 0;

  Color get _scaffoldColor {
    if (_selectedIndex == 1) {
      return const Color(0xFFF6F7FB);
    }
    return const Color(0xFFF5F6F8);
  }

  Widget _buildBody() {
    switch (_selectedIndex) {
      case 0:
        return const WorkOrdersView();
      case 1:
        return const AiHelperView();
      case 2:
        return const StudyView();
      case 3:
        return const CommunityView();
      case 4:
        return const ProfileView();
      default:
        return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _scaffoldColor,
      body: SafeArea(
        child: _buildBody(),
      ),
      bottomNavigationBar: EaseServeBottomNav(
        currentIndex: _selectedIndex,
        onTap: (value) => setState(() => _selectedIndex = value),
      ),
    );
  }
}

class EaseServeBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const EaseServeBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      selectedItemColor: const Color(0xFF2A8BF2),
      unselectedItemColor: const Color(0xFF9AA3B1),
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
      unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
      showUnselectedLabels: true,
      currentIndex: currentIndex,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.assignment_outlined),
          label: '工单',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.smart_toy_outlined),
          label: 'AI助理',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu_book_outlined),
          label: '学习',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.forum_outlined),
          label: '社区',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: '我的',
        ),
      ],
    );
  }
}
