import 'package:flutter/material.dart';

class Profile {
  static const String name = 'Your Name';
  static const String role = 'Flutter Developer';
  static const String headline =
      'Flutter Developer crafting fast, beautiful cross-platform apps.';
  static const String subhead =
      '2.5+ years of industry experience · 17+ apps shipped to Play Store & App Store.';
  static const String email = 'your.email@example.com';
  static const String linkedin = 'https://linkedin.com/in/your-handle';
  static const String github = 'https://github.com/your-handle';
  static const String resumeUrl = '#';

  static const String about =
      "I'm a Flutter developer with 2.5+ years of hands-on industry experience building production-grade mobile applications for startups and agencies. My journey began at NEXTGEN INNOVATION LTD, where I spent 11 months shipping client apps and learning the fundamentals of mobile delivery at scale. I then joined Betopia Group for 8 months, deepening my expertise in scalable architectures, third-party integrations, and team collaboration. Today, I work at Ilmify Tech Agency, leading Flutter development across multiple client engagements.\n\nAcross these roles I've delivered 17–18 apps, several of which are live on the Google Play Store and Apple App Store, serving real users daily. I care about clean architecture, smooth UI, and code that survives the next sprint.";
}

class Stat {
  final String value;
  final String label;
  const Stat(this.value, this.label);
}

const List<Stat> stats = [
  Stat('2.5+', 'Years experience'),
  Stat('17+', 'Apps built'),
  Stat('3', 'Companies'),
  Stat('5+', 'Live on stores'),
];

class SkillGroup {
  final String title;
  final IconData icon;
  final List<String> items;
  const SkillGroup({required this.title, required this.icon, required this.items});
}

const List<SkillGroup> skillGroups = [
  SkillGroup(
    title: 'Core',
    icon: Icons.flutter_dash,
    items: ['Flutter', 'Dart', 'Cross-platform mobile development'],
  ),
  SkillGroup(
    title: 'State Management',
    icon: Icons.account_tree_outlined,
    items: ['Provider', 'Riverpod', 'BLoC / Cubit', 'GetX'],
  ),
  SkillGroup(
    title: 'Backend & Data',
    icon: Icons.cloud_outlined,
    items: [
      'Firebase (Auth, Firestore, FCM, Storage)',
      'REST APIs',
      'GraphQL',
      'SQLite',
      'Hive',
      'Shared Preferences',
    ],
  ),
  SkillGroup(
    title: 'Tools & Workflow',
    icon: Icons.build_outlined,
    items: [
      'Git / GitHub',
      'CI/CD (Codemagic, GitHub Actions)',
      'Play Console',
      'App Store Connect',
      'Figma → Flutter',
    ],
  ),
  SkillGroup(
    title: 'Additional',
    icon: Icons.auto_awesome_outlined,
    items: [
      'Responsive UI/UX',
      'Animations',
      'Push Notifications',
      'In-app Purchases',
      'Google Maps',
      'Stripe / PayPal',
      'Social Auth',
      'Localization',
    ],
  ),
];

class Project {
  final String name;
  final String category;
  final String description;
  final List<String> stack;
  final String? playStoreUrl;
  final String? appStoreUrl;
  final IconData icon;
  final Color accent;
  const Project({
    required this.name,
    required this.category,
    required this.description,
    required this.stack,
    this.playStoreUrl,
    this.appStoreUrl,
    required this.icon,
    required this.accent,
  });
}

