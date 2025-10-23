import 'package:flutter/material.dart';

import 'engineer_badge_page.dart';
import 'feedback_page.dart';
import 'message_center_page.dart';
import 'scan_validation_page.dart';
import 'work_order_model.dart';

class WorkOrderDetailPage extends StatelessWidget {
  final WorkOrderSummary order;

  const WorkOrderDetailPage({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F8),
      body: SafeArea(
        child: Column(
          children: [
            _DetailHeader(order: order),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _WorkInfoCard(order: order),
                    const SizedBox(height: 16),
                    _CustomerInfoCard(order: order),
                    const SizedBox(height: 20),
                    const _CurrentStageCard(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const _DetailBottomBar(),
    );
  }
}

class _DetailHeader extends StatelessWidget {
  final WorkOrderSummary order;

  const _DetailHeader({required this.order});

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
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 48,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new,
                        color: Colors.white),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                Text(
                  order.orderNumber,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox.shrink(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _WorkInfoCard extends StatelessWidget {
  final WorkOrderSummary order;

  const _WorkInfoCard({required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF6F9FF),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: const Color(0xFFE2ECFF)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x11000000),
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
        ],
      ),
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                '工单信息',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1B1D1F),
                ),
              ),
              const Spacer(),
              _StatusBadge(label: order.statusLabel, color: order.statusColor),
            ],
          ),
          const SizedBox(height: 18),
          const Divider(height: 1, color: Color(0xFFE3EBFB)),
          const SizedBox(height: 18),
          _InfoRow(label: '工单类型', value: order.orderType),
          const SizedBox(height: 12),
          _InfoRow(
              label: '工单子类型',
              value: order.orderSubType.isEmpty ? '--' : order.orderSubType),
          const SizedBox(height: 12),
          _InfoRow(label: '预约服务时间', value: order.appointmentTime),
          const SizedBox(height: 12),
          _InfoRow(
            label: '产品序列号',
            value: order.productSerial,
            valueTrailing: IconButton(
              icon: const Icon(Icons.copy_outlined,
                  size: 16, color: Color(0xFF6F82A8)),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: () {},
            ),
          ),
          const SizedBox(height: 12),
          _InfoRow(label: '产品型号', value: order.productModel),
          const SizedBox(height: 12),
          _InfoRow(label: '备件状态', value: order.spareStatus),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: 96,
                child: Text(
                  '工单标签：',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF89A0C2),
                  ),
                ),
              ),
              Expanded(
                child: Wrap(
                  spacing: 10,
                  runSpacing: 8,
                  children: (order.tags.isEmpty ? const ['--'] : order.tags)
                      .map(
                        (tag) => Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE2EEFF),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            tag,
                            style: TextStyle(
                              color: order.tags.isEmpty
                                  ? const Color(0xFF6F7A84)
                                  : const Color(0xFF2A8BF2),
                              fontSize: 12,
                              fontWeight: order.tags.isEmpty
                                  ? FontWeight.w400
                                  : FontWeight.w500,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          const _QuickActionButtons(
            actions: [
              _QuickAction(
                icon: Icons.lightbulb_outline,
                label: '智能推荐',
                badgeColor: Color(0xFFF6655A),
              ),
              _QuickAction(
                icon: Icons.notifications_active_outlined,
                label: 'SLA提醒',
                badgeColor: Color(0xFFF6A21A),
              ),
              _QuickAction(
                icon: Icons.sticky_note_2_outlined,
                label: '工单详情',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  final Widget? valueTrailing;

  const _InfoRow({
    required this.label,
    required this.value,
    this.valueTrailing,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 96,
          child: Text(
            '$label：',
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF89A0C2),
            ),
          ),
        ),
        Expanded(
          child: valueTrailing == null
              ? Text(
                  value,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF1D2333),
                    fontWeight: FontWeight.w600,
                  ),
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Text(
                        value,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF1D2333),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    valueTrailing!,
                  ],
                ),
        ),
      ],
    );
  }
}

class _QuickActionButtons extends StatelessWidget {
  final List<_QuickAction> actions;

