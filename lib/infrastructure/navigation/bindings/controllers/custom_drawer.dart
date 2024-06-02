import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final VoidCallback onTapGenerateQR;
  final VoidCallback onTapScanQR;
  final VoidCallback onTapHistory;
  final VoidCallback onTapLogout;
  final VoidCallback onTapSetting;

  CustomDrawer({
    required this.onTapGenerateQR,
    required this.onTapScanQR,
    required this.onTapHistory,
    required this.onTapLogout,
    required this.onTapSetting,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFF82F87F), // Updated to the desired color
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: Image.asset(
                    'assets/images/logodsp.png', // path to your image
                    fit: BoxFit.contain, // Sesuaikan dengan preferensi Anda
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: onTapSetting,
          ),
          ListTile(
            leading: Icon(Icons.qr_code),
            title: Text('Generate QR Code'),
            onTap: onTapGenerateQR,
          ),
          ListTile(
            leading: Icon(Icons.qr_code_scanner),
            title: Text('Scan QR Code'),
            onTap: onTapScanQR,
          ),
          ListTile(
            leading: Icon(Icons.history),
            title: Text('History'),
            onTap: onTapHistory,
          ),
          ListTile(
            leading: Icon(Icons.logout,
                color: Colors.red), // Beri warna merah pada ikon logout
            title: Text(
              'Logout',
              style: TextStyle(
                  color: Colors.red), // Beri warna merah pada teks logout
            ),
            onTap: onTapLogout,
          ),
        ],
      ),
    );
  }
}
