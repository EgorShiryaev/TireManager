import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tire_manager/assets.dart';
import 'package:tire_manager/providers/auth_provider.dart';
import 'package:tire_manager/screens/main_menu_screen.dart';
import 'package:tire_manager/widgets/widgets.dart';

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
              hintText: 'Логин',
            ),
            PassworkTextField(controller: passworkController),
            CustomElevatedButton(
              onPressed: _signIn,
              title: 'Войти',
            ),
          ],
        ),
      ),
    );
  }

  void _signIn() {
    final result = Provider.of<AuthProvider>(context, listen: false).signIn(
      loginController.text,
      passworkController.text,
    );
    loginController.clear();
    passworkController.clear();
    if (!result) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Не удалось авторизоваться')),
      );
    }
  }

  @override
  void dispose() {
    loginController.dispose();
    passworkController.dispose();
    super.dispose();
  }
}
