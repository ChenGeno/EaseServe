import 'package:flutter/material.dart';

class EngineerBadge {
  final String name;
  final String badgeId;
  final String title;
  final String ratingLabel;
  final int serviceCount;
  final double ratingScore;
  final int experienceYears;
  final List<String> certifications;
  final String avatarAsset;

  const EngineerBadge({
    required this.name,
    required this.badgeId,
    required this.title,
    required this.ratingLabel,
    required this.serviceCount,
    required this.ratingScore,
    required this.experienceYears,
    required this.certifications,
    this.avatarAsset = 'assets/images/engineer_placeholder.png',
  });
}

class EngineerBadgePage extends StatelessWidget {
  final EngineerBadge badge;

  const EngineerBadgePage({super.key, required this.badge});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F8),
      body: SafeArea(
        child: Column(
          children: [
            _BadgeHeader(badge: badge),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 18, 16, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _EngineerInfoCard(badge: badge),
                    const SizedBox(height: 18),
                    _BasicInfoCard(badge: badge),
                    const SizedBox(height: 18),
                    _CertificationCard(certifications: badge.certifications),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BadgeHeader extends StatelessWidget {
  final EngineerBadge badge;

  const _BadgeHeader({required this.badge});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF0C7EF3), Color(0xFF43A2FF)],
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
              const _StatusBarMock(time: '15:30'),
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
                  '联想服务认证工程师',
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
                        size: 18,
                        color: Colors.white,
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

class _EngineerInfoCard extends StatelessWidget {
  final EngineerBadge badge;

  const _EngineerInfoCard({required this.badge});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        gradient: const LinearGradient(
          colors: [Color(0xFF0D7EF4), Color(0xFF53A9FF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A0D7EF4),
            blurRadius: 16,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _AvatarPlaceholder(asset: badge.avatarAsset),
              const SizedBox(width: 18),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      badge.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      badge.title,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.95),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.bookmark_outline,
                              size: 16, color: Color(0xFF0D7EF4)),
                          const SizedBox(width: 6),
                          Text(
                            badge.badgeId,
                            style: const TextStyle(
                              color: Color(0xFF0D7EF4),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Icon(Icons.military_tech,
                      color: Colors.white, size: 32),
                  SizedBox(height: 6),
                  Text(
                    '已实名认证',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _BasicInfoCard extends StatelessWidget {
  final EngineerBadge badge;

  const _BasicInfoCard({required this.badge});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: const [
          BoxShadow(
            color: Color(0x11000000),
            blurRadius: 16,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionTitle(title: '工程师基本信息'),
          const SizedBox(height: 18),
          _InfoRow(
            label: '级别：',
            value: badge.ratingLabel,
            trailingLabel: '服务点评次数：${badge.serviceCount}次',
          ),
          const SizedBox(height: 14),
          _InfoRow(
            label: '工龄：',
            value: '${badge.experienceYears}年',
            trailingWidget: _RatingStars(score: badge.ratingScore),
          ),
        ],
      ),
    );
  }
}

class _CertificationCard extends StatelessWidget {
  final List<String> certifications;

  const _CertificationCard({required this.certifications});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: const [
          BoxShadow(
            color: Color(0x11000000),
            blurRadius: 16,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionTitle(title: '工程师认证信息'),
          const SizedBox(height: 18),
          for (var i = 0; i < certifications.length; i++) ...[
            Row(
              children: [
                Container(
                  height: 44,
                  width: 44,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF0D7EF4), Color(0xFF53A9FF)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.shield_outlined,
                      color: Colors.white, size: 24),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Text(
                    certifications[i],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1B1D1F),
                    ),
                  ),
                ),
              ],
            ),
            if (i != certifications.length - 1)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 14),
                child: Divider(
                  height: 1,
                  color: Color(0xFFE6EBF5),
                ),
              ),
          ],
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  final String? trailingLabel;
  final Widget? trailingWidget;

  const _InfoRow({
    required this.label,
    required this.value,
    this.trailingLabel,
    this.trailingWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF4D5866),
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF1B1D1F),
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: 12),
        if (trailingLabel != null)
          Expanded(
            child: Text(
              trailingLabel!,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF4D5866),
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        if (trailingWidget != null) ...[
          const Spacer(),
          trailingWidget!,
        ],
      ],
    );
  }
}

class _RatingStars extends StatelessWidget {
  final double score;

  const _RatingStars({required this.score});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          5,
          (index) => Icon(
            index < score.floor()
                ? Icons.star
                : (index + 0.5 <= score ? Icons.star_half : Icons.star_border),
            size: 18,
            color: const Color(0xFFFFC120),
          ),
        ),
        const SizedBox(width: 6),
        Text(
          score.toStringAsFixed(1),
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1B1D1F),
          ),
        ),
      ],
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 18,
          decoration: BoxDecoration(
            color: const Color(0xFF0D7EF4),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1B1D1F),
          ),
        ),
      ],
    );
  }
}

class _AvatarPlaceholder extends StatelessWidget {
  final String asset;

  const _AvatarPlaceholder({required this.asset});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      width: 64,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: const Icon(
        Icons.person_outline,
        size: 36,
        color: Color(0xFF0D7EF4),
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
