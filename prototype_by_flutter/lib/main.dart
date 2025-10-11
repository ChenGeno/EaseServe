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
        return const _WorkOrdersView();
      case 1:
        return const _AIHelperView();
      case 2:
        return const _StudyView();
      case 3:
        return const _CommunityView();
      case 4:
        return const _PlaceholderView(label: '个人中心开发中');
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
      bottomNavigationBar: _EaseServeBottomNav(
        currentIndex: _selectedIndex,
        onTap: (value) => setState(() => _selectedIndex = value),
      ),
    );
  }
}

class _WorkOrdersView extends StatefulWidget {
  const _WorkOrdersView();

  @override
  State<_WorkOrdersView> createState() => _WorkOrdersViewState();
}

class _WorkOrdersViewState extends State<_WorkOrdersView> {
  int _activeTab = 0;

  Widget _buildBody() {
    switch (_activeTab) {
      case 0:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            _WorkOrderFilters(),
            SizedBox(height: 16),
            _WorkOrderSection(),
          ],
        );
      case 1:
        return const _PlaceholderView(label: '已完成工单内容待补充');
      case 2:
        return const _DispatchListSection();
      default:
        return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _HeaderSection(),
        const SizedBox(height: 12),
        _WorkStatusTabs(
          activeIndex: _activeTab,
          onChanged: (index) => setState(() => _activeTab = index),
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: _buildBody(),
          ),
        ),
      ],
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          _StatusBarRow(),
          SizedBox(height: 18),
          _TitleAndActionsRow(),
        ],
      ),
    );
  }
}

class _StatusBarRow extends StatelessWidget {
  const _StatusBarRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        _HeaderTimeDisplay(),
        _HeaderSignalDisplay(),
      ],
    );
  }
}

class _HeaderTimeDisplay extends StatelessWidget {
  const _HeaderTimeDisplay();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Text(
          '15:15',
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

class _HeaderSignalDisplay extends StatelessWidget {
  const _HeaderSignalDisplay();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(Icons.signal_cellular_alt, color: Colors.white, size: 18),
        SizedBox(width: 6),
        Icon(Icons.wifi, color: Colors.white, size: 18),
        SizedBox(width: 6),
        Icon(Icons.battery_full, color: Colors.white, size: 20),
      ],
    );
  }
}

class _TitleAndActionsRow extends StatelessWidget {
  const _TitleAndActionsRow();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Text(
            '我的工单',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                _HeaderIconButton(icon: Icons.filter_list),
                SizedBox(width: 12),
                _HeaderIconButton(icon: Icons.chat_bubble_outline),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderIconButton extends StatelessWidget {
  final IconData icon;

  const _HeaderIconButton({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      width: 36,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.25),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(icon, color: Colors.white),
    );
  }
}

class _AIHelperView extends StatelessWidget {
  const _AIHelperView();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const _AIHelperAppBar(),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
            child: Column(
              children: const [
                _AIWelcomeCard(),
              ],
            ),
          ),
        ),
        const _AIInputBar(),
      ],
    );
  }
}

class _AIHelperAppBar extends StatelessWidget {
  const _AIHelperAppBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x0F000000),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          const Icon(Icons.menu, color: Color(0xFF1B1D1F)),
          const SizedBox(width: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFE8F0FF),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: const [
                Icon(Icons.smart_toy_outlined, color: Color(0xFF2A8BF2)),
                SizedBox(width: 6),
                Text(
                  'AI助手-渠道发文检索',
                  style: TextStyle(
                    color: Color(0xFF1B1D1F),
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Icon(Icons.expand_more, color: Color(0xFF1B1D1F)),
              ],
            ),
          ),
          const Spacer(),
          Container(
            height: 38,
            width: 38,
            decoration: const BoxDecoration(
              color: Color(0xFFE8F0FF),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.person_outline, color: Color(0xFF1B1D1F)),
          ),
        ],
      ),
    );
  }
}

