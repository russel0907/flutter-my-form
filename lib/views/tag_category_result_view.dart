import 'package:flutter/material.dart';

class TagCategoryResultView extends StatefulWidget {
  const TagCategoryResultView({super.key});

  @override
  State<TagCategoryResultView> createState() => _TagCategoryResultViewState();
}

class _TagCategoryResultViewState extends State<TagCategoryResultView> {
  int selectedSort = 0;

  final sortOptions = ['Most Recent', 'Most Popular', 'Top Rated'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // AppBar
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFF1F2D4D)),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          'Travel Adventures',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1F2D4D),
          ),
        ),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Sort row (FIXED overflow)
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 6),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 8,
              runSpacing: 8,
              children: [
                const Text(
                  'Sort by:',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF5F6B7A),
                  ),
                ),
                ...List.generate(sortOptions.length, (i) {
                  final isSelected = selectedSort == i;
                  return ChoiceChip(
                    label: Text(sortOptions[i]),
                    selected: isSelected,
                    onSelected: (_) {
                      setState(() => selectedSort = i);
                    },
                    selectedColor: const Color(0xFFE7ECF5),
                    backgroundColor: const Color(0xFFF3F5F9),
                    labelStyle: TextStyle(
                      color: isSelected
                          ? const Color(0xFF1F2D4D)
                          : const Color(0xFF5F6B7A),
                      fontWeight:
                          isSelected ? FontWeight.w600 : FontWeight.w500,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  );
                }),
              ],
            ),
          ),

          const Divider(height: 1),

          // List
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 8),
              children: const [
                _ResultItem(
                  image: 'assets/images/alps.png',
                  title: 'Backpacking Through the Alps',
                  author: 'Emily Carter',
                  description:
                      'Exploring the stunning trails of the Swiss Alps.',
                ),
                _ResultItem(
                  image: 'assets/images/kenya.png',
                  title: 'A Safari in Kenya',
                  author: 'Mark Johnson',
                  description:
                      'An unforgettable journey through the savannah.',
                ),
                _ResultItem(
                  image: 'assets/images/cambodia.png',
                  title: 'Lost in the Ancient Temples of Cambodia',
                  author: 'Sarah Lee',
                  description:
                      'Adventures in the mystical ruins of Angkor Wat.',
                ),
                _ResultItem(
                  image: 'assets/images/pacific.png',
                  title: 'Road Trip Along the Pacific Coast',
                  author: 'Jason Miller',
                  description:
                      'Driving the scenic Highway 1 coastline.',
                ),
                _ResultItem(
                  image: 'assets/images/thailand.png',
                  title: 'Island Hopping in Thailand',
                  author: 'Alex Novak',
                  description:
                      'Discovering the beauty of tropical islands.',
                ),
                _ResultItem(
                  image: 'assets/images/tokyo.png',
                  title: 'The Streets of Tokyo at Night',
                  author: 'Rachel Kim',
                  description:
                      'Exploring the vibrant nightlife of Tokyo.',
                ),
              ],
            ),
          ),
        ],
      ),

      // Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        selectedItemColor: const Color(0xFF1F2D4D),
        unselectedItemColor: const Color(0xFF8A94A6),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(Icons.edit), label: 'Create'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

/// ─────────────────────────────────────────
/// Result Item
/// ─────────────────────────────────────────
class _ResultItem extends StatelessWidget {
  final String image;
  final String title;
  final String author;
  final String description;

  const _ResultItem({
    required this.image,
    required this.title,
    required this.author,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // TODO: navigate to story overview
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thumbnail
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                image,
                width: 72,
                height: 72,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(width: 12),

            // Text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1F2D4D),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'By $author',
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFF6C7A92),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF3A4458),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
