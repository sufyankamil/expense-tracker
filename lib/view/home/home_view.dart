import 'package:flutter/material.dart';

import '../../common/color_extension.dart';
import '../../common_widgets/amount_card.dart';
import '../../common_widgets/investment_details_modal.dart';
import '../login/login_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    String amount = "\$ 1100";

    bool isProfit = true;

    void confirmLogout() {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Logout'),
            content: const Text('Are you sure you want to logout?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginView()),
                  );
                },
                child: const Text('Logout'),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: TColor.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text("", style: TextStyle(fontSize: 16)),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.menu, color: TColor.primary),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: TColor.primary),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.search, color: TColor.primary),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: TColor.gray,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: TColor.primary),
              child: const Text(
                'Profile',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, size: 20, color: TColor.white),
              title: const Text(
                'Home',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings, size: 20, color: TColor.white),
              title: const Text(
                'Settings',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.info, size: 20, color: TColor.white),
              title: const Text(
                'About',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_mail, size: 20, color: TColor.white),
              title: const Text(
                'Contact Us',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout, size: 20, color: Colors.red),
              title: const Text(
                'Logout',
                style: TextStyle(color: Colors.red, fontSize: 20),
              ),
              onTap: () {
                confirmLogout();
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                "Welcome, user",
                style: TextStyle(
                  color: TColor.gray80,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            AmountCard(
              title: "Current Balance",
              amount: amount,
              buttonText1: "Invest Now",
              buttonText2: "View Details",
              onPressed: () {
                showDetails(context, amount, isProfit);
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Best Plans",
                    style: TextStyle(
                      color: TColor.gray80,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "See All ->",
                      style: TextStyle(
                        color: TColor.primary,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
