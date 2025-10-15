import 'package:flutter/material.dart';

class AiHelperView extends StatelessWidget {
  const AiHelperView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const _AiHelperAppBar(),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
            child: Column(
              children: const [
                _AiWelcomeCard(),
              ],
            ),
          ),
        ),
        const _AiInputBar(),
      ],
    );
  }
}

class _AiHelperAppBar extends StatelessWidget {
  const _AiHelperAppBar();

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

class _AiWelcomeCard extends StatelessWidget {
  const _AiWelcomeCard();

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
              _AiExampleLink(label: '主板保外维修工单类型和子类型要开什么？'),
              _AiExampleLink(label: '服务单撤单注意事项'),
              _AiExampleLink(label: '我的店面这个月开始装修，需要装修3个月，怎么备案呢？'),
            ],
          ),
        ],
      ),
    );
  }
}

class _AiExampleLink extends StatelessWidget {
  final String label;

  const _AiExampleLink({required this.label});

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

class _AiInputBar extends StatelessWidget {
  const _AiInputBar();

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
