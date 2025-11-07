import 'package:flutter/material.dart';

void main() {
  runApp(const TruelifeApp());
}

class TruelifeApp extends StatelessWidget {
  const TruelifeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Truelife – Support Armenia',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFB91C1C),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const TruelifeHomePage(),
    );
  }
}

class TruelifeHomePage extends StatelessWidget {
  const TruelifeHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 700;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _TopBar(isMobile: isMobile),
            _HeroSection(isMobile: isMobile),
            const _AboutSection(),
            const _ProjectsSection(),
            const _FooterSection(),
          ],
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  final bool isMobile;
  const _TopBar({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 48,
        vertical: 16,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          )
        ],
      ),
      child: Row(
        children: [
          Row(
            children: [
              Container(
                height: 34,
                width: 34,
                decoration: BoxDecoration(
                  color: const Color(0xFFB91C1C),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Text(
                    'T',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              const Text(
                'Truelife',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const Spacer(),
          if (!isMobile)
            Row(
              children: [
                _TopButton(label: 'About', onTap: () {}),
                const SizedBox(width: 12),
                _TopButton(label: 'Projects', onTap: () {}),
                const SizedBox(width: 12),
                FilledButton(
                  onPressed: () {
                    // TODO: link to Stripe / donation page
                  },
                  child: const Text('Donate'),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class _TopButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _TopButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(label),
    );
  }
}

class _HeroSection extends StatelessWidget {
  final bool isMobile;
  const _HeroSection({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 48,
        vertical: isMobile ? 32 : 64,
      ),
      child: Flex(
        direction: isMobile ? Axis.vertical : Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: isMobile ? double.infinity : 460,
            child: Column(
              crossAxisAlignment:
              isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
              children: [
                Text(
                  'Truelife – Help Armenia Today',
                  textAlign: isMobile ? TextAlign.center : TextAlign.start,
                  style: TextStyle(
                    fontSize: isMobile ? 30 : 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'A secure donation platform that connects supporters around the world with real Armenian families and community projects.',
                  textAlign: isMobile ? TextAlign.center : TextAlign.start,
                  style: TextStyle(
                    fontSize: isMobile ? 15 : 17,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 20),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    FilledButton(
                      onPressed: () {
                        // TODO: Stripe link
                      },
                      child: const Text('now'),
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      child: const Text('Learn more'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 28),
          Expanded(
            child: Center(
              child: Container(
                height: 250,
                width: isMobile ? double.infinity : 360,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFFB91C1C),
                      Color(0xFFE11D48),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 12,
                      offset: Offset(0, 6),
                    )
                  ],
                ),
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Active campaign',
                        style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Winter Support for Families',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Your contribution helps provide food, medicine and essentials.',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Spacer(),
                      LinearProgressIndicator(
                        value: 0.45,
                        backgroundColor: Colors.white24,
                        color: Colors.white,
                      ),
                      SizedBox(height: 10),
                      Text(
                        '\$4,500 raised of \$10,000 goal',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AboutSection extends StatelessWidget {
  const _AboutSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text(
            'Why Truelife?',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Truelife focuses on transparency and direct help. We make it easy to donate from anywhere and be sure your support reaches Armenian people and projects.',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _ProjectsSection extends StatelessWidget {
  const _ProjectsSection();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 700;

    return Container(
      color: const Color(0xFFF9FAFB),
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Featured projects',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 20),
          Flex(
            direction: isMobile ? Axis.vertical : Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              _ProjectCard(
                title: 'Families in need',
                description:
                'Monthly support for displaced and low-income Armenian families.',
              ),
              SizedBox(height: 16),
              _ProjectCard(
                title: 'Education & kids',
                description:
                'Support educational programs, supplies and safe spaces for kids.',
              ),
              SizedBox(height: 16),
              _ProjectCard(
                title: 'Emergency aid',
                description:
                'Quick donations for urgent medical and housing needs.',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  const _ProjectCard({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 4),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            Text(description),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {},
              child: const Text('Donate →'),
            )
          ],
        ),
      ),
    );
  }
}

class _FooterSection extends StatelessWidget {
  const _FooterSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF111827),
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
      width: double.infinity,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Truelife • Armenia',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8),
          Text(
            '© 2025 Truelife. All rights reserved.',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
