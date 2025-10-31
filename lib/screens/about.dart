import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
            child: Image.asset(
              'assets/a.jpg',
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                'Eskişehir Teknik Üniversitesi',
                style: TextStyle(fontSize: 29, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              const Text(
                'Bilgisayar Mühendisliği Bölümü',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 14),

              Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                     
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Bölüm Tanıtımı',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 6),
                          Text(
                            'Bilgisayar Mühendisliği Bölümü, hem teorik temellere dayalı hem de uygulamalı bilgi ve beceriler kazandırmayı amaçlayan bir eğitim programına sahiptir. '
                            'Lisans programımız tamamen İngilizce yürütülmekte ve bir yıllık hazırlık sınıfı ile başlayan dört yıllık yükseköğretim sürecinde öğrencilerimiz, '
                            'algoritma geliştirme, yazılım mühendisliği, veri yapıları, bilgisayar ağları, yapay zeka, gömülü sistemler ve veri bilimi gibi alanlarda derinlemesine bilgi edinirler. '
                            'Bölümümüzde, öğrencilerimiz teorik derslerin yanı sıra laboratuvar çalışmaları, bitirme projeleri ve endüstri projeleri aracılığıyla gerçek dünya deneyimi kazanırlar.',
                            style: TextStyle(fontSize: 14, height: 1.5),
                          ),
                        ],
                      ),
                    )
                  ]),
                ),
              ),

              const SizedBox(height: 14),

              Row(children: [
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Icon(Icons.flag, size: 28, color: Colors.deepPurple),
                          SizedBox(height: 6),
                          Text('Misyon', style: TextStyle(fontWeight: FontWeight.w600)),
                          SizedBox(height: 6),
                          Text(
                            'Bilgisayar Mühendisliği Bölümü olarak misyonumuz, öğrencilerimize güçlü bir akademik temel kazandırmak, analitik düşünme ve problem çözme becerilerini geliştirmek, '
                            'yaratıcı ve yenilikçi mühendisler yetiştirmek ve bilimsel araştırmalar yoluyla topluma katkıda bulunmaktır. Ayrıca sektörde ve akademide liderlik yapabilecek mezunlar yetiştirmeyi hedefliyoruz.',
                            style: TextStyle(fontSize: 14, height: 1.5),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Icon(Icons.visibility, size: 28, color: Colors.deepPurple),
                          SizedBox(height: 6),
                          Text('Vizyon', style: TextStyle(fontWeight: FontWeight.w600)),
                          SizedBox(height: 6),
                          Text(
                            'Vizyonumuz, ulusal ve uluslararası düzeyde saygın bir araştırma ve eğitim merkezi olarak tanınmak, '
                            'bilgisayar mühendisliği alanında bilimsel çalışmaları desteklemek ve öğrencilerimizi lider mühendisler olarak yetiştirmektir. '
                            'Bölümümüz, teknoloji ve inovasyon alanında öncü projelere imza atmayı amaçlamaktadır.',
                            style: TextStyle(fontSize: 14, height: 1.5),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ]),

              const SizedBox(height: 14),

              Card(
                elevation: 2,
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(children: const [
                      Icon(Icons.science, size: 28, color: Colors.deepPurple),
                      SizedBox(width: 8),
                      Text('Araştırma & Laboratuvarlar', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                    ]),
                  ),
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                    
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: const Text(
                      'Bölümümüzde yapay zeka, makine öğrenmesi, bilgisayarla görü, ağ güvenliği, gömülü sistemler ve dağıtık sistemler gibi alanlarda birçok araştırma grubu ve laboratuvar bulunmaktadır. '
                      'Akademisyenlerimiz ulusal ve uluslararası projelerde aktif olarak yer almakta, öğrencilerimiz ise tez ve proje çalışmalarında bu araştırma altyapısından faydalanmaktadır. '
                      'Laboratuvarlarımız modern ekipmanlarla donatılmış olup, hem yazılım hem de donanım projeleri için uygun bir ortam sağlar.',
                      style: TextStyle(fontSize: 14, height: 1.5),
                    ),
                  )
                ]),
              ),

              const SizedBox(height: 14),

              Card(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
                    Text('Endüstri İş Birlikleri', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                    SizedBox(height: 8),
                    Text(
                      'Bölümümüz, sanayi ortaklarıyla yakın iş birliği içerisinde çalışmakta, öğrencilerimiz stajlar, endüstri projeleri ve ortak araştırma programları aracılığıyla sektörde gerçek dünya deneyimi kazanmaktadır. '
                      'Mezunlarımız yazılım, donanım, veri bilimi ve siber güvenlik gibi alanlarda çeşitli kamu ve özel sektörde görev alabilmektedir. '
                      'Bölüm, girişimcilik, inovasyon ve teknoloji transferi konusunda da öğrencilere rehberlik sağlamaktadır.',
                      style: TextStyle(fontSize: 14, height: 1.5),
                    ),
                  ]),
                ),
              ),

              const SizedBox(height: 14),

              Card(
                elevation: 1,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('İletişim', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                          SizedBox(height: 6),
                          Text('Adres: İki Eylül Kampüsü, 26555 Eskişehir / Türkiye', style: TextStyle(fontSize: 14)),
                          SizedBox(height: 4),
                          Text('Telefon: +90 222 213 77 77 (Dahili 8125)', style: TextStyle(fontSize: 14)),
                          SizedBox(height: 4),
                          Text('E-posta: mf.ceng.estu@gmail.com', style: TextStyle(fontSize: 14)),
                          SizedBox(height: 4),
                          Text('Web: https://ceng.eskisehir.edu.tr', style: TextStyle(fontSize: 14)),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                    
                    )
                  ]),
                ),
              ),

              const SizedBox(height: 16),

              const SizedBox(height: 30),
            ]),
          )
        ]),
      ),
    );
  }
} 