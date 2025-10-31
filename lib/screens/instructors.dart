import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'instructor_detail.dart';

class InstructorsPage extends StatelessWidget {
  const InstructorsPage({super.key});

  // Replace these assets with your actual filenames in `assets/`.
  final List<Map<String, String>> _people = const [
    {
      'name': 'Dr. Ahmet Yılmaz',
      'phone': '+905551234567',
      'info': 'Profesör • Ofis: Bina A - 101',
      'photo': 'assets/400.jpeg',
    },
    {
      'name': 'Dr. Betül Demir',
      'phone': '+905551234568',
      'info': 'Doçent • Ofis: Bina A - 202',
      'photo': 'assets/45.jpeg',
    },
    {
      'name': 'Dr. Selim Sönmez',
      'phone': '+905551234569',
      'info': 'Öğretim Görevlisi • Ofis: Bina B - 303',
      'photo': 'assets/1.jpeg',
    },
  ];

  Future<void> _confirmAndCall(BuildContext context, String name, String phone) async {
    // Restore original simple dialog + launch behavior per user request.
    final result = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('$name aranacak mı?'),
          content: Text('Telefon: $phone'),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Hayır')),
            TextButton(onPressed: () => Navigator.pop(context, true), child: const Text('Evet')),
          ],
        );
      },
    );

    if (result == true) {
      final uri = Uri(scheme: 'tel', path: phone);
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hocalar'), centerTitle: true),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        itemCount: _people.length,
        itemBuilder: (context, i) {
          final p = _people[i];
          final tag = 'instructor_img_$i';

          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(14),
              child: InkWell(
                borderRadius: BorderRadius.circular(14),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => InstructorDetailPage(
                      name: p['name']!,
                      info: p['info'] ?? '',
                      photoUrl: p['photo']!,
                      phone: p['phone']!,
                      tag: tag,
                    ),
                  ));
                },
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(14), color: Colors.white),
                  child: Row(children: [
                    Hero(
                      tag: tag,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          p['photo']!,
                          width: 72,
                          height: 72,
                          fit: BoxFit.cover,
                          errorBuilder: (context, err, st) => Image.asset('assets/a.jpg', width: 72, height: 72, fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text(p['name']!, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                        const SizedBox(height: 6),
                        Text(p['info'] ?? '', style: const TextStyle(fontSize: 13, color: Colors.black54)),
                        const SizedBox(height: 8),
                        Row(children: [
                          ElevatedButton.icon(
                            onPressed: () => _confirmAndCall(context, p['name']!, p['phone']!),
                            icon: const Icon(Icons.call, size: 18),
                            label: const Text('Ara'),
                            style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8)),
                          ),
                          const SizedBox(width: 10),
                          Text(p['phone']!, style: const TextStyle(color: Colors.black54)),
                        ])
                      ]),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => InstructorDetailPage(
                            name: p['name']!,
                            info: p['info'] ?? '',
                            photoUrl: p['photo']!,
                            phone: p['phone']!,
                            tag: tag,
                          ),
                        ));
                      },
                      icon: const Icon(Icons.arrow_forward_ios, size: 18),
                    )
                  ]),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
