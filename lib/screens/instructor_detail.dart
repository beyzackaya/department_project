import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InstructorDetailPage extends StatelessWidget {
  final String name;
  final String info;
  final String photoUrl;
  final String phone;
  final String tag;

  const InstructorDetailPage({super.key, required this.name, required this.info, required this.photoUrl, required this.phone, required this.tag});

  Future<void> _call(BuildContext context) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('$name aranacak mı?'),
        content: Text('Telefon: $phone'),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(false), child: const Text('Hayır')),
          TextButton(onPressed: () => Navigator.of(context).pop(true), child: const Text('Evet')),
        ],
      ),
    );

    if (result == true) {
      final tel = Uri(scheme: 'tel', path: phone);
      await launchUrl(tel);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0, title: Text(name)),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Hero(
                tag: tag,
                child: InteractiveViewer(
                  child: Image.asset(photoUrl, fit: BoxFit.contain),
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                Text(info, style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 12),
                Row(children: [
                  ElevatedButton.icon(
                    onPressed: () => _call(context),
                    icon: const Icon(Icons.call),
                    label: const Text('Ara'),
                  ),
                  const SizedBox(width: 12),
                  Text(phone, style: const TextStyle(fontSize: 14, color: Colors.black54)),
                ])
              ],
            ),
          )
        ],
      ),
    );
  }
}