const List<Project> projects = [
  Project(
    name: 'FinTrack Wallet',
    category: 'Fintech',
    description:
        'A personal finance app with real-time expense tracking, budgeting, and bank account integration. Serving thousands of active users.',
    stack: ['Flutter', 'Firebase', 'Riverpod', 'REST API'],
    playStoreUrl: 'https://play.google.com',
    appStoreUrl: 'https://apps.apple.com',
    icon: Icons.account_balance_wallet_outlined,
    accent: Color(0xFF02C39A),
  ),
  Project(
    name: 'ShopVerse',
    category: 'E-commerce',
    description:
        'Full-featured marketplace app with Stripe checkout, product reviews, push notifications, and order tracking.',
    stack: ['Flutter', 'BLoC', 'Firebase', 'Stripe'],
    playStoreUrl: 'https://play.google.com',
    icon: Icons.shopping_bag_outlined,
    accent: Color(0xFFFF7A59),
  ),
  Project(
    name: 'MediCare Plus',
    category: 'Health',
    description:
        'Telemedicine platform connecting patients with doctors via in-app chat, video calls, and appointment booking.',
    stack: ['Flutter', 'GetX', 'Agora SDK', 'REST API'],
    playStoreUrl: 'https://play.google.com',
    appStoreUrl: 'https://apps.apple.com',
    icon: Icons.health_and_safety_outlined,
    accent: Color(0xFF4D8BF8),
  ),
  Project(
    name: 'FoodDash',
    category: 'Food Delivery',
    description:
        'On-demand food delivery app with live order tracking, multi-vendor support, and integrated payments.',
    stack: ['Flutter', 'Provider', 'Google Maps', 'Firebase'],
    playStoreUrl: 'https://play.google.com',
    icon: Icons.restaurant_outlined,
    accent: Color(0xFFFFB020),
  ),
  Project(
    name: 'EduLearn',
    category: 'EdTech',
    description:
        'Online learning app with video lessons, quizzes, progress tracking, and offline content support.',
    stack: ['Flutter', 'BLoC', 'Firebase', 'Hive'],
    playStoreUrl: 'https://play.google.com',
    icon: Icons.school_outlined,
    accent: Color(0xFFB084FF),
  ),
  Project(
    name: 'FitPulse',
    category: 'Fitness',
    description:
        'Workout and nutrition tracker with custom plans, wearable sync, and social challenges.',
    stack: ['Flutter', 'Riverpod', 'HealthKit', 'REST API'],
    icon: Icons.fitness_center_outlined,
    accent: Color(0xFFFF4D7E),
  ),
];

class ExperienceEntry {
  final String company;
  final String role;
  final String duration;
  final String period;
  final List<String> highlights;
  final List<String> stack;
  final bool current;
  const ExperienceEntry({
    required this.company,
    required this.role,
    required this.duration,
    required this.period,
    required this.highlights,
    required this.stack,
    this.current = false,
  });
}

const List<ExperienceEntry> experience = [
  ExperienceEntry(
    company: 'Ilmify Tech Agency',
    role: 'Flutter Developer',
    duration: 'Current',
    period: 'Present',
    current: true,
    highlights: [
      'Leading Flutter development across multiple client engagements',
      'Architecting scalable cross-platform apps from concept to store release',
      'Mentoring junior developers on Flutter best practices',
    ],
    stack: ['Flutter', 'Firebase', 'REST APIs', 'BLoC', 'Riverpod'],
  ),
  ExperienceEntry(
    company: 'Betopia Group',
    role: 'Flutter Developer',
    duration: '8 months',
    period: 'Previous role',
    highlights: [
      'Shipped multiple production apps across fintech and e-commerce',
      'Integrated Stripe payments, push notifications, and deep linking',
      'Collaborated with designers and backend teams in agile sprints',
    ],
    stack: ['Flutter', 'GetX', 'Firebase', 'Stripe'],
  ),
  ExperienceEntry(
    company: 'NEXTGEN INNOVATION LTD',
    role: 'Junior Flutter Developer',
    duration: '11 months',
    period: 'First role',
    highlights: [
      'Built client apps end-to-end from Figma designs to store release',
      'Owned Play Store and App Store publishing pipelines',
      'Delivered features on tight client deadlines',
    ],
    stack: ['Flutter', 'Provider', 'REST APIs', 'Firebase'],
  ),
];
