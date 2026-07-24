import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});


  Future<void> _openWebsite() async {
    final Uri url = Uri.parse(
      'https://orkhanasgarli.vercel.app',
    );

    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Sayt açıla bilmədi');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Haqqında"),
        centerTitle: true,
      ),


      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [

            const SizedBox(height: 30),


            CircleAvatar(
              radius: 45,
              child: Icon(
                Icons.restaurant,
                size: 45,
              ),
            ),


            const SizedBox(height: 20),


            const Text(
              "Waitnote",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),


            const SizedBox(height: 8),


            const Text(
              "Ofisiantlar üçün offline sifariş tətbiqi",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),


            const SizedBox(height: 30),


            Card(
              child: ListTile(
                leading: const Icon(Icons.language),
                title: const Text("Veb-sayt"),
                subtitle: const Text(
                  "Orkhan Asgarli",
                ),
                trailing: const Icon(
                  Icons.open_in_new,
                ),
                onTap: _openWebsite,
              ),
            ),


            Card(
              child: const ListTile(
                leading: Icon(Icons.info_outline),
                title: Text("Versiya"),
                subtitle: Text(
                  "1.0.0",
                ),
              ),
            ),


            const Spacer(),


            const Text(
              "© 2026 Waitnote\nOfisiantlar Üçün Düzəldilmişdir\nCreated by Orkhan Asgarli",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),

          ],
        ),
      ),
    );
  }
}