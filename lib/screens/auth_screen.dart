import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Авторизация'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SvgPicture.asset(
                'assets/auth_image.svg',
              ),
            ),
            Column(
              children: [
                Container(
                  height: 50,
                  color: Colors.red,
                  margin: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                ),
                Container(
                  height: 50,
                  color: Colors.red,
                  margin: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                ),
                Container(
                  height: 50,
                  color: Colors.red,
                  margin: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
