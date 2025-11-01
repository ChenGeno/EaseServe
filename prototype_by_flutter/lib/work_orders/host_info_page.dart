import 'package:flutter/material.dart';

class HostInfoPage extends StatefulWidget {
  const HostInfoPage({super.key});

  @override
  State<HostInfoPage> createState() => _HostInfoPageState();
}

class _HostInfoPageState extends State<HostInfoPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  final TextEditingController _serialController = TextEditingController();
  bool _showPackingResult = false;
  bool _showSearchBar = false;
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  bool _pendingOpenSearch = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabChange);
    _searchController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabChange);
    _tabController.dispose();
    _serialController.dispose();
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  void _handleTabChange() {
    if (_tabController.index != 1 && _showSearchBar) {
      setState(() {
        _showSearchBar = false;
        _searchController.clear();
        _searchFocusNode.unfocus();
      });
    } else if (_tabController.index == 1) {
      if (_pendingOpenSearch) {
        _pendingOpenSearch = false;
        _toggleSearchBar();
      } else if (_showSearchBar) {
        _searchFocusNode.requestFocus();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F8),
      body: SafeArea(
        child: Column(
          children: [
            _HostInfoHeader(onSearchTap: _toggleSearchBar),
            const SizedBox(height: 12),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                child: Column(
                  children: [
                    if (_showSearchBar)
                      _SearchBar(
                        controller: _searchController,
                        focusNode: _searchFocusNode,
                        onClose: _toggleSearchBar,
                      ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                      child: TabBar(
                        controller: _tabController,
                        labelColor: const Color(0xFF2A8BF2),
                        unselectedLabelColor: const Color(0xFF8C96A4),
                        indicatorColor: const Color(0xFF2A8BF2),
                        indicatorWeight: 3,
                        labelStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                        unselectedLabelStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                        tabs: const [
                          Tab(text: '主机信息'),
                          Tab(text: '装箱单'),
                        ],
                      ),
                    ),
                    const Divider(height: 1, color: Color(0xFFE5E9F0)),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          _HostInfoTab(controller: _serialController),
                          _PackingListTab(
                            controller: _serialController,
                            showResult: _showPackingResult,
                            keyword: _searchController.text.trim(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _QueryButton(onPressed: _handleQuery),
          ],
        ),
      ),
    );
  }

  void _handleQuery() {
    final hasInput = _serialController.text.trim().isNotEmpty;
    final messenger = ScaffoldMessenger.of(context);
    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(hasInput ? '查询中...' : '请输入产品序列号'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    if (!hasInput) return;

    setState(() {
      _showPackingResult = true;
      if (_tabController.index == 1) {
        _showSearchBar = true;
        _searchFocusNode.requestFocus();
      }
    });
  }

  void _toggleSearchBar() {
    if (_tabController.index != 1) {
      _pendingOpenSearch = true;
      _tabController.animateTo(1);
      return;
    }
    setState(() {
      _showSearchBar = !_showSearchBar;
      if (_showSearchBar) {
        _searchFocusNode.requestFocus();
      } else {
        _searchController.clear();
        _searchFocusNode.unfocus();
      }
    });
  }
}

class _HostInfoHeader extends StatelessWidget {
  final VoidCallback onSearchTap;

  const _HostInfoHeader({required this.onSearchTap});

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
              const _StatusBarMock(time: '18:53'),
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
                  '主机信息',
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
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: onSearchTap,
                    child: Container(
                      height: 32,
                      width: 32,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.25),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.search, color: Colors.white),
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

class _HostInfoTab extends StatelessWidget {
  final TextEditingController controller;

  const _HostInfoTab({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _InputField(
            controller: controller,
            hintText: '产品序列号',
          ),
          const SizedBox(height: 24),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFF9FAFC),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFE6EAF1)),
              ),
              child: const Center(
                child: Text(
                  '请先输入产品序列号查询相关信息',
                  style: TextStyle(
                    color: Color(0xFF9AA3B1),
                    fontSize: 14,
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

class _PackingListTab extends StatelessWidget {
  final TextEditingController controller;
  final bool showResult;
  final String keyword;

  const _PackingListTab({
    required this.controller,
    required this.showResult,
    required this.keyword,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _InputField(
            controller: controller,
            hintText: '装箱单编号',
          ),
          const SizedBox(height: 24),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFF9FAFC),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFE6EAF1)),
              ),
              child: showResult
                  ? _PackingResultView(keyword: keyword)
                  : const _PlaceholderContent(),
            ),
          ),
        ],
      ),
    );
  }
}

class _PackingResultView extends StatelessWidget {
  final String keyword;

  const _PackingResultView({required this.keyword});

