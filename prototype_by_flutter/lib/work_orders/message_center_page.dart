import 'package:flutter/material.dart';

class MessageCenterPage extends StatefulWidget {
  const MessageCenterPage({super.key});

  @override
  State<MessageCenterPage> createState() => _MessageCenterPageState();
}

class _MessageCenterPageState extends State<MessageCenterPage>
    with SingleTickerProviderStateMixin {
  bool _showUnreadOnly = false;

  late final List<_MessageItem> _orderMessages = [
    _MessageItem(
      title: '工单变更提醒',
      subtitle: '工单变更提醒：[RO-TEST-20251019-0001]\n已被撤单，撤单原因：测试撤单',
      timeLabel: '2025/10/19 18:23',
      unread: true,
      iconColor: const Color(0xFFF56C6C),
    ),
    _MessageItem(
      title: '七日长尾超时提醒',
      subtitle: '您好，工单2025022421000887100未在7日内完成修复，请关注并尽快完成此工单',
      timeLabel: '2025/10/19 18:23',
      unread: true,
      iconColor: const Color(0xFFF56C6C),
    ),
    _MessageItem(
      title: '工单变更提醒',
      subtitle: '工单变更提醒：[RO-TEST-20251019-0001]\n已被撤单，撤单原因：测试撤单',
      timeLabel: '2025/10/19 18:23',
      unread: false,
      iconColor: const Color(0xFFF56C6C),
    ),
  ];

  late final List<_MessageItem> _systemMessages = [
    _MessageItem(
      title: '10月7日系统维护通知',
      subtitle: '服务无忧APP将于2025年10月7日凌晨1:00至2:00停服维护',
      timeLabel: '2025/10/19 18:23',
      unread: false,
      iconColor: const Color(0xFF52C41A),
    ),
    _MessageItem(
      title: '10月7日系统维护通知',
      subtitle: '服务无忧APP将于2025年10月7日凌晨1:00至2:00停服维护',
      timeLabel: '2025/10/19 18:23',
      unread: true,
      iconColor: const Color(0xFF52C41A),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F6F8),
        body: SafeArea(
          child: Column(
            children: [
              const _MessageHeader(),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: StatefulBuilder(
                        builder: (context, setStateTab) {
                          final controller = DefaultTabController.of(context);
                          controller?.animation?.addListener(() {
                            setStateTab(() {});
                          });

                          final unreadOrder =
                              _orderMessages.any((msg) => msg.unread);
                          final unreadSystem =
                              _systemMessages.any((msg) => msg.unread);

                          return TabBar(
                            isScrollable: true,
                            indicatorColor: const Color(0xFF2A8BF2),
                            indicatorWeight: 3,
                            labelColor: const Color(0xFF2A8BF2),
                            unselectedLabelColor: const Color(0xFF7B8795),
                            labelStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                            unselectedLabelStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                            tabs: [
                              _TabWithBadge(
                                label: '工单消息',
                                showBadge: unreadOrder &&
                                    (controller?.index ?? 0) != 0,
                              ),
                              _TabWithBadge(
                                label: '系统消息',
                                showBadge: unreadSystem &&
                                    (controller?.index ?? 0) != 1,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 12),
                    _MessageFilterButton(
                      label: '全部',
                      selected: !_showUnreadOnly,
                      onTap: () => _setUnreadOnly(false),
                    ),
                    const SizedBox(width: 8),
                    _MessageFilterButton(
                      label: '未读',
                      selected: _showUnreadOnly,
                      onTap: () => _setUnreadOnly(true),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: TabBarView(
                  children: [
                    _MessageList(
                      messages: _orderMessages,
                      showUnreadOnly: _showUnreadOnly,
                    ),
                    _MessageList(
                      messages: _systemMessages,
                      showUnreadOnly: _showUnreadOnly,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _setUnreadOnly(bool value) {
    if (_showUnreadOnly == value) return;
    setState(() => _showUnreadOnly = value);
  }
}

class _MessageHeader extends StatelessWidget {
  const _MessageHeader();

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
              const _StatusBarMock(time: '15:24'),
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
                  '消息中心',
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

class _MessageFilterButton extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _MessageFilterButton({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFF2A8BF2) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: selected ? const Color(0xFF2A8BF2) : const Color(0xFFD5DCE6),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: selected ? Colors.white : const Color(0xFF5E6775),
          ),
        ),
      ),
    );
  }
}

class _MessageList extends StatelessWidget {
  final List<_MessageItem> messages;
  final bool showUnreadOnly;

  const _MessageList({
    required this.messages,
    required this.showUnreadOnly,
  });

  @override
  Widget build(BuildContext context) {
    final filtered = showUnreadOnly
        ? messages.where((msg) => msg.unread).toList()
        : messages;

    if (filtered.isEmpty) {
      return const Center(
        child: Text(
          '暂无消息',
          style: TextStyle(
            color: Color(0xFF8C96A4),
            fontSize: 14,
          ),
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: filtered.length,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final item = filtered[index];
        return _MessageTile(item: item);
      },
    );
  }
}

class _MessageTile extends StatelessWidget {
  final _MessageItem item;

  const _MessageTile({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              CircleAvatar(
                radius: 22,
                backgroundColor: item.iconColor.withOpacity(0.18),
                child: Icon(
                  item.iconColor == const Color(0xFF52C41A)
                      ? Icons.campaign_outlined
                      : Icons.article_outlined,
                  color: item.iconColor,
                  size: 22,
                ),
              ),
              if (item.unread)
                Positioned(
                  top: -2,
                  right: -2,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE05454),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        item.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF2A2E39),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      item.timeLabel,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF9299A6),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  item.subtitle,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF606876),
                    height: 1.4,
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

class _MessageItem {
  final String title;
  final String subtitle;
  final String timeLabel;
  final bool unread;
  final Color iconColor;

  const _MessageItem({
    required this.title,
    required this.subtitle,
    required this.timeLabel,
    required this.unread,
    required this.iconColor,
  });
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

class _TabWithBadge extends StatelessWidget {
  final String label;
  final bool showBadge;

  const _TabWithBadge({required this.label, required this.showBadge});

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Text(label),
          if (showBadge)
            Positioned(
              right: -10,
              top: -6,
              child: Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  color: Color(0xFFE05454),
                  shape: BoxShape.circle,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
