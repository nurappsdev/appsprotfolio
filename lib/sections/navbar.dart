import 'package:flutter/material.dart';
import '../theme.dart';

class NavBar extends StatelessWidget {
  final void Function(String) onNavigate;
  const NavBar({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);
    final items = ['About', 'Skills', 'Work', 'Experience', 'Contact'];

    return Container(
      decoration: BoxDecoration(
        color: AppColors.bg.withValues(alpha: 0.85),
        border: const Border(bottom: BorderSide(color: AppColors.border)),
      ),
      padding: EdgeInsets.symmetric(horizontal: mobile ? 20 : 48, vertical: 18),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Row(
            children: [
              InkWell(
                onTap: () => onNavigate('hero'),
                child: Row(
                  children: const [
                    Icon(Icons.flutter_dash,
                        color: AppColors.accentBright, size: 26),
                    SizedBox(width: 10),
                    Text(
                      'devfolio',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              if (!mobile)
                Row(
                  children: [
                    for (final item in items)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        child: InkWell(
                          onTap: () => onNavigate(item.toLowerCase()),
                          child: Text(
                            item,
                            style: const TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    const SizedBox(width: 14),
                    ElevatedButton(
                      onPressed: () => onNavigate('contact'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.accentBright,
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 22, vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('Hire Me',
                          style: TextStyle(fontWeight: FontWeight.w600)),
                    ),
                  ],
                )
              else
                IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () => _showMenu(context, items),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _showMenu(BuildContext context, List<String> items) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.surface,
      builder: (_) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (final item in items)
              ListTile(
                title: Text(item),
                onTap: () {
                  Navigator.pop(context);
                  onNavigate(item.toLowerCase());
                },
              ),
          ],
        ),
      ),
    );
  }
}
