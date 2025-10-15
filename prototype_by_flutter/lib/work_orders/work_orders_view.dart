import 'package:flutter/material.dart';

import 'scan_icon.dart';
import 'scan_validation_page.dart';
import 'work_order_detail_page.dart';
import 'work_order_model.dart';

class WorkOrdersView extends StatefulWidget {
  const WorkOrdersView({super.key});

  @override
  State<WorkOrdersView> createState() => _WorkOrdersViewState();
}

class _WorkOrdersViewState extends State<WorkOrdersView> {
  static const WorkOrderSummary _primaryOrder = WorkOrderSummary(
    orderNumber: '202510092100887004',
    customerName: '陈昊炜',
    address: '北京市北京市海淀区学院桥-地铁站',
    appointmentDateLabel: '2025/10/09 周四',
    appointmentTime: '2025/10/09 14:24',
    orderType: 'MA标准',
    orderSubType: '标准工单',
    productSerial: 'PF5QRLG5',
    productModel: 'E16 Gen3 IAL',
    projectName: '联想售后服务业务',
    spareStatus: '未预约',
    contactPhone: '13022167706',
    tags: ['技术升级', '可视化', '重复维修'],
    statusLabel: '已分派',
    statusColor: Color(0xFF34A853),
  );

  static const List<WorkOrderSummary> _dispatchOrders = [
    WorkOrderSummary(
      orderNumber: '202510112100880001',
      customerName: '陈昊炜',
      address: '北京市北京市海淀区学院桥-地铁站',
      appointmentDateLabel: '2025/10/11 周六',
      appointmentTime: '2025-10-11 09:43:00',
      orderType: '保外直营预约单',
      orderSubType: '预约单',
      productSerial: 'PF5QRLG5',
      productModel: 'E16 Gen3 IAL',
      projectName: '联想售后服务业务',
      spareStatus: '未预约',
      contactPhone: '13022167706',
      tags: ['提醒'],
      statusLabel: '待检验',
      statusColor: Color(0xFF2A8BF2),
    ),
    WorkOrderSummary(
      orderNumber: '202510102100880001',
      customerName: '陈昊炜',
      address: '北京市北京市海淀区学院桥-地铁站',
      appointmentDateLabel: '2025/10/10 周五',
      appointmentTime: '2025-10-10 18:06:08',
      orderType: '百应全网营销',
      orderSubType: '营销工单',
      productSerial: 'PF5QRLG5',
      productModel: 'E16 Gen3 IAL',
      projectName: '联想售后服务业务',
      spareStatus: '未预约',
      contactPhone: '13022167706',
      tags: [],
      statusLabel: '检验中',
      statusColor: Color(0xFF34A853),
    ),
    WorkOrderSummary(
      orderNumber: '202509262100880002',
      customerName: '陈昊炜',
      address: '北京市北京市海淀区学院桥-地铁站',
      appointmentDateLabel: '2025/09/26 周五',
      appointmentTime: '2025-09-26 20:10:04',
      orderType: '保外直客尊享',
      orderSubType: '尊享服务',
      productSerial: 'PF5QRLG5',
      productModel: 'E16 Gen3 IAL',
      projectName: '联想售后服务业务',
      spareStatus: '未满足',
      contactPhone: '13022167706',
      tags: ['回访'],
      statusLabel: '待处理',
      statusColor: Color(0xFF00B8A9),
    ),
    WorkOrderSummary(
      orderNumber: '202509252100880001',
      customerName: '陈昊炜',
      address: '北京市北京市海淀区学院桥-地铁站',
      appointmentDateLabel: '2025/09/25 周四',
      appointmentTime: '2025-09-25 11:02:32',
      orderType: '保外直客返厂',
      orderSubType: '返厂',
      productSerial: 'PF5QRLG5',
      productModel: 'E16 Gen3 IAL',
      projectName: '联想售后服务业务',
      spareStatus: '未预约',
      contactPhone: '13022167706',
      tags: [],
      statusLabel: '待预约',
      statusColor: Color(0xFFF2994A),
    ),
  ];

