import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'about_page.dart';
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
  Future<void> openWebsite() async {
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
        title: const Text("Ayarlar"),
        centerTitle: true,
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          const Text(
            "Ümumi",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          _SettingsTile(
            icon: Icons.restaurant,
            title: "Restoran məlumatları",
            subtitle: "Ad, ünvan və məlumatlar",
            onTap: () {},
          ),

          _SettingsTile(
            icon: Icons.person,
            title: "Ofisiant profili",
            subtitle: "Ad və işçi məlumatları",
            onTap: () {},
          ),


          const SizedBox(height: 25),

          const Text(
            "Tətbiq",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),


          _SettingsTile(
            icon: Icons.table_bar,
            title: "Masalar",
            subtitle: "Masa parametrləri",
            onTap: () {},
          ),


          _SettingsTile(
            icon: Icons.menu_book,
            title: "Menyu",
            subtitle: "Məhsulları idarə et",
            onTap: () {},
          ),


          _SettingsTile(
            icon: Icons.backup,
            title: "Yedəkləmə",
            subtitle: "Məlumatları saxla",
            onTap: () {},
          ),


          const SizedBox(height: 25),


          const Text(
            "Digər",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),


          _SettingsTile(
            icon: Icons.language,
            title: "Dil",
            subtitle: "Azərbaycan dili",
            onTap: () {},
          ),

      _SettingsTile(
            icon: Icons.info_outline,
            title: "Developer",
            subtitle: "https://orkhanasgarli.vercel.app",
            onTap: openWebsite,
          ),

          _SettingsTile(
            icon: Icons.info_outline,
            title: "Haqqında",
            subtitle: "Waitnote versiyası",
            onTap: () {
              Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const AboutPage(),
                 ),
              );

            },
          ),

        ],
      ),
    );
  }
}


class _SettingsTile extends StatelessWidget {

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;


  const _SettingsTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: CircleAvatar(
          child: Icon(icon),
        ),

        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),

        subtitle: Text(subtitle),

        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
        ),

        onTap: onTap,
      ),
    );
  }
}