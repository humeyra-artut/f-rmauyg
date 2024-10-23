import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Firmalar'),
          backgroundColor: Colors.deepPurple,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {},
          ),
        ),
        body: FirmalarPage(),
      ),
    );
  }
}

class FirmalarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          // Üst bölümdeki Sağlık başlığı
          Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Icon(Icons.health_and_safety, color: Colors.white),
                SizedBox(width: 10),
                Text(
                  'Sağlık',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),

          // Firma ara bölümü
          TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: 'Firma Ara',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            'İstediğiniz firmada indirim yakalama fırsatı...',
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(height: 20),

          // Firma listesi
          Expanded(
            child: ListView(
              children: [
                FirmaListItem(firmaAdi: 'Firma Adı Uzun Firma Adı', indirim: '%10', context: context),
                FirmaListItem(firmaAdi: 'Firma Adı', indirim: '%15', context: context),
                FirmaListItem(firmaAdi: 'Firma Adı Uzun Firma Adı', indirim: '%20', context: context),
                FirmaListItem(firmaAdi: 'Firma Adı', indirim: '%25', context: context),
                FirmaListItem(firmaAdi: 'Firma Adı Uzun Firma Adı', indirim: '%30', context: context),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FirmaListItem extends StatelessWidget {
  final String firmaAdi;
  final String indirim;
  final BuildContext context;

  FirmaListItem({required this.firmaAdi, required this.indirim, required this.context});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Firma seçildiğinde bir bilgi penceresi göster
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('İndirim Fırsatı'),
              content: Text('$firmaAdi için indirim: $indirim'),
              actions: [
                TextButton(
                  child: Text('Tamam'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
      child: Card(
        child: ListTile(
          leading: Icon(Icons.business),
          title: Text(firmaAdi),
          trailing: Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.deepPurple, Colors.blueAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              indirim,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