class _AIWelcomeCard extends StatelessWidget {
  const _AIWelcomeCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Color(0x11000000),
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
        ],
      ),
      padding: const EdgeInsets.fromLTRB(18, 20, 18, 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: const Color(0xFFEEF2FF),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(Icons.smart_toy, color: Color(0xFF5B6CFF)),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      '你好，我是渠道发文检索助手 😃',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1B1D1F),
                        height: 1.5,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '我能访问渠道交付管理平台在2021年-2025年有效的发文内容，不包含KT内容以及发文中非Word附件。已上传的发文内容全集，可点击这里查看。',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF4D5866),
                        height: 1.6,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            '1. 请您输入尽可能完整的问题进行咨询；\n2. 如果你对答案不满意，请点赞并反馈原因和预期反馈信息内容，运营会尽快进行差评分析，以为你提供更好的服务！',
            style: TextStyle(
              fontSize: 13,
              color: Color(0xFF4D5866),
              height: 1.6,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            '示例问题：',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1B1D1F),
            ),
          ),
          const SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              _AIExampleLink(label: '主板保外维修工单类型和子类型要开什么？'),
              _AIExampleLink(label: '服务单撤单注意事项'),
              _AIExampleLink(label: '我的店面这个月开始装修，需要装修3个月，怎么备案呢？'),
            ],
          ),
        ],
      ),
    );
  }
}

class _AIExampleLink extends StatelessWidget {
  final String label;

