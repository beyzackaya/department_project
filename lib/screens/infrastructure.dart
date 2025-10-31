import 'package:flutter/material.dart';
import 'image_view.dart';

class InfrastructurePage extends StatelessWidget {
  const InfrastructurePage({super.key});

  final List<Map<String, String>> _rooms = const [
    {"name": "B7", "photo": "assets/amfi1.jpg"},
    {"name": "B6", "photo": "assets/amfi2.jpeg"},
    {"name": "Lab A", "photo": "assets/lab.jpg"},
    {"name": "Konferans Salonu", "photo": "assets/konferans.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: _rooms.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (context, i) {
        final r = _rooms[i];
        final tag = 'room_$i';
        return GestureDetector(
          onDoubleTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (_) => ImageViewPage(imageUrl: r['photo']!, tag: tag)));
          },
          child: Card(
            margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(children: [
                Hero(
                  tag: tag,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      r['photo']!,
                      width: 120,
                      height: 80,
                      fit: BoxFit.cover,
                      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                        if (wasSynchronouslyLoaded || frame != null) return child;
                        return Container(
                          width: 120,
                          height: 80,
                          color: Colors.grey[200],
                          child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset('assets/a.jpg', width: 120, height: 80, fit: BoxFit.cover);
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(r['name']!, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 6),
                    const Text('Çift tıkla fotoğrafı büyüt', style: TextStyle(fontSize: 13, color: Colors.black54)),
                  ]),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.open_in_full, color: Colors.black45),
              ]),
            ),
          ),
        );
      },
    );
  }
}
