import 'package:flutter/material.dart';
import 'package:my_app/views/home_view.dart';

class PermissionPromptView extends StatelessWidget {
  const PermissionPromptView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            padding: const EdgeInsets.fromLTRB(20, 24, 20, 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(28),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 20,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Title
                const Text(
                  'Enjoy Offline Downloads?',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF3D5A80),
                  ),
                ),

                const SizedBox(height: 12),
                const Divider(),

                const SizedBox(height: 12),

                // Subtitle
                const Text(
                  'Save content for offline use and\nchoose your language preference.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.5,
                    color: Color(0xFF7A7A7A),
                  ),
                ),

                const SizedBox(height: 24),

                // Icons row
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _FeatureIcon(
                      image: 'assets/images/download_icon.png',
                      label: 'Download Content',
                    ),
                    _FeatureIcon(
                      image: 'assets/images/language_icon.png',
                      label: 'Language Selection',
                    ),
                  ],
                ),

                const SizedBox(height: 24),
                const Divider(),

                // Options list
                const _OptionItem(
                  title: 'Enable Offline Downloads',
                  subtitle: 'Save videos & music for offline viewing.',
                ),
                const _OptionItem(
                  title: 'Choose Your Language',
                  subtitle: 'Select your preferred language setting.',
                ),

                const SizedBox(height: 20),

                // Buttons
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.grey,
                          side: const BorderSide(color: Colors.grey),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const HomeView(),
                            ),
                          );
                        },
                        child: const Text('Not Now'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          foregroundColor: const Color(0xFF3F7FC0),
                          side: const BorderSide(color: Color(0xFF3F7FC0)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        onPressed: () {
                          // Open options / settings
                        },
                        child: const Text('Options'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF3F7FC0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        onPressed: () {
                          // Request permissions / continue
                        },
                        child: const Text(
                          'Continue',
                          style: TextStyle(color: Colors.white),
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
    );
  }
}

/// --- Small components ---

class _FeatureIcon extends StatelessWidget {
  final String image;
  final String label;

  const _FeatureIcon({
    required this.image,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(image, height: 64),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            color: Color(0xFF6B7280),
          ),
        ),
      ],
    );
  }
}

class _OptionItem extends StatelessWidget {
  final String title;
  final String subtitle;

  const _OptionItem({
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.check_circle, color: Color(0xFF3F7FC0)),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(fontSize: 13),
      ),
      contentPadding: EdgeInsets.zero,
    );
  }
}
