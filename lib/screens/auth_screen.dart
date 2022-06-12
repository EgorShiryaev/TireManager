import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tire_manager/assets.dart';
import 'package:tire_manager/providers/auth_provider.dart';
import 'package:tire_manager/widgets/index.dart';

import '../widgets/padding_wrapper.dart';

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
      appBar: AppBar(title: const Text('Авторизация')),
      body: SafeArea(
        child: Column(
          children: [
            const SvgImage(
              fileName: Assets.unlockDeviceSvg,
              width: double.infinity,
            ),
            PaddingWrapper(
              child: CustomTextField(
                controller: loginController,
                focusNode: loginFocusNode,
                hintText: 'Логин',
              ),
            ),
            PaddingWrapper(
              child: PassworkTextField(controller: passworkController),
            ),
            PaddingWrapper(
              child: CustomElevatedButton(
                onPressed: _signIn,
                title: 'Войти',
              ),
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
        const SnackBar(
          content: Text('Не удалось авторизоваться'),
          duration: Duration(milliseconds: 500),
        ),
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
