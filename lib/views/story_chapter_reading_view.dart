import 'package:flutter/material.dart';

class StoryChapterReadingView extends StatefulWidget {
  const StoryChapterReadingView({super.key});

  @override
  State<StoryChapterReadingView> createState() => _StoryChapterReadingViewState();
}

class _StoryChapterReadingViewState extends State<StoryChapterReadingView> {
  double _progress = 0.42; // 42%
  double _fontSize = 18;

  @override
  Widget build(BuildContext context) {
    final percent = (_progress * 100).round();

    return Scaffold(
      backgroundColor: const Color(0xFF7FB5B0), // teal bg
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 520),
              decoration: BoxDecoration(
                color: const Color(0xFFF7F1E6), // paper
                borderRadius: BorderRadius.circular(28),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 22,
                    offset: Offset(0, 14),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(22, 22, 22, 18),
                child: Column(
                  children: [
                    // Top content scroll
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const SizedBox(height: 6),

                            // CHAPTER label line
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 1,
                                    color: Colors.black.withOpacity(0.08),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  'CHAPTER 5',
                                  style: TextStyle(
                                    letterSpacing: 2.4,
                                    fontSize: 12.5,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black.withOpacity(0.35),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Container(
                                    height: 1,
                                    color: Colors.black.withOpacity(0.08),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 18),

                            // Title
                            const Text(
                              'The Enchanted Forest',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 34,
                                height: 1.1,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF1F5E4A),
                              ),
                            ),

                            const SizedBox(height: 16),

                            // Divider ornament
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 84,
                                  height: 1,
                                  color: Colors.black.withOpacity(0.08),
                                ),
                                const SizedBox(width: 10),
                                Container(
                                  width: 6,
                                  height: 6,
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.12),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Container(
                                  width: 84,
                                  height: 1,
                                  color: Colors.black.withOpacity(0.08),
                                ),
                              ],
                            ),

                            const SizedBox(height: 22),

                            // Story text
                            _Paragraph(
                              text:
                                  'Aiden stepped cautiously into the forest, the mist swirling around him.',
                              fontSize: _fontSize,
                            ),
                            _Paragraph(
                              text:
                                  'The air was cool and filled with the scent of pine and wildflowers.',
                              fontSize: _fontSize,
                            ),
                            _Paragraph(
                              text:
                                  'Sunlight filtered through the dense canopy, casting dappled light on the moss-covered path ahead.',
                              fontSize: _fontSize,
                            ),
                            _Paragraph(
                              text:
                                  'He heard the distant call of a bird and the rustling of leaves. As he ventured deeper, he noticed strange, glowing flowers along the path, their petals shimmering with an otherworldly light.',
                              fontSize: _fontSize,
                            ),

                            const SizedBox(height: 18),
                          ],
                        ),
                      ),
                    ),

                    // Progress slider
                    Column(
                      children: [
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            trackHeight: 5,
                            activeTrackColor: const Color(0xFF7CB9A3),
                            inactiveTrackColor: Colors.black.withOpacity(0.10),
                            thumbColor: const Color(0xFF7CB9A3),
                            overlayColor: const Color(0xFF7CB9A3).withOpacity(0.18),
                            thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 9,
                            ),
                          ),
                          child: Slider(
                            value: _progress,
                            onChanged: (v) => setState(() => _progress = v),
                          ),
                        ),
                        Text(
                          '$percent%',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Colors.black.withOpacity(0.35),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    // Bottom controls (Aa + book icon)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _BottomIconButton(
                          label: 'Aa',
                          onTap: () {
                            _openFontSheet(context);
                          },
                        ),
                        _BottomIconButton(
                          icon: Icons.menu_book_rounded,
                          onTap: () {
                            // TODO: open chapters / bookmarks / table of contents
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _openFontSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return Container(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 22),
          decoration: const BoxDecoration(
            color: Color(0xFFF7F1E6),
            borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 38,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              const SizedBox(height: 14),
              const Text(
                'Text Size',
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
              ),
              const SizedBox(height: 10),
              Slider(
                min: 14,
                max: 26,
                value: _fontSize,
                onChanged: (v) => setState(() => _fontSize = v),
              ),
              Text(
                '${_fontSize.round()} px',
                style: TextStyle(color: Colors.black.withOpacity(0.55)),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _Paragraph extends StatelessWidget {
  final String text;
  final double fontSize;

  const _Paragraph({required this.text, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          height: 1.65,
          color: const Color(0xFF2F2F2F),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _BottomIconButton extends StatelessWidget {
  final String? label;
  final IconData? icon;
  final VoidCallback onTap;

  const _BottomIconButton({
    this.label,
    this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
        child: Row(
          children: [
            if (label != null)
              Text(
                label!,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Colors.black.withOpacity(0.35),
                ),
              )
            else
              Icon(
                icon,
                size: 30,
                color: Colors.black.withOpacity(0.30),
              ),
          ],
        ),
      ),
    );
  }
}
