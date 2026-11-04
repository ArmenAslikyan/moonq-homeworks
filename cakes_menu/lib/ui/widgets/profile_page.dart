import 'package:flutter/material.dart';

class ProfileMenuItem {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  const ProfileMenuItem({required this.icon, required this.title, this.onTap});
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  final List<ProfileMenuItem> _menuItems = const [
    ProfileMenuItem(icon: Icons.assignment_outlined, title: 'Իմ Պատվերները'),
    ProfileMenuItem(icon: Icons.location_on, title: 'Հասցեներ'),
    ProfileMenuItem(icon: Icons.credit_card_rounded, title: 'Վճարման Միջոցներ'),
    ProfileMenuItem(icon: Icons.percent_rounded, title: 'Պարգևներ և Զեղչեր'),
    ProfileMenuItem(icon: Icons.settings, title: 'Կարգավորումներ'),
    ProfileMenuItem(icon: Icons.info, title: 'Մեր մասին'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffcf1ef),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          children: [
            const SizedBox(height: 10),
            ClipOval(
              child: Image.network(
                'https://images.openai.com/static-rsc-4/On4NsH3qqy54V0I0lA1Co9GDLpuhF7njhU9hY5b-tIsH__y717UUjwDOVdbjkW1yYyrpiPTkw3C8hBzRV_vtySZqXZZsBjFkWfbr-fMP51HBAG99MKlycybVSD2D2p69l-3JL_xCXoyO38MifuQUV_zXCCPnsD7E7VP4oifKLDs?purpose=inline',
                width: 160,
                height: 160,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Աննա Գրիգորյան',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color(0xff1f0b0a),
              ),
            ),
            const SizedBox(height: 24),

            // Profile Menu Buttons List
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _menuItems.length,
              separatorBuilder: (_, _) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final item = _menuItems[index];

                return Material(
                  color: const Color(0xfffae2dc),
                  borderRadius: BorderRadius.circular(16),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () {
                      item.onTap?.call();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 15,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            item.icon,
                            color: const Color(0xff1f0b0a),
                            size: 24,
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              item.title,
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff1f0b0a),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
