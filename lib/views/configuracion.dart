import 'dart:io';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velneoapp/dialogos/exit_dialog.dart';
import 'package:velneoapp/main.dart';

/// The main widget.
class ConfigView extends StatefulWidget {
  const ConfigView({super.key});

  @override
  State<StatefulWidget> createState() => ConfigViewState();
}

var checkForDarkMode;

/// The main widget state.
class ConfigViewState extends State<ConfigView> {
  bool isDarkModeEnabled = checkForDarkMode ?? true;

  /// Whether dark mode is enabled.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Modo oscuro")),
      body: SizedBox.expand(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Cambia de Dark Mode a Light Mode',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: DayNightSwitcher(
                isDarkModeEnabled: isDarkModeEnabled,
                onStateChanged: (isDarkModeEnabledVar) {
                  if (isDarkModeEnabledVar == false) {
                    MyApp.of(context).changeTheme(ThemeMode.light);
                    checkForDarkMode = false;
                  } else {
                    MyApp.of(context).changeTheme(ThemeMode.dark);
                    checkForDarkMode = true;
                  }
                },
              ),
            ),
            const Text(
              'Salir de la aplicación',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              height: MediaQuery.of(context).size.height * 0.05,
              child: ElevatedButton.icon(
                  icon: const Icon(Icons.exit_to_app),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                  ),
                  onPressed: () async {
                    final shouldExit = await showExitDialog(context);
                    if (shouldExit) {
                      SystemNavigator.pop();
                      exit(
                          0); //TODO Peligroso, por si las dudas, que al parecer a Apple no le gusta.
                    }
                  },
                  label: const Text("Salir")),
            ),
          ],
        ),
      ),
    );
  }
}
