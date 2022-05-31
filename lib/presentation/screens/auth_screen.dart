import 'package:flutter/material.dart';
import 'package:tire_manager/assets.dart';

import '../widgets/widgets.dart';
import 'screens.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final loginController = TextEditingController();
  final loginFocusNode = FocusNode();
  final passworkController = TextEditingController();
  final passworkFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Авторизация'),
        centerTitle: true,
      ),
      body: SafeArea(
        minimum: const EdgeInsets.only(bottom: 5),
        child: Column(
          children: [
            const SvgImage(
              fileName: Assets.unlockDeviceSvg,
              width: double.infinity,
            ),
            CustomTextField(
              controller: loginController,
              focusNode: loginFocusNode,
            ),
            PassworkTextField(controller: passworkController),
            CustomElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MainMenuScreen(),
                ),
              ),
              title: 'Войти',
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    loginController.dispose();
    passworkController.dispose();
    super.dispose();
  }
}
