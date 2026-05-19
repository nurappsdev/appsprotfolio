import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
import '../theme.dart';
import '../widgets/section.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onViewWork;
  final VoidCallback onContact;
  const HeroSection({
    super.key,
    required this.onViewWork,
    required this.onContact,
  });

  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);
    return SectionContainer(
      padding: EdgeInsets.symmetric(
        horizontal: mobile ? 20 : 48,
        vertical: mobile ? 64 : 120,
      ),
      child: Flex(
        direction: mobile ? Axis.vertical : Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: mobile ? 0 : 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    color: AppColors.accent.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(99),
                    border: Border.all(
                        color: AppColors.accent.withValues(alpha: 0.4)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.circle, color: Color(0xFF22C55E), size: 8),
                      SizedBox(width: 8),
                      Text(
                        'Available for new projects',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 28),
                Text(
                  Profile.headline,
                  style: TextStyle(
                    fontSize: mobile ? 36 : 60,
                    fontWeight: FontWeight.w800,
                    height: 1.05,
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  Profile.subhead,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 18,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 36),
                Wrap(
                  spacing: 14,
                  runSpacing: 14,
                  children: [
                    ElevatedButton.icon(
                      onPressed: onViewWork,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.accentBright,
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 26, vertical: 20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      icon: const Icon(Icons.arrow_forward),
                      label: const Text('View My Work',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600)),
                    ),
                    OutlinedButton.icon(
                      onPressed: onContact,
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.textPrimary,
                        side: const BorderSide(color: AppColors.border),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 26, vertical: 20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      icon: const Icon(Icons.mail_outline),
                      label: const Text('Hire Me',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
                const SizedBox(height: 56),
                _StatsRow(),
              ],
            ),
          ),
          if (!mobile) const SizedBox(width: 60),
          if (!mobile)
            Expanded(
              flex: 4,
              child: _HeroVisual(),
            ),
        ],
      ),
    );
  }
}

class _StatsRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 36,
      runSpacing: 24,
      children: [
        for (final s in stats)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                s.value,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: AppColors.accentBright,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                s.label,
                style: const TextStyle(
                    color: AppColors.textSecondary, fontSize: 13),
              ),
            ],
          ),
      ],
    );
  }
}

class _HeroVisual extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [
                  AppColors.accent.withValues(alpha: 0.35),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          Container(
            width: 280,
            height: 540,
            decoration: BoxDecoration(
              color: AppColors.surfaceAlt,
              borderRadius: BorderRadius.circular(40),
              border: Border.all(color: AppColors.border, width: 2),
              boxShadow: [
                BoxShadow(
                  color: AppColors.accentBright.withValues(alpha: 0.2),
                  blurRadius: 60,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(36),
              child: Column(
                children: [
                  Container(height: 28, color: Colors.black),
                  Expanded(
                    child: Container(
                      color: AppColors.surface,
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Hello,',
                            style: TextStyle(
                                color: AppColors.textSecondary, fontSize: 14),
                          ),
                          const SizedBox(height: 6),
                          const Text(
                            'I build Flutter apps.',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 24),
                          for (final c in [
                            AppColors.accentBright,
                            const Color(0xFF02C39A),
                            const Color(0xFFFF7A59),
                            const Color(0xFFB084FF),
                          ])
                            Container(
                              margin: const EdgeInsets.only(bottom: 12),
                              height: 56,
                              decoration: BoxDecoration(
                                color: c.withValues(alpha: 0.15),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                    color: c.withValues(alpha: 0.4)),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 14),
                              child: Row(
                                children: [
                                  Container(
                                    width: 32,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      color: c.withValues(alpha: 0.3),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 8,
                                          width: 100,
                                          color: AppColors.border,
                                        ),
                                        const SizedBox(height: 6),
                                        Container(
                                          height: 6,
                                          width: 60,
                                          color: AppColors.border
                                              .withValues(alpha: 0.6),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
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
