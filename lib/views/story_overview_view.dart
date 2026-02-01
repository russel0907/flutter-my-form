import 'package:flutter/material.dart';

class StoryOverviewView extends StatelessWidget {
  const StoryOverviewView({super.key});

  @override
  Widget build(BuildContext context) {
    // Example data (replace with your real story data later)
    const storyTitle = "The Lion’s Whisker";
    const summary = "A woman seeks a magical lion’s whisker to\nheal her troubled marriage.";
    const cultural = "A traditional Ethiopian folktale about perseverance,\npatience, and love.";
    const tags = ["Africa", "Ethiopia"];
    const readingTime = "8 Minutes";

    return Scaffold(
      backgroundColor: const Color(0xFFF5F1EA),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // COVER IMAGE + TITLE OVERLAY
              _CoverHeader(
                title: storyTitle,
                imagePath: 'assets/images/The Lion’s Whisker.png', // <-- your image
              ),

              // CONTENT CARD
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(16, 18, 16, 18),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF7F3ED),
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _SectionTitle("Story Summary"),
                      const SizedBox(height: 10),
                      Text(
                        summary,
                        style: const TextStyle(
                          fontSize: 15,
                          height: 1.5,
                          color: Color(0xFF3E3E3E),
                        ),
                      ),
                      const SizedBox(height: 18),
                      const Divider(height: 1),

                      const SizedBox(height: 18),
                      _SectionTitle("Cultural Context"),
                      const SizedBox(height: 10),
                      Text(
                        cultural,
                        style: const TextStyle(
                          fontSize: 15,
                          height: 1.5,
                          color: Color(0xFF3E3E3E),
                        ),
                      ),

                      const SizedBox(height: 18),
                      const Divider(height: 1),

                      const SizedBox(height: 16),

                      // TAGS
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: tags
                            .map((t) => _TagChip(text: t))
                            .toList(),
                      ),

                      const SizedBox(height: 16),

                      // READING TIME
                      Row(
                        children: const [
                          Icon(Icons.access_time, size: 18, color: Color(0xFF666666)),
                          SizedBox(width: 8),
                          Text(
                            "Reading Time: 8 Minutes",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF666666),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 18),

                      // BUTTONS
                      _PrimaryButton(
                        text: "Start Story",
                        icon: Icons.play_arrow_rounded,
                        color: const Color(0xFF2E7D32), // green
                        onPressed: () {
                          // TODO: start story
                        },
                      ),
                      const SizedBox(height: 12),
                      _PrimaryButton(
                        text: "Download for Offline",
                        icon: Icons.download_rounded,
                        color: const Color(0xFF1E5AA8), // blue
                        onPressed: () {
                          // TODO: download story
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CoverHeader extends StatelessWidget {
  final String title;
  final String imagePath;

  const _CoverHeader({
    required this.title,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Image
        SizedBox(
          height: 240,
          width: double.infinity,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),

        // Dark gradient for text readability
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withOpacity(0.65),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),

        // Back button
        Positioned(
          top: 12,
          left: 12,
          child: _RoundIconButton(
            icon: Icons.arrow_back_ios_new_rounded,
            onPressed: () => Navigator.pop(context),
          ),
        ),

        // Title
        Positioned(
          left: 16,
          right: 16,
          bottom: 18,
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              height: 1.05,
            ),
          ),
        ),
      ],
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String text;
  const _SectionTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: Color(0xFF3A3A3A),
      ),
    );
  }
}

class _TagChip extends StatelessWidget {
  final String text;
  const _TagChip({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFDAD6CC),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFF2F5A3F),
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _PrimaryButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  const _PrimaryButton({
    required this.text,
    required this.icon,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: double.infinity,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 6,
        ),
        onPressed: onPressed,
        icon: Icon(icon, size: 26, color: Colors.white),
        label: Text(
          text,
          style: const TextStyle(
            fontSize: 16.5,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class _RoundIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _RoundIconButton({
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withOpacity(0.35),
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onPressed,
        child: const SizedBox(
          width: 44,
          height: 44,
          child: Center(
            child: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