  const _QuickActionButtons({required this.actions});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFEAEAEA)),
      ),
      child: Row(
        children: [
          for (var i = 0; i < actions.length; i++) ...[
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      CircleAvatar(
                        radius: 18,
                        backgroundColor: const Color(0xFFE8F0FF),
                        child: Icon(actions[i].icon,
                            color: const Color(0xFF2A8BF2), size: 18),
                      ),
                      if (actions[i].badgeColor != null)
                        Positioned(
                          top: -4,
                          right: -4,
                          child: Container(
                            height: 14,
                            width: 14,
                            decoration: BoxDecoration(
                              color: actions[i].badgeColor!,
                              borderRadius: BorderRadius.circular(7),
                              border:
                                  Border.all(color: Colors.white, width: 1.5),
                            ),
                            child: const Center(
                              child: Text(
                                '!',
                                style: TextStyle(
                                  fontSize: 9,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    actions[i].label,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF5B6574),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            if (i != actions.length - 1)
              Container(
                width: 1,
                height: 28,
                margin: const EdgeInsets.symmetric(horizontal: 6),
                color: const Color(0xFFE6EBF5),
              ),
          ],
        ],
      ),
    );
  }
}

class _QuickAction {
  final IconData icon;
  final String label;
  final Color? badgeColor;

  const _QuickAction({
    required this.icon,
    required this.label,
    this.badgeColor,
  });
}

class _CustomerInfoCard extends StatelessWidget {
  final WorkOrderSummary order;

  const _CustomerInfoCard({required this.order});

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
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: const [
              Text(
                '客户信息',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1B1D1F),
                ),
              ),
              Spacer(),
              Icon(Icons.bookmark_border, color: Color(0xFF8A94A6)),
              SizedBox(width: 12),
              Icon(Icons.qr_code_2_outlined, color: Color(0xFF8A94A6)),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(height: 1, color: Color(0xFFEAEAEA)),
          const SizedBox(height: 16),
          _InfoRow(label: '联系人', value: order.customerName),
          const SizedBox(height: 12),
          _InfoRow(
            label: '联系电话',
            value: order.contactPhone.isEmpty ? '--' : order.contactPhone,
          ),
          const SizedBox(height: 12),
          _InfoRow(label: '上门地址', value: order.address),
          const SizedBox(height: 20),
          const _QuickActionButtons(
            actions: [
              _QuickAction(
                icon: Icons.navigation_outlined,
                label: '导航',
              ),
              _QuickAction(
                icon: Icons.phone_outlined,
                label: '联系',
              ),
              _QuickAction(
                icon: Icons.edit_outlined,
                label: '修改',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CurrentStageCard extends StatelessWidget {
  const _CurrentStageCard();

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
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: const [
              Text(
                '当前环节',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1B1D1F),
                ),
              ),
              Spacer(),
              Icon(Icons.more_horiz, color: Color(0xFF8A94A6)),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            '联系客户',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF1B1D1F),
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              _StageOption('与预约时间一致', selected: true, showDivider: true),
              _StageOption('改约且改派', showDivider: true),
              _StageOption('改约无需改派', showDivider: true),
              _StageOption('失败', showDivider: true),
              _StageOption('转送修', showDivider: true),
              _StageOption('电话解决'),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            '备注',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1B1D1F),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            height: 60,
            decoration: BoxDecoration(
              color: const Color(0xFFF6F7FB),
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(12),
            child: const Align(
              alignment: Alignment.topLeft,
              child: Text(
                '请填写备注',
                style: TextStyle(
                  color: Color(0xFF9AA3B1),
                  fontSize: 13,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StageOption extends StatelessWidget {
  final String label;
  final bool selected;
  final bool showDivider;

  const _StageOption(
    this.label, {
    this.selected = false,
    this.showDivider = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 7),
          child: Row(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 22,
                width: 22,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      selected ? const Color(0xFF2A8BF2) : Colors.transparent,
                  border: Border.all(
                    color: selected
                        ? const Color(0xFF2A8BF2)
                        : const Color(0xFFD0D6E1),
                    width: 1.8,
                  ),
                  boxShadow: selected
                      ? const [
                          BoxShadow(
                            color: Color(0x332A8BF2),
                            blurRadius: 6,
                            offset: Offset(0, 2),
                          ),
                        ]
                      : null,
                ),
                child: selected
                    ? const Icon(Icons.check, size: 14, color: Colors.white)
                    : null,
              ),
              const SizedBox(width: 12),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 13,
                  color: Color(0xFF4D5866),
                ),
              ),
            ],
          ),
        ),
        if (showDivider)
          const Divider(
            height: 1,
            indent: 34,
            color: Color(0xFFE6EBF5),
          ),
      ],
    );
  }
}