  const _AIExampleLink({required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '• ',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF2A8BF2),
            ),
          ),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF2A8BF2),
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AIInputBar extends StatelessWidget {
  const _AIInputBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x12000000),
            blurRadius: 12,
            offset: Offset(0, -4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 44,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F6FA),
              borderRadius: BorderRadius.circular(24),
            ),
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '输入问题',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF9AA3B1),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  color: const Color(0xFFE8F0FF),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.link, color: Color(0xFF2A8BF2), size: 18),
                    SizedBox(width: 6),
                    Text(
                      '深度思考',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF2A8BF2),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Container(
                height: 44,
                width: 44,
                decoration: BoxDecoration(
                  color: const Color(0xFF2A8BF2),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(Icons.send, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CommunityView extends StatelessWidget {
  const _CommunityView();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _CommunityHeader(),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: const [
                _CommunityTabBar(),
                SizedBox(height: 16),
                _CommunityHotTopicsCard(),
                SizedBox(height: 16),
                _CommunityPostCard(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _CommunityHeader extends StatelessWidget {
  const _CommunityHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF2A8BF2), Color(0xFF4CA4FF)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(24),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              _HeaderTimeDisplay(),
              _HeaderSignalDisplay(),
            ],
          ),
          const SizedBox(height: 16),
          Stack(
            alignment: Alignment.center,
            children: [
              const Text(
                '社区',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 32,
                      width: 32,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.25),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(Icons.home_outlined,
                          color: Colors.white, size: 18),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 14),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: const [
                Icon(Icons.search, color: Colors.white, size: 20),
                SizedBox(width: 8),
                Text(
                  '搜索',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
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

class _CommunityTabBar extends StatelessWidget {
  const _CommunityTabBar();

  @override
  Widget build(BuildContext context) {
    const tabs = ['热点', '圈说', '不吐不快', '能力提升'];
    return Container(
      padding: const EdgeInsets.only(bottom: 8),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(18)),
        boxShadow: [
          BoxShadow(
            color: Color(0x12000000),
            blurRadius: 10,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          for (var i = 0; i < tabs.length; i++)
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 14, horizontal: 4),
                    child: Text(
                      tabs[i],
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: i == 0 ? FontWeight.w700 : FontWeight.w500,
                        color: i == 0
                            ? const Color(0xFF2A8BF2)
                            : const Color(0xFF8A94A6),
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    height: 3,
                    margin: const EdgeInsets.symmetric(horizontal: 18),
                    decoration: BoxDecoration(
                      color:
                          i == 0 ? const Color(0xFF2A8BF2) : Colors.transparent,
                      borderRadius: BorderRadius.circular(3),
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

class _CommunityHotTopicsCard extends StatelessWidget {
  const _CommunityHotTopicsCard();

  @override
  Widget build(BuildContext context) {
    const topics = [
      '【2024财年长期贡献活动】晒图赢乐豆~',
      '#春秋工装换新活动#',
      '“酷夏无畏、清凉相伴”暑期慰问活动#',
      '「不吐不快」专区#',
      '【长期激励活动】晒图赢乐豆~',
      '#群雄盛战 龙跃云津# 工程师技术大比武活动#',
    ];
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Color(0x11000000),
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
        ],
      ),
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Text(
                '热门话题',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1B1D1F),
                ),
              ),
              Spacer(),
              Icon(Icons.autorenew, color: Color(0xFF2A8BF2), size: 18),
              SizedBox(width: 4),
              Text(
                '换一批',
                style: TextStyle(
                  fontSize: 13,
                  color: Color(0xFF2A8BF2),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          for (final topic in topics)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                topic,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF2A8BF2),
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _CommunityPostCard extends StatelessWidget {
  const _CommunityPostCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Color(0x11000000),
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
        ],
      ),
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFEEF2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.camera_alt_outlined,
                    color: Color(0xFFE63B63)),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      '王玲',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1B1D1F),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '2025-01-16 15:34:13',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF8A94A6),
                      ),
                    ),
                  ],
                ),
              ),
              const Text(
                '来自后台新建',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF8A94A6),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            '#【2024财年长期贡献活动】晒图赢乐豆~#  #【2024财年长期贡献活动】晒图赢乐豆~活动时间：2025年1月16日-1月23日活动方式：智行学院·工程师社区内上传活动相关照片  活动规则：照片清晰，文案富有创意 活动奖...',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF1B1D1F),
              height: 1.6,
            ),
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              height: 140,
              color: const Color(0xFFE8F0FF),
              child: const Center(
                child: Icon(
                  Icons.image,
                  color: Color(0xFF9AA3B1),
                  size: 48,
                ),
              ),
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              _CommunityActionButton(
                icon: Icons.favorite_border,
                label: '赞',
              ),
              const SizedBox(width: 16),
              _CommunityActionButton(
                icon: Icons.mode_comment_outlined,
                label: '评论',
              ),
              const Spacer(),
              Container(
                height: 44,
                width: 44,
                decoration: BoxDecoration(
                  color: const Color(0xFF2A8BF2),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(Icons.edit, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CommunityActionButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const _CommunityActionButton({
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: const Color(0xFF8A94A6), size: 20),
        const SizedBox(width: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            color: Color(0xFF8A94A6),
          ),
        ),
      ],
    );
  }
}

class _StudyView extends StatelessWidget {
  const _StudyView();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const _StudyHeader(),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                _StudySearchBar(),
                SizedBox(height: 20),
                _StudyCategoryLabels(),
                SizedBox(height: 12),
                _StudyCategoryChips(),
                SizedBox(height: 24),
                _StudySection(
                  title: '热门知识',
                  items: [
                    '通过微软MediaCreationTool制作Win11系统安装U盘，安装纯净系统',
                    'Windows11系统下如何重置系统？',
                    '通过微软MediaCreationTool制作Win10系统安装U盘，安装纯净版系统',
                    'win11系统重置（不能进桌面）',
                    'PE制作及备份数据操作方法',
                  ],
                ),
                SizedBox(height: 20),
                _StudySection(
                  title: '最新知识',
                  items: [
                    'Lenovo Legion Pro 32UD-10 G25315UY0 用户指南（69D0）',
                    'Lenovo Legion Pro 32UD-10 设定指南',
                    'Lenovo Legion Pro 27UD-10 G25270UY0 用户指南（68CE）',
                    'Lenovo Legion Pro 27UD-10 设定指南',
                    'Lenovo Legion Pro 27Q-10 G25270QY0 用户指南（68CF）',
                    'Lenovo Legion Pro 27Q-10 设定指南',
                    'IdeaCentre AIO 520-24IAN5 和扬天S660IAN24D5 用户指南（节选）',
                    'IdeaCentre AIO 520-24IAN5 和扬天S660IAN24D5 用户指南（照片版）',
                    '33-店面管理中心（人员管理）',
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _StudyHeader extends StatelessWidget {
  const _StudyHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 14, 20, 14),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x11000000),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          const Expanded(
            child: Text(
              '中国区服务统一知识平台',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1B1D1F),
              ),
            ),
          ),
          Container(
            height: 36,
            width: 36,
            decoration: BoxDecoration(
              color: const Color(0xFFF3F4F7),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.tune, color: Color(0xFF5B6574)),
          ),
        ],
      ),
    );
  }
}

