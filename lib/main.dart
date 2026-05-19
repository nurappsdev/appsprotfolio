import 'package:flutter/material.dart';
import 'data/portfolio_data.dart';
import 'sections/about.dart';
import 'sections/contact.dart';
import 'sections/experience.dart';
import 'sections/hero.dart';
import 'sections/navbar.dart';
import 'sections/skills.dart';
import 'sections/work.dart';
import 'theme.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '${Profile.name} — ${Profile.role}',
      debugShowCheckedModeBanner: false,
      theme: buildAppTheme(),
      home: const PortfolioHome(),
    );
  }
}

class PortfolioHome extends StatefulWidget {
  const PortfolioHome({super.key});

  @override
  State<PortfolioHome> createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<PortfolioHome> {
  final _scrollController = ScrollController();
  final _aboutKey = GlobalKey();
  final _skillsKey = GlobalKey();
  final _workKey = GlobalKey();
  final _experienceKey = GlobalKey();
  final _contactKey = GlobalKey();

  void _scrollTo(String section) {
    final key = switch (section) {
      'about' => _aboutKey,
      'skills' => _skillsKey,
      'work' => _workKey,
      'experience' => _experienceKey,
      'contact' => _contactKey,
      _ => null,
    };
    if (key?.currentContext != null) {
      Scrollable.ensureVisible(
        key!.currentContext!,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOutCubic,
      );
    } else if (section == 'hero') {
      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          NavBar(onNavigate: _scrollTo),
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  HeroSection(
                    onViewWork: () => _scrollTo('work'),
                    onContact: () => _scrollTo('contact'),
                  ),
                  AboutSection(sectionKey: _aboutKey),
                  SkillsSection(sectionKey: _skillsKey),
                  WorkSection(sectionKey: _workKey),
                  ExperienceSection(sectionKey: _experienceKey),
                  ContactSection(sectionKey: _contactKey),
                  const Footer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