class _DetailBottomBar extends StatelessWidget {
  const _DetailBottomBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
      color: Colors.white,
      child: Row(
        children: [
          OutlinedButton.icon(
            onPressed: () {
              showModalBottomSheet<void>(
                context: context,
                backgroundColor: Colors.transparent,
                isScrollControlled: true,
                builder: (modalContext) => _ToolDrawer(rootContext: context),
              );
            },
            icon: const Icon(Icons.apps, color: Color(0xFF2A8BF2)),
            label: const Text(
              '工具',
              style: TextStyle(color: Color(0xFF2A8BF2)),
            ),
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Color(0xFFCCE0FF)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: SizedBox(
              height: 44,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2A8BF2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: const Text(
                  '提交',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ToolDrawer extends StatelessWidget {
  final BuildContext rootContext;

  const _ToolDrawer({required this.rootContext});

  void _showPlaceholder(String label) {
    final messenger = ScaffoldMessenger.of(rootContext);
    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text('$label 功能正在建设中'),
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 2),
        ),
      );
  }

  List<_ToolAction> get _actions => [
        _ToolAction(
          icon: Icons.category_outlined,
          label: '约件',
          onSelected: (_) => _showPlaceholder('约件'),
        ),
        _ToolAction(
          icon: Icons.system_update_alt_outlined,
          label: '升级处理',
          onSelected: (_) => _showPlaceholder('升级处理'),
        ),
        _ToolAction(
          icon: Icons.account_balance_wallet_outlined,
          label: '信用转储',
          onSelected: (_) => _showPlaceholder('信用转储'),
        ),
        _ToolAction(
          icon: Icons.qr_code_scanner_outlined,
          label: '装箱单验证',
          onSelected: (context) {
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (_) => const ScanValidationPage(),
              ),
            );
          },
        ),
        _ToolAction(
          icon: Icons.storage_outlined,
          label: '主机信息',
          onSelected: (_) => _showPlaceholder('主机信息'),
        ),
        _ToolAction(
          icon: Icons.attach_file_outlined,
          label: '附件',
          onSelected: (_) => _showPlaceholder('附件'),
        ),
        _ToolAction(
          icon: Icons.sync_alt,
          label: '换件',
          onSelected: (_) => _showPlaceholder('换件'),
        ),
        _ToolAction(
          icon: Icons.do_not_disturb_alt_outlined,
          label: '非换件',
          onSelected: (_) => _showPlaceholder('非换件'),
        ),
        _ToolAction(
          icon: Icons.chat_bubble_outline,
          label: '合法性验证工具',
          onSelected: (_) => _showPlaceholder('合法性验证工具'),
        ),
        _ToolAction(
          icon: Icons.verified_outlined,
          label: '合法性验证',
          onSelected: (_) => _showPlaceholder('合法性验证'),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    final actions = _actions;
    final rows = (actions.length / 4).ceil();
    final gridHeight = rows * 110.0;

    return Container(
      color: Colors.transparent,
      child: SafeArea(
        top: false,
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xFFF6F7FB),
            borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
          ),
          padding: const EdgeInsets.fromLTRB(24, 18, 24, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 48,
                height: 5,
                decoration: BoxDecoration(
                  color: const Color(0xFFD6DBE4),
                  borderRadius: BorderRadius.circular(99),
                ),
              ),
              const SizedBox(height: 22),
              SizedBox(
                height: gridHeight,
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 18,
                    childAspectRatio: 0.78,
                  ),
                  physics: rows > 2
                      ? const BouncingScrollPhysics()
                      : const NeverScrollableScrollPhysics(),
                  itemCount: actions.length,
                  itemBuilder: (context, index) => _ToolDrawerItem(
                    action: actions[index],
                    rootContext: rootContext,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ToolAction {
  final IconData icon;
  final String label;
  final void Function(BuildContext context)? onSelected;

  const _ToolAction({
    required this.icon,
    required this.label,
    this.onSelected,
  });
}

class _ToolDrawerItem extends StatelessWidget {
  final _ToolAction action;
  final BuildContext rootContext;

  const _ToolDrawerItem({
    required this.action,
    required this.rootContext,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () {
          final handler = action.onSelected;
          Navigator.of(context).pop();
          if (handler != null) {
            Future.microtask(() => handler(rootContext));
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 56,
                width: 56,
                decoration: BoxDecoration(
                  color: const Color(0xFFE7F0FF),
                  shape: BoxShape.circle,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x1A2A8BF2),
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child:
                    Icon(action.icon, size: 24, color: const Color(0xFF2A8BF2)),
              ),
              const SizedBox(height: 8),
              Text(
                action.label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF4B5768),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final String label;
  final Color color;

  const _StatusBadge({required this.label, required this.color});

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
