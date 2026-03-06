import 'package:flutter/material.dart';
import 'package:latihan_kuis_a/screen/movie_list_page.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  bool isLogin = false;

  void login() {
    String username = usernameController.text;
    String pass = passController.text;

    if (username == "furaihan" && pass == "108") {
      setState(() {
        isLogin = true;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          content: Text("Login berhasil"),
        ),
      );

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return MovieListPage(username: username);
          },
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text("Login Gagal"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                          "Login",
                          style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                        ),
              const Text(
                          "Welcome back to MiniLens!",
                        ),
              usernameField(usernameController),
              passField(passController),
              buttonLogin(),
            ],
          ),
        ),
      ),
    );
  }

  Widget usernameField(TextEditingController username) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: TextField(
        controller: username,
        decoration: InputDecoration(
          hintText: "username",
          contentPadding: EdgeInsets.all(8),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        ),
      ),
    );
  }

  Widget passField(TextEditingController pass) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: TextField(
        controller: pass,
        obscureText: true,
        decoration: InputDecoration(
          hintText: "Password",
          contentPadding: EdgeInsets.all(8),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        ),
      ),
    );
  }

  Widget buttonLogin() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(onPressed: login, child: Text("Login")),
    );
  }
}
