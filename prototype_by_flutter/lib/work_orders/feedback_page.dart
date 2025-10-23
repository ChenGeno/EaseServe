import 'package:flutter/material.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key});

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F8),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const _FeedbackHeader(),
            const SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(18, 18, 18, 24),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x12000000),
                            blurRadius: 18,
                            offset: Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '为了更好地改进我们的产品体验和服务，我们希望了解您的意见和建议',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF4D5866),
                              height: 1.5,
                            ),
                          ),
                          const SizedBox(height: 18),
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFFF7F8FA),
                              borderRadius: BorderRadius.circular(18),
                              border: Border.all(
                                color: const Color(0xFFE2E7F0),
                              ),
                            ),
                            padding: const EdgeInsets.all(16),
                            height: 220,
                            child: TextField(
                              controller: _controller,
                              maxLines: null,
                              expands: true,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: '欢迎吐槽...',
                                hintStyle: TextStyle(
                                  color: Color(0xFFB0B8C5),
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _FeedbackSubmitButton(onPressed: _handleSubmit),
          ],
        ),
      ),
    );
  }

  void _handleSubmit() {
    final text = _controller.text.trim();
    final messenger = ScaffoldMessenger.of(context);

    if (text.isEmpty) {
      messenger
        ..hideCurrentSnackBar()
        ..showSnackBar(
          const SnackBar(
            content: Text('请先填写您的意见或建议'),
            behavior: SnackBarBehavior.floating,
          ),
        );
      return;
    }

    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(
        const SnackBar(
          content: Text('感谢反馈，我们会尽快处理'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    _controller.clear();
  }
}

class _FeedbackHeader extends StatelessWidget {
  const _FeedbackHeader();

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
              const _StatusBarMock(time: '15:48'),
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
                  '意见反馈',
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

class _FeedbackSubmitButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _FeedbackSubmitButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
      child: SizedBox(
        height: 48,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF2A8BF2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: const Text(
            '提交',
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
