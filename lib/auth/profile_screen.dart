import 'package:flutter/material.dart';
import '../transaction/add_transaction_screen.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_navbar.dart';
import 'controller/login_controller.dart';
import 'package:Webcare/theme/colors.dart';

class ProfileScreen extends StatefulWidget {
  final LoginController loginController;

  const ProfileScreen({Key? key, required this.loginController}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: <Widget>[
                FractionallySizedBox(
                  widthFactor: 1.0,
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/profile.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 150),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 60),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Username',
                          suffixIcon: Icon(Icons.person),
                        ),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Email',
                          suffixIcon: Icon(Icons.mail),
                        ),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Password',
                          suffixIcon: Icon(Icons.lock),
                        ),
                      ),
                      SizedBox(height: 80),
                      CustomButton(buttonText: 'SIMPAN', onPressed: () {}),
                      SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          color: tertiaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(double.infinity, 50),
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: 10),
                              Text(
                                'KELUAR',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: primaryColor,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavbar(loginController: widget.loginController), // Sediakan loginController dari widget ini
      floatingActionButton: CustomFloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add_transaction');
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
