import 'package:flutter/material.dart';

class CoursesPage extends StatelessWidget {
  const CoursesPage({super.key});

  final List<Map<String, String>> _courses = const [
    {"code": "BIM101", "title": "Programlamaya Giriş", "desc": "Temel programlama kavramları ve uygulamalar.", "type": "Zorunlu", "akts": "6"},
    {"code": "BIM102", "title": "Bilgisayar Mimarisi", "desc": "Bilgisayarın donanım yapısı ve organizasyonu.", "type": "Zorunlu", "akts": "5"},
    {"code": "BIM201", "title": "Veri Yapıları", "desc": "Listeler, ağaçlar, grafikler ve algoritmalar.", "type": "Zorunlu", "akts": "6"},
    {"code": "BIM202", "title": "Algoritma Analizi", "desc": "Algoritma tasarımı ve karmaşıklık analizi.", "type": "Zorunlu", "akts": "5"},
    {"code": "BIM301", "title": "İşletim Sistemleri", "desc": "Çekirdek kavramlar: süreç, bellek, dosya sistemleri.", "type": "Zorunlu", "akts": "6"},
    {"code": "BIM302", "title": "Bilgisayar Ağları", "desc": "Ağ katmanları, protokoller ve uygulamalar.", "type": "Seçmeli", "akts": "5"},
    {"code": "BIM401", "title": "Yapay Zeka", "desc": "Temel yapay zeka ve makine öğrenmesi kavramları.", "type": "Seçmeli", "akts": "7"},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(12),
      itemCount: _courses.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (context, i) {
  final c = _courses[i];
  final code = c['code']!;
  final title = c['title']!;
  final desc = c['desc']!;
  final type = c['type'] ?? '—';
  final akts = c['akts'] ?? '—';
        return Card(
          elevation: 3,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
            child: Row(children: [
              CircleAvatar(
                radius: 26,
                backgroundColor: Colors.deepPurple.shade50,
                child: Text(code.split(RegExp(r"\d"))[0], style: const TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('$code — $title', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 6),
                  Text(desc, style: const TextStyle(fontSize: 14, color: Colors.black87, height: 1.4)),
                  const SizedBox(height: 8),
                  Wrap(spacing: 8, runSpacing: 6, children: [
                    Chip(label: Text(type), backgroundColor: type == 'Zorunlu' ? Colors.green.shade50 : Colors.blue.shade50),
                    Chip(label: Text('$akts AKTS'), backgroundColor: Colors.orange.shade50),
                  ])
                ]),
              ),
              const SizedBox(width: 8),
              const SizedBox.shrink()
            ]),
          ),
        );
      },
    );
  }
}
