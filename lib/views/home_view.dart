import 'package:flutter/material.dart';
import 'package:my_app/views/story_overview_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/home_bg.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        extendBody: true,
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _header(),
                const SizedBox(height: 24),

                const Text(
                  'Continue Last Story',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 28),

                /// 1️⃣ Continue Last Story
                _storyCard(
                  context: context,
                  title: 'The Enchanted Journey',
                  subtitle: 'Continue Your Adventure',
                  buttonText: 'Resume',
                ),

                const SizedBox(height: 28),

                /// 2️⃣ Suggested Story
                const Text(
                  'Suggested Story',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 12),

                _storyCard(
                  context: context,
                  title: 'Realm of the Lost Isles',
                  subtitle: 'Discover a Hidden World',
                  buttonText: 'Start',
                ),

                const SizedBox(height: 28),

                /// 3️⃣ Your Progress
                _progressCard(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: _bottomNav(),
      ),
    );
  }

  /// 🔝 Header
  Widget _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Icon(Icons.notifications_none, color: Colors.white, size: 26),
        Text(
          'Storyteller',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        Icon(Icons.settings_outlined, color: Colors.white, size: 26),
      ],
    );
  }

  /// 📖 Story Card
  Widget _storyCard({
    required BuildContext context,
    required String title,
    required String subtitle,
    required String buttonText,
  }) {
    return Container(
      height: 190,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage('assets/images/$title.png'),
          fit: BoxFit.cover,
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 14,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Colors.black.withOpacity(0.7),
              Colors.transparent,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: const TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey.shade600,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const StoryOverviewView(),
                            ),
                          );
                },
                child: Text(
                    style: const TextStyle(color: Colors.white), buttonText),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 📊 Progress Card
  Widget _progressCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Your Progress',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              _StatItem(label: 'Stories', value: '8'),
              _StatItem(label: 'Achievements', value: '12'),
              _StatItem(label: 'Words', value: '24,350'),
            ],
          ),
          const SizedBox(height: 16),
          LinearProgressIndicator(
            value: 4 / 8,
            minHeight: 8,
            backgroundColor: Colors.grey.shade300,
            color: Colors.blueGrey,
            borderRadius: BorderRadius.circular(10),
          ),
          const SizedBox(height: 8),
          const Center(child: Text('Chapter 4 of 8')),
        ],
      ),
    );
  }

  /// ⬇️ Bottom Nav (UI only)
  Widget _bottomNav() {
    return BottomNavigationBar(
      currentIndex: 0,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Story'),
        BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
        BottomNavigationBarItem(
            icon: Icon(Icons.library_books), label: 'Collection'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}

class _StatItem extends StatelessWidget {
  final String label;
  final String value;

  const _StatItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
