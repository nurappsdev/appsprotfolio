import 'package:flutter/material.dart';
import '../theme.dart';

class SectionContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final Color? background;
  final GlobalKey? sectionKey;

  const SectionContainer({
    super.key,
    required this.child,
    this.padding,
    this.background,
    this.sectionKey,
  });

  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);
    return Container(
      key: sectionKey,
      width: double.infinity,
      color: background,
      padding: padding ??
          EdgeInsets.symmetric(
            horizontal: mobile ? 20 : 48,
            vertical: mobile ? 64 : 96,
          ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: child,
        ),
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String overline;
  final String title;
  final String? subtitle;

  const SectionHeader({
    super.key,
    required this.overline,
    required this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          overline.toUpperCase(),
          style: const TextStyle(
            color: AppColors.accentBright,
            letterSpacing: 3,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          title,
          style: TextStyle(
            fontSize: mobile ? 30 : 42,
            fontWeight: FontWeight.w700,
            height: 1.15,
          ),
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 14),
          Text(
            subtitle!,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 16,
              height: 1.5,
            ),
          ),
        ],
        const SizedBox(height: 40),
      ],
    );
  }
}

class HoverScale extends StatefulWidget {
  final Widget child;
  const HoverScale({super.key, required this.child});

  @override
  State<HoverScale> createState() => _HoverScaleState();
}

class _HoverScaleState extends State<HoverScale> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.identity()
          ..translateByDouble(0.0, _hover ? -4.0 : 0.0, 0.0, 1.0),
        child: widget.child,
      ),
    );
  }
}