class _StudySearchBar extends StatelessWidget {
  const _StudySearchBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0x12000000),
            blurRadius: 10,
            offset: Offset(0, 6),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      child: Row(
        children: [
          Expanded(
            child: Text(
              '输入搜索词',
              style: TextStyle(
                fontSize: 15,
                color: const Color(0xFF5B6574).withOpacity(0.85),
              ),
            ),
          ),
          Container(
            height: 36,
            padding: const EdgeInsets.symmetric(horizontal: 22),
            decoration: BoxDecoration(
              color: const Color(0xFF9AA3B1),
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Center(
              child: Text(
                '搜索',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StudyCategoryLabels extends StatelessWidget {
  const _StudyCategoryLabels();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            '知识分类',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF5B6574).withOpacity(0.9),
            ),
          ),
        ),
        Expanded(
          child: Text(
            '请选择知识分类',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF9AA3B1),
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}

class _StudyCategoryChips extends StatelessWidget {
  const _StudyCategoryChips();

  @override
  Widget build(BuildContext context) {
    const labels = [
      '59305987',
      '联想无线键鼠套装KM490B(黑)',
      'PHAB',
    ];
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        for (var i = 0; i < labels.length; i++)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            decoration: BoxDecoration(
              color: i == 1 ? const Color(0xFF2A8BF2) : Colors.white,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color:
                    i == 1 ? const Color(0xFF2A8BF2) : const Color(0xFFE1E4EB),
              ),
              boxShadow: i == 1
                  ? const [
                      BoxShadow(
                        color: Color(0x22000000),
                        blurRadius: 12,
                        offset: Offset(0, 6),
                      ),
                    ]
                  : null,
            ),
            child: Text(
              labels[i],
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: i == 1 ? Colors.white : const Color(0xFF5B6574),
              ),
            ),
          ),
      ],
    );
  }
}

class _StudySection extends StatelessWidget {
  final String title;
  final List<String> items;

  const _StudySection({
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1B1D1F),
            ),
          ),
          const SizedBox(height: 12),
          for (var i = 0; i < items.length; i++) ...[
            Text(
              items[i],
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF1B1D1F),
                height: 1.5,
              ),
            ),
            if (i != items.length - 1)
              const Divider(
                height: 18,
                thickness: 0.7,
                color: Color(0xFFE1E4EB),
              ),
          ],
        ],
      ),
    );
  }
}

class _PlaceholderView extends StatelessWidget {
  final String label;

  const _PlaceholderView({required this.label});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        label,
        style: const TextStyle(
          color: Color(0xFF8A94A6),
          fontSize: 16,
        ),
      ),
    );
  }
}

class _WorkStatusTabs extends StatelessWidget {
  final int activeIndex;
  final ValueChanged<int> onChanged;

