import 'package:flutter/material.dart';

class StudyView extends StatelessWidget {
  const StudyView({super.key});

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
        const Expanded(
          child: Text(
            '请选择知识分类',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFF9AA3B1),
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