  static const List<_PartData> _parts = [
    _PartData(
      type: '部件类型：内存',
      code: '部件编号：SM30N76484',
      name: '部件名称：MEMORY 4GB DDR4 26U M378A5244CBO-CTD',
    ),
    _PartData(
      type: '部件类型：硬盘',
      code: '部件编号：SH20K17927',
      name: '部件名称：HDD ASM WD XL1000C 3.5 1TB 7200 HDD',
    ),
    _PartData(
      type: '部件类型：电源',
      code: '部件编号：SP50H29576',
      name: '部件名称：PA-2181-1VC 180W LC LN PSU',
    ),
    _PartData(
      type: '部件类型：CPU',
      code: '部件编号：SSA0T81778',
      name: '部件名称：SP I i5-9400 2.9GHz/6C/9M 65W U0 SR3X5',
    ),
    _PartData(
      type: '部件类型：机箱',
      code: '部件编号：SC80U47787',
      name: '部件名称：CHASSIS Chassis JTB LX-332JT',
    ),
    _PartData(
      type: '部件类型：主板',
      code: '部件编号：SPP0V33640',
      name: '部件名称：PIPELINE 5B20U53860 MB FRU WIN DPK',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 18),
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFE6EAF1)),
          ),
          padding: const EdgeInsets.fromLTRB(18, 16, 18, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'M70GBATL',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1B1D1F),
                ),
              ),
              SizedBox(height: 14),
              Text(
                '历史维修记录',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF6F7C8F),
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 12),
              Text(
                '暂无记录',
                style: TextStyle(
                  fontSize: 13,
                  color: Color(0xFF9AA3B1),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        const Center(
          child: Text(
            '查询结果',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1B1D1F),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Column(
          children: const [
            Icon(Icons.error_outline, color: Color(0xFFE05454), size: 56),
            SizedBox(height: 8),
            Text(
              '无对应记录',
              style: TextStyle(
                color: Color(0xFFE05454),
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 28),
        const Text(
          '装箱单',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1B1D1F),
          ),
        ),
        const SizedBox(height: 16),
        ...List.generate(_parts.length * 2 - 1, (index) {
          if (index.isOdd) {
            return const SizedBox(height: 12);
          }
          return _PartDetail(
            type: _parts[index ~/ 2].type,
            code: _parts[index ~/ 2].code,
            name: _parts[index ~/ 2].name,
            keyword: keyword,
          );
        }),
      ],
    );
  }
}

class _PartData {
  final String type;
  final String code;
  final String name;

  const _PartData({required this.type, required this.code, required this.name});
}

class _InputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const _InputField({
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F5F8),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE3E7ED)),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: const TextStyle(
                  color: Color(0xFFB2B9C6),
                  fontSize: 14,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.qr_code_scanner_outlined,
                color: Color(0xFF2A8BF2)),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class _PlaceholderContent extends StatelessWidget {
  const _PlaceholderContent();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        '请先输入装箱单编号查询相关信息',
        style: TextStyle(
          color: Color(0xFF9AA3B1),
          fontSize: 14,
        ),
      ),
    );
  }
}

class _QueryButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _QueryButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
      child: SizedBox(
        height: 48,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF2A8BF2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: const Text(
            '查询',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
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

class _PartDetail extends StatelessWidget {
  final String type;
  final String code;
  final String name;
  final String keyword;

  const _PartDetail({
    required this.type,
    required this.code,
    required this.name,
    this.keyword = '',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(18, 16, 18, 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE6EAF1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _HighlightedText(text: type, keyword: keyword),
          const SizedBox(height: 8),
          _HighlightedText(text: code, keyword: keyword),
          const SizedBox(height: 8),
          _HighlightedText(
            text: name,
            keyword: keyword,
            highlightColor: const Color(0xFF2A8BF2),
            baseColor: const Color(0xFF1B1D1F),
            baseWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final VoidCallback onClose;

  const _SearchBar({
    required this.controller,
    required this.focusNode,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Color(0xFFE5E9F0), width: 1),
        ),
      ),
      child: Row(
        children: [
          TextButton(
            onPressed: onClose,
            child: const Text(
              '关闭',
              style: TextStyle(
                color: Color(0xFF2A8BF2),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Container(
              height: 36,
              decoration: BoxDecoration(
                color: const Color(0xFFF3F5F8),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: const Color(0xFFE0E6F1)),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Center(
                child: TextField(
                  controller: controller,
                  focusNode: focusNode,
                  decoration: const InputDecoration(
                    hintText: '请输入关键字',
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      color: Color(0xFF9AA3B1),
                      fontSize: 14,
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF1B1D1F),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            height: 36,
            width: 36,
            decoration: BoxDecoration(
              color: const Color(0xFF2A8BF2),
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Icon(Icons.search, color: Colors.white, size: 20),
          ),
        ],
      ),
    );
  }
}

class _HighlightedText extends StatelessWidget {
  final String text;
  final String keyword;
  final Color highlightColor;
  final Color baseColor;
  final FontWeight baseWeight;

  const _HighlightedText({
    required this.text,
    required this.keyword,
    this.highlightColor = const Color(0xFFFFC120),
    this.baseColor = const Color(0xFF6F7C8F),
    this.baseWeight = FontWeight.w600,
  });

  @override
  Widget build(BuildContext context) {
    if (keyword.isEmpty) {
      return Text(
        text,
        style: TextStyle(
          fontSize: 14,
          fontWeight: baseWeight,
          color: baseColor,
        ),
      );
    }

    final lowerText = text.toLowerCase();
    final lowerKeyword = keyword.toLowerCase();

    if (!lowerText.contains(lowerKeyword)) {
      return Text(
        text,
        style: TextStyle(
          fontSize: 14,
          fontWeight: baseWeight,
          color: baseColor,
        ),
      );
    }

    final spans = <TextSpan>[];
    int start = 0;
    int index;
    while ((index = lowerText.indexOf(lowerKeyword, start)) != -1) {
      if (index > start) {
        spans.add(TextSpan(
          text: text.substring(start, index),
          style: TextStyle(
            fontSize: 14,
            fontWeight: baseWeight,
            color: baseColor,
          ),
        ));
      }
      spans.add(TextSpan(
        text: text.substring(index, index + keyword.length),
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: highlightColor,
        ),
      ));
      start = index + keyword.length;
    }
    if (start < text.length) {
      spans.add(TextSpan(
        text: text.substring(start),
        style: TextStyle(
          fontSize: 14,
          fontWeight: baseWeight,
          color: baseColor,
        ),
      ));
    }

    return RichText(text: TextSpan(children: spans));
  }
}