  const _WorkStatusTabs({
    required this.activeIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    const tabs = ['服务中', '已完成', '接单分派'];
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
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
      child: Row(
        children: [
          for (var i = 0; i < tabs.length; i++)
            Expanded(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => onChanged(i),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          tabs[i],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: i == activeIndex
                                ? FontWeight.w700
                                : FontWeight.w500,
                            color: i == activeIndex
                                ? const Color(0xFF2A8BF2)
                                : const Color(0xFF8A94A6),
                          ),
                        ),
                        if (i == 0) ...[
                          const SizedBox(width: 6),
                          const _InfoBadge(label: '1'),
                        ],
                      ],
                    ),
                    const SizedBox(height: 10),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      height: 3,
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: i == activeIndex
                            ? const Color(0xFF2A8BF2)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(3),
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

class _InfoBadge extends StatelessWidget {
  final String label;

  const _InfoBadge({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: const Color(0xFFE3EEFF),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 12,
          color: Color(0xFF2A8BF2),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _WorkOrderFilters extends StatelessWidget {
  const _WorkOrderFilters();

  @override
  Widget build(BuildContext context) {
    const filters = ['全部工单', 'SFB工单', 'SF工单'];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          for (var i = 0; i < filters.length; i++) ...[
            _FilterChip(
              label: filters[i],
              isActive: i == 0,
            ),
            if (i != filters.length - 1) const SizedBox(width: 10),
          ],
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool isActive;

  const _FilterChip({
    required this.label,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF2A8BF2) : Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: isActive ? const Color(0xFF2A8BF2) : const Color(0xFFE1E4EB),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: isActive ? Colors.white : const Color(0xFF5B6574),
        ),
      ),
    );
  }
}

class _WorkOrderSection extends StatelessWidget {
  const _WorkOrderSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            '2025/10/09 周四',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Color(0xFF5B6574),
            ),
          ),
          SizedBox(height: 12),
          _WorkOrderCard(),
        ],
      ),
    );
  }
}

class _DispatchListSection extends StatelessWidget {
  const _DispatchListSection();

  @override
  Widget build(BuildContext context) {
    const orders = [
      _DispatchOrderData(
        appointmentTime: '2025-10-11 09:43:00',
        orderType: '保外直营预约单',
        orderNumber: '202510112100880001',
        projectName: '联想售后服务业务',
        spareStatus: '未预约',
        statusLabel: '待处理',
        statusColor: Color(0xFF2A8BF2),
      ),
      _DispatchOrderData(
        appointmentTime: '2025-10-10 18:06:08',
        orderType: '百应全网营销',
        orderNumber: '202510102100880001',
        projectName: '联想售后服务业务',
        spareStatus: '未预约',
        statusLabel: '待预约',
        statusColor: Color(0xFF34A853),
      ),
      _DispatchOrderData(
        appointmentTime: '2025-09-26 20:10:04',
        orderType: '保外直客尊享',
        orderNumber: '202509262100880002',
        projectName: '联想售后服务业务',
        spareStatus: '未满足',
        statusLabel: '已联系',
        statusColor: Color(0xFF00B8A9),
      ),
      _DispatchOrderData(
        appointmentTime: '2025-09-25 11:02:32',
        orderType: '保外直客返厂',
        orderNumber: '202509252100880001',
        projectName: '联想售后服务业务',
        spareStatus: '未预约',
        statusLabel: '待确认',
        statusColor: Color(0xFFF2994A),
      ),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const _DispatchSearchField(),
          const SizedBox(height: 16),
          for (var i = 0; i < orders.length; i++) ...[
            _DispatchOrderCard(data: orders[i]),
            if (i != orders.length - 1) const SizedBox(height: 12),
          ],
        ],
      ),
    );
  }
}

