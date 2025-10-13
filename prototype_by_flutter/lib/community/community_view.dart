import 'package:flutter/material.dart';

class CommunityView extends StatelessWidget {
  const CommunityView({super.key});

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
                child: Container(
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.25),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.home_outlined,
                      color: Colors.white, size: 18),
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

class _HeaderTimeDisplay extends StatelessWidget {
  const _HeaderTimeDisplay();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Text(
          '12:35',
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
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
        Icon(Icons.network_cell, color: Colors.white, size: 18),
        SizedBox(width: 6),
        Icon(Icons.wifi, color: Colors.white, size: 18),
        SizedBox(width: 6),
        Icon(Icons.battery_full, color: Colors.white, size: 20),
      ],
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
              const _CommunityActionButton(
                icon: Icons.favorite_border,
                label: '赞',
              ),
              const SizedBox(width: 16),
              const _CommunityActionButton(
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
