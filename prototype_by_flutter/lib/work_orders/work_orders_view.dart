import 'package:flutter/material.dart';

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
      statusLabel: '待处理',
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
      statusLabel: '待预约',
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
      statusLabel: '已联系',
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
      statusLabel: '待确认',
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
            const _WorkOrderFilters(),
            const SizedBox(height: 16),
            _WorkOrderSection(orders: _inServiceOrders),
          ],
        );
      case 1:
        return const _WorkOrdersMessage(message: '已完成工单内容待补充');
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
        children: const [
          Icon(Icons.search, color: Color(0xFF9AA3B1)),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              '请输入工单编号',
              style: TextStyle(
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
