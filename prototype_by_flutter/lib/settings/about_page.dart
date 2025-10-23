import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  static const String _policyText =
      '隐私政策\n生效日期：2023年03月30日\n\n本隐私政策适用于联想提供的“服务无忧”及其服务。我们重视您的隐私保护，并致力于向您说明我们如何收集、使用和保护您的个人信息。\n\n我们可能收集的个人信息包括：\n一、识别设备或账号的基本资料；\n二、与服务相关的客户信息；\n三、必要的联系方式；\n四、您在服务中的反馈及日志。\n\n我们如何使用数据：\n1. 保障产品功能与服务体验；\n2. 提供售后支持与客户关怀；\n3. 履行法律法规要求；\n4. 改进产品或服务。\n\n我们如何保护信息：\n• 采用行业标准的安全措施；\n• 对涉及隐私的访问进行严格控制；\n• 定期开展安全审计与培训。\n\n更多内容请参阅联想官方网站发布的《隐私声明》。';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F8),
      body: SafeArea(
        child: Column(
          children: [
            const _AboutHeader(),
            const SizedBox(height: 12),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(24),
                  ),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(20, 24, 20, 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Column(
                        children: const [
                          CircleAvatar(
                            radius: 40,
                            backgroundColor: Color(0xFFE8F0FF),
                            child: Icon(Icons.handyman,
                                size: 46, color: Color(0xFF2A8BF2)),
                          ),
                          SizedBox(height: 16),
                          Text(
                            '服务无忧',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF1B1D1F),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '版本号：1.4.8-22',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF7C8797),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF8F9FB),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: const Color(0xFFE2E7F0)),
                        ),
                        child: const Text(
                          _policyText,
                          style: TextStyle(
                            fontSize: 13,
                            height: 1.5,
                            color: Color(0xFF454C57),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AboutHeader extends StatelessWidget {
  const _AboutHeader();

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
              const _StatusBarMock(time: '20:36'),
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
                  '关于',
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
        const Icon(Icons.volume_off, color: Colors.white, size: 18),
      ],
    );
  }
}