  int _activeTab = 0;

  List<WorkOrderSummary> get _inServiceOrders => const [_primaryOrder];

  Widget _buildBody() {
    switch (_activeTab) {
      case 0:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: _DispatchSearchField(),
            ),
            const SizedBox(height: 16),
            _WorkOrderSection(orders: _inServiceOrders),
          ],
        );
      case 1:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: _DispatchSearchField(),
            ),
            const SizedBox(height: 16),
            const _WorkOrdersMessage(message: '已完成工单内容待补充'),
          ],
        );
      case 2:
        return const _DispatchListSection(orders: _dispatchOrders);
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
        children: [
          const _StatusBarRow(),
          const SizedBox(height: 18),
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
            alignment: Alignment.centerLeft,
            child: Builder(
              builder: (context) => _HeaderDrawerButton(
                onPressed: () {
                  final scaffoldState = Scaffold.maybeOf(context);
                  scaffoldState?.openDrawer();
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _HeaderIconButton(
                  icon: const ScanIcon(size: 20),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const ScanValidationPage(),
                      ),
                    );
                  },
                ),
                const SizedBox(width: 12),
                const _HeaderIconButton(
                  icon: Icon(Icons.chat_bubble_outline, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderIconButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback? onTap;

  const _HeaderIconButton({required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 36,
        width: 36,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.25),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(child: icon),
      ),
    );
  }
}

class _HeaderDrawerButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _HeaderDrawerButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 36,
        width: 36,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.25),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Icon(Icons.menu, color: Colors.white),
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

class _WorkOrderSection extends StatelessWidget {
  final List<WorkOrderSummary> orders;

  const _WorkOrderSection({required this.orders});

  @override
  Widget build(BuildContext context) {
    if (orders.isEmpty) {
      return const SizedBox();
    }

    final dateLabel = orders.first.appointmentDateLabel.isNotEmpty
        ? orders.first.appointmentDateLabel
        : orders.first.appointmentTime.split(' ').first;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            dateLabel,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Color(0xFF5B6574),
            ),
          ),
          const SizedBox(height: 12),
          for (var i = 0; i < orders.length; i++) ...[
            _WorkOrderCard(order: orders[i]),
            if (i != orders.length - 1) const SizedBox(height: 12),
          ],
        ],
      ),
    );
  }
}

class _WorkOrderCard extends StatelessWidget {
  final WorkOrderSummary order;

