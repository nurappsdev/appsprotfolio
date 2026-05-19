import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
import '../theme.dart';
import '../widgets/section.dart';

class ExperienceSection extends StatelessWidget {
  final GlobalKey sectionKey;
  const ExperienceSection({super.key, required this.sectionKey});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      sectionKey: sectionKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            overline: 'Experience',
            title: 'Career timeline.',
            subtitle:
                'Three companies, one consistent focus: shipping production Flutter apps.',
          ),
          for (var i = 0; i < experience.length; i++)
            _TimelineNode(
              entry: experience[i],
              isLast: i == experience.length - 1,
            ),
        ],
      ),
    );
  }
}

class _TimelineNode extends StatelessWidget {
  final ExperienceEntry entry;
  final bool isLast;
  const _TimelineNode({required this.entry, required this.isLast});

  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 16,
                height: 16,
                margin: const EdgeInsets.only(top: 6),
                decoration: BoxDecoration(
                  color: entry.current
                      ? AppColors.accentBright
                      : AppColors.surface,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.accentBright,
                    width: 2,
                  ),
                ),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    color: AppColors.border,
                  ),
                ),
            ],
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : 40),
              child: Container(
                padding: EdgeInsets.all(mobile ? 18 : 26),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: AppColors.border),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      spacing: 12,
                      runSpacing: 6,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text(
                          entry.company,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: entry.current
                                ? const Color(0xFF22C55E).withValues(alpha: 0.15)
                                : AppColors.surfaceAlt,
                            borderRadius: BorderRadius.circular(99),
                            border: Border.all(
                              color: entry.current
                                  ? const Color(0xFF22C55E)
                                      .withValues(alpha: 0.4)
                                  : AppColors.border,
                            ),
                          ),
                          child: Text(
                            entry.duration,
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: entry.current
                                  ? const Color(0xFF22C55E)
                                  : AppColors.textSecondary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '${entry.role} · ${entry.period}',
                      style: const TextStyle(
                          color: AppColors.textSecondary, fontSize: 14),
                    ),
                    const SizedBox(height: 16),
                    for (final h in entry.highlights)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 7),
                              child: Icon(Icons.circle,
                                  size: 5, color: AppColors.accentBright),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                h,
                                style: const TextStyle(
                                  color: AppColors.textPrimary,
                                  fontSize: 14,
                                  height: 1.55,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    const SizedBox(height: 14),
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: [
                        for (final s in entry.stack)
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              color: AppColors.bg,
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(color: AppColors.border),
                            ),
                            child: Text(
                              s,
                              style: const TextStyle(
                                fontSize: 11,
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
