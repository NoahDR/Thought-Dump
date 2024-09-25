import 'package:flutter/material.dart';

void showSettingsDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // Bildschirmgröße ermitteln
      final size = MediaQuery.of(context).size;

      return Dialog(
        backgroundColor: const Color.fromARGB(255, 30, 30, 30),
        child: SizedBox(
          width: size.width * 0.9,
          height: size.height * 0.9,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Text(
                  'Settings',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView(
                    children: [
                      ListTile(
                        leading:
                            const Icon(Icons.volume_up, color: Colors.white),
                        title: const Text('Volume',
                            style: TextStyle(color: Colors.white)),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: const Icon(Icons.notifications,
                            color: Colors.white),
                        title: const Text('Notifications',
                            style: TextStyle(color: Colors.white)),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                TextButton(
                  child: const Text(
                    'Close',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