  const _WorkOrderCard({required this.order});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => WorkOrderDetailPage(order: order),
            ),
          );
        },
        child: Container(
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
                      children: [
                        Text(
                          order.customerName,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF1B1D1F),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          order.address,
                          style: const TextStyle(
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
              _DetailRow(
                label: '预约时间',
                value: order.appointmentTime,
                trailing: _StatusTag(
                  label: order.statusLabel,
                  color: order.statusColor,
                ),
              ),
              const SizedBox(height: 12),
              _DetailRow(label: '工单类型', value: order.orderType),
              const SizedBox(height: 12),
              _DetailRow(label: '工单编号', value: order.orderNumber),
              const SizedBox(height: 12),
              _DetailRow(label: '产品序列号', value: order.productSerial),
              const SizedBox(height: 12),
              _DetailRow(label: '备件状态', value: order.spareStatus),
            ],
          ),
        ),
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
  final Color color;

  const _StatusTag({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
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
          width: 80,
          child: Text(
            '$label：',
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

class _WorkOrdersMessage extends StatelessWidget {
  final String message;

  const _WorkOrdersMessage({required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 180,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: const Color(0xFFE1E4EB)),
        ),
        child: Center(
          child: Text(
            message,
            style: const TextStyle(
              color: Color(0xFF8A94A6),
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}

class _DispatchListSection extends StatelessWidget {
  final List<WorkOrderSummary> orders;

  const _DispatchListSection({required this.orders});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const _DispatchSearchField(),
          const SizedBox(height: 16),
          for (var i = 0; i < orders.length; i++) ...[
            _DispatchOrderCard(order: orders[i]),
            if (i != orders.length - 1) const SizedBox(height: 12),
          ],
        ],
      ),
    );
  }
}

class _DispatchSearchField extends StatefulWidget {
  const _DispatchSearchField();

  @override
  State<_DispatchSearchField> createState() => _DispatchSearchFieldState();
}

class _DispatchSearchFieldState extends State<_DispatchSearchField> {
  final GlobalKey _fieldKey = GlobalKey();
  OverlayEntry? _overlayEntry;
  bool get _isOverlayVisible => _overlayEntry != null;

  @override
  void dispose() {
    _removeOverlay();
    super.dispose();
  }

  void _toggleOverlay() {
    if (_isOverlayVisible) {
      _removeOverlay();
    } else {
      _showOverlay();
    }
  }

  void _showOverlay() {
    final renderBox =
        _fieldKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) return;

    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    _overlayEntry = OverlayEntry(
      builder: (context) {
        return GestureDetector(
          onTap: _removeOverlay,
          behavior: HitTestBehavior.translucent,
          child: Stack(
            children: [
              Positioned(
                left: offset.dx,
                top: offset.dy + size.height + 8,
                width: size.width,
                child: GestureDetector(
                  onTap: () {},
                  child: Material(
                    color: Colors.transparent,
                    child: _DispatchFilterDropdown(
                      onClose: _removeOverlay,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );

    Overlay.of(context, rootOverlay: true)?.insert(_overlayEntry!);
    setState(() {});
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: _fieldKey,
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
          const Expanded(
            child: Text(
              '请输入工单编号',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF9AA3B1),
              ),
            ),
          ),
          Container(
            height: 24,
            width: 1,
            color: const Color(0xFFE3E8F0),
          ),
          const SizedBox(width: 12),
          GestureDetector(
            onTap: _toggleOverlay,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: _isOverlayVisible
                    ? const Color(0xFF2A8BF2).withOpacity(0.08)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: const [
                  Icon(
                    Icons.filter_list,
                    color: Color(0xFF2A8BF2),
                    size: 20,
                  ),
                  SizedBox(width: 6),
                  Text(
                    '筛选',
                    style: TextStyle(
                      color: Color(0xFF2A8BF2),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
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

class _DispatchFilterDropdown extends StatefulWidget {
  final VoidCallback onClose;

  const _DispatchFilterDropdown({required this.onClose});

  @override
  State<_DispatchFilterDropdown> createState() =>
      _DispatchFilterDropdownState();
}

class _DispatchFilterDropdownState extends State<_DispatchFilterDropdown> {
  final Set<String> _selectedSources = <String>{};
  String? _quickRange;

  void _toggleSource(String label) {
    setState(() {
      if (_selectedSources.contains(label)) {
        _selectedSources.remove(label);
      } else {
        _selectedSources.add(label);
      }
    });
  }

  void _toggleQuickRange(String label) {
    setState(() {
      _quickRange = _quickRange == label ? null : label;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      behavior: HitTestBehavior.translucent,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Color(0x1A000000),
              blurRadius: 18,
              offset: Offset(0, 10),
            ),
          ],
        ),
        padding: const EdgeInsets.fromLTRB(18, 18, 18, 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _FilterSectionTitle('工单来源'),
            const SizedBox(height: 12),
            Wrap(
              spacing: 12,
              runSpacing: 8,
              children: [
                _FilterChoiceChip(
                  label: 'SF工单',
                  isSelected: _selectedSources.contains('SF工单'),
                  onTap: () => _toggleSource('SF工单'),
                ),
                _FilterChoiceChip(
                  label: 'SFB工单',
                  isSelected: _selectedSources.contains('SFB工单'),
                  onTap: () => _toggleSource('SFB工单'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const _FilterSectionTitle('客户名称'),
            const SizedBox(height: 12),
            const _FilterTextField(hintText: '请输入'),
            const SizedBox(height: 16),
            const _FilterSectionTitle('客户电话'),
            const SizedBox(height: 12),
            const _FilterTextField(hintText: '请输入'),
            const SizedBox(height: 16),
            const _FilterSectionTitle('开单时间范围'),
            const SizedBox(height: 12),
            Row(
              children: const [
                Expanded(
                  child: _FilterDateField(hintText: '请选择开始时间'),
                ),
                SizedBox(width: 12),
                Text(
                  '至',
                  style: TextStyle(
                    color: Color(0xFF6F7C8F),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: _FilterDateField(hintText: '请选择结束时间'),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 12,
              runSpacing: 10,
              children: [
                _QuickRangeButton(
                  label: '今天',
                  isSelected: _quickRange == '今天',
                  onTap: () => _toggleQuickRange('今天'),
                ),
                _QuickRangeButton(
                  label: '昨天',
                  isSelected: _quickRange == '昨天',
                  onTap: () => _toggleQuickRange('昨天'),
                ),
                _QuickRangeButton(
                  label: '近三天',
                  isSelected: _quickRange == '近三天',
                  onTap: () => _toggleQuickRange('近三天'),
                ),
                _QuickRangeButton(
                  label: '近七天',
                  isSelected: _quickRange == '近七天',
                  onTap: () => _toggleQuickRange('近七天'),
                ),
              ],
            ),
            const SizedBox(height: 18),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      setState(() {
                        _selectedSources.clear();
                        _quickRange = null;
                      });
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      side: const BorderSide(color: Color(0xFFCBD3E1)),
                    ),
                    child: const Text(
                      '重置',
                      style: TextStyle(
                        color: Color(0xFF6F7C8F),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: widget.onClose,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2A8BF2),
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text(
                      '确认',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _FilterSectionTitle extends StatelessWidget {
  final String title;

  const _FilterSectionTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w700,
        color: Color(0xFF384250),
      ),
    );
  }
}

class _FilterChoiceChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _FilterChoiceChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFE8F1FF) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color:
                isSelected ? const Color(0xFF2A8BF2) : const Color(0xFFCBD3E1),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color:
                isSelected ? const Color(0xFF2A8BF2) : const Color(0xFF566173),
          ),
        ),
      ),
    );
  }
}

class _FilterTextField extends StatelessWidget {
  final String hintText;

  const _FilterTextField({required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Color(0xFFB0B8C6),
          fontSize: 14,
        ),
        filled: true,
        fillColor: const Color(0xFFF6F7FB),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color(0xFFE0E4ED)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color(0xFF2A8BF2)),
        ),
      ),
    );
  }
}

class _FilterDateField extends StatelessWidget {
  final String hintText;

  const _FilterDateField({required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F7FB),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE0E4ED)),
      ),
      child: Row(
        children: [
          const Icon(Icons.calendar_today_outlined,
              size: 16, color: Color(0xFF9AA3B1)),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              hintText,
              style: const TextStyle(
                fontSize: 13,
                color: Color(0xFF9AA3B1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _QuickRangeButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _QuickRangeButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF2A8BF2) : const Color(0xFFF6F7FB),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color:
                isSelected ? const Color(0xFF2A8BF2) : const Color(0xFFE0E4ED),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: isSelected ? Colors.white : const Color(0xFF566173),
          ),
        ),
      ),
    );
  }
}

class _DispatchOrderCard extends StatelessWidget {
  final WorkOrderSummary order;

  const _DispatchOrderCard({required this.order});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => WorkOrderDetailPage(order: order),
            ),
          );
        },
        child: Container(
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          order.customerName,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1B1D1F),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          order.projectName,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Color(0xFF6F7C8F),
                          ),
                        ),
                      ],
                    ),
                  ),
                  _DispatchStatusChip(
                    label: order.statusLabel,
                    color: order.statusColor,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              _DispatchInfoLine(label: '预约时间', value: order.appointmentTime),
              const SizedBox(height: 8),
              _DispatchInfoLine(label: '工单类型', value: order.orderType),
              const SizedBox(height: 8),
              _DispatchInfoLine(label: '工单编号', value: order.orderNumber),
              const SizedBox(height: 8),
              _DispatchInfoLine(label: '备件状态', value: order.spareStatus),
            ],
          ),
        ),
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