class _DispatchSearchField extends StatelessWidget {
  const _DispatchSearchField();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: Color(0x11000000),
            blurRadius: 10,
            offset: Offset(0, 6),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      child: Row(
        children: [
          const Icon(Icons.search, color: Color(0xFF9AA3B1)),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              '请输入工单编号',
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF9AA3B1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DispatchOrderCard extends StatelessWidget {
  final _DispatchOrderData data;

  const _DispatchOrderCard({required this.data});

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
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _DispatchInfoLine(
                  label: '预约时间',
                  value: data.appointmentTime,
                ),
              ),
              const SizedBox(width: 12),
              _DispatchStatusChip(
                label: data.statusLabel,
                color: data.statusColor,
              ),
            ],
          ),
          const SizedBox(height: 10),
          _DispatchInfoLine(label: '工单类型', value: data.orderType),
          const SizedBox(height: 8),
          _DispatchInfoLine(label: '工单编号', value: data.orderNumber),
          const SizedBox(height: 8),
          _DispatchInfoLine(label: '项目名称', value: data.projectName),
          const SizedBox(height: 8),
          _DispatchInfoLine(label: '备件状态', value: data.spareStatus),
        ],
      ),
    );
  }
}

class _DispatchInfoLine extends StatelessWidget {
  final String label;
  final String value;

  const _DispatchInfoLine({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          fontSize: 14,
          color: Color(0xFF1B1D1F),
        ),
        children: [
          TextSpan(
            text: '$label：',
            style: const TextStyle(
              color: Color(0xFF5B6574),
              fontWeight: FontWeight.w600,
            ),
          ),
          TextSpan(text: value),
        ],
      ),
    );
  }
}

class _DispatchStatusChip extends StatelessWidget {
  final String label;
  final Color color;

  const _DispatchStatusChip({
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    );
  }
}

class _DispatchOrderData {
  final String appointmentTime;
  final String orderType;
  final String orderNumber;
  final String projectName;
  final String spareStatus;
  final String statusLabel;
  final Color statusColor;

  const _DispatchOrderData({
    required this.appointmentTime,
    required this.orderType,
    required this.orderNumber,
    required this.projectName,
    required this.spareStatus,
    required this.statusLabel,
    required this.statusColor,
  });
}

class _WorkOrderCard extends StatelessWidget {
  const _WorkOrderCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0x11000000),
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
        ],
      ),
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      '陈昊炜',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1B1D1F),
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      '北京市北京市海淀区学院桥-地铁站',
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xFF6F7C8F),
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: const [
                  _ContactActionButton(icon: Icons.phone_outlined),
                  SizedBox(width: 12),
                  _ContactActionButton(icon: Icons.location_on_outlined),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          const _DetailRow(
            label: '预约时间',
            value: '2025/10/09 14:24',
            trailing: _StatusTag(label: '已分派'),
          ),
          const SizedBox(height: 12),
          const _DetailRow(label: '工单类型', value: 'MA标准'),
          const SizedBox(height: 12),
          const _DetailRow(label: '工单编号', value: '2025100902100887004'),
          const SizedBox(height: 12),
          const _DetailRow(label: '整髟鸽类', value: 'PF5QRLG5'),
          const SizedBox(height: 12),
          const _DetailRow(label: '备件状态', value: '未预约'),
        ],
      ),
    );
  }
}

class _ContactActionButton extends StatelessWidget {
  final IconData icon;

  const _ContactActionButton({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      width: 36,
      decoration: BoxDecoration(
        color: const Color(0xFFE8F2FF),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(icon, color: const Color(0xFF2A8BF2), size: 20),
    );
  }
}

class _StatusTag extends StatelessWidget {
  final String label;

  const _StatusTag({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFE6F5ED),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Color(0xFF34A853),
        ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;
  final Widget? trailing;

  const _DetailRow({
    required this.label,
    required this.value,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 70,
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              color: Color(0xFF8A94A6),
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 13,
              color: Color(0xFF1B1D1F),
            ),
          ),
        ),
        if (trailing != null) trailing!,
      ],
    );
  }
}

class _EaseServeBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const _EaseServeBottomNav({
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
            icon: Icon(Icons.assignment_outlined), label: '工单'),
        BottomNavigationBarItem(
            icon: Icon(Icons.smart_toy_outlined), label: 'AI助理'),
        BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_outlined), label: '学习'),
        BottomNavigationBarItem(icon: Icon(Icons.forum_outlined), label: '社区'),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: '我的'),
      ],
    );
  }
}
