// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common/color_extension.dart';
import '../../common_widgets/amount_card.dart';
import '../../common_widgets/investment_details_modal.dart';
import '../../common_widgets/investment_guide.dart';
import '../../common_widgets/investment_plans.dart';
import '../../common_widgets/investment_tips.dart';
import '../../common_widgets/plan_model.dart';
import '../login/welcome_view.dart';
import '../settings/settings.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  Future<void> _deleteSavedCredentials(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final savedEmail = prefs.getString('saved_email');
    final savedPassword = prefs.getString('saved_password');

    if (savedEmail != null && savedPassword != null) {
      await prefs.remove('saved_email');
      await prefs.remove('saved_password');
      await prefs.setBool('remember_me', false);
    }
    await Future.delayed(const Duration(milliseconds: 500));
    Navigator.of(context).pop();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const WelcomeView()),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                  _deleteSavedCredentials(context);
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
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: TColor.primary),
              child: const Text(
                'Profile',
                style: TextStyle(color: Colors.black, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, size: 20, color: Colors.black),
              title: const Text(
                'Home',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings, size: 20, color: Colors.black),
              title: const Text(
                'Settings',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.info, size: 20, color: Colors.black),
              title: const Text(
                'About',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_mail, size: 20, color: Colors.black),
              title: const Text(
                'Contact Us',
                style: TextStyle(color: Colors.black, fontSize: 20),
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
        child: SingleChildScrollView(
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
              // Cards for plans
              PlanWidget(
                title: "Gold",
                subtitle: "30% return",
                // icon: Icons.monetization_on,
                onTap: () {
                  showPlanDetails(context, amount, isProfit);
                  print("card tapped:");
                },
              ),
              InvestmentGuide(),
              Divider(
                color: TColor.gray80,
                thickness: 1,
                indent: 20,
                endIndent: 20,
              ),
              InvestmentTips(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance),
            label: 'Investments',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: TColor.primary,
        onTap: (index) {
          // Handle bottom navigation bar item tap
          if (index == 0) {
            // Home tapped
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeView()),
            );
          } else if (index == 1) {
            // Investments tapped
            print("tapped index $index");
          } else if (index == 2) {
            // Settings tapped
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Settings()),
            );
          }
        },
      ),
    );
  }
}
