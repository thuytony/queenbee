import 'package:flutter/material.dart';
import 'package:queenbee/layers/presentation/auth/login_page/login_page_change_notifier.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider (
      create: (_) => LoginPageChangeNotifier(),
      child: const LoginView(),
    );
  }
}

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const _Content(),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          ClipPath(
            clipper: CustomShapeClipper(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.25,
              width: double.infinity,
              color: Colors.white,
              child: Image(image: NetworkImage('https://static.wixstatic.com/media/6c16cb_58393dcde62248ccbf241d6437287f54~mv2.jpg/v1/fill/w_980,h_735,al_c,q_85,usm_0.66_1.00_0.01,enc_avif,quality_auto/6c16cb_58393dcde62248ccbf241d6437287f54~mv2.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 54),
            child: Text(
              'Log In Here',
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              selectionColor: colorScheme.primary,
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(16),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Enter your email',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(16),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
              obscureText: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Material(
              borderRadius: BorderRadius.circular(20.0),
              child: Ink(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 34, 182, 227),
                      Color.fromARGB(255, 175, 20, 255),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: InkWell(
                  onTap: () {
                    print('Log In');
                  },
                  borderRadius: BorderRadius.circular(20.0),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 8.0),
                    child: const Text(
                      'Log In',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              'Forgotten Password?',
              style: textTheme.bodyMedium?.copyWith(
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(32),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'Version 0.0.1',
                  style: textTheme.bodyMedium?.copyWith(
                    color: Colors.black54,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
  
    final double radius = 36.0;      // bán kính bo tròn bên trái
    final double slantHeight = 40.0; // độ lên cao của đường chéo
    final double rightCurve = 15.0;  // bán kính bo cong cuối đường chéo

    final double dx = size.width  - slantHeight;   // x điểm bắt đầu bo phải
    final double dy = size.height - slantHeight;   // y điểm bắt đầu bo phải

    // 1. Trên trái
    path.moveTo(0, 0);

    // 2. Xuống bo trái
    path.lineTo(0, size.height - radius);
    path.quadraticBezierTo(
      0, size.height,
      radius, size.height,
    );

    // 3. Lên chéo
    path.lineTo(dx, dy);

    // 4. Bo phải mượt
    path.quadraticBezierTo(
      // control point: ngay trên điểm chéo theo x
      dx + slantHeight, dy - rightCurve / 3,
      // end point: thẳng đứng lên thêm rightCurve
      size.width, dy - rightCurve - rightCurve,
    );

    // 5. Lên góc phải trên
    path.lineTo(size.width, 0);
    
    // Close the path
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}