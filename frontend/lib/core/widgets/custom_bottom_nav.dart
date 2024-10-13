import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fundflow/core/themes/app_styles.dart';

class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(
            top: Radius.circular(30)
        ),
        child: BottomNavigationBar(
            backgroundColor: Colors.white,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: AppColors.primary,
            elevation: 3,

            items: const [
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.home),
                  label: 'Home'
              ),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.graph_square_fill),
                  label: 'Overview'
              ),
            ]
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          onPressed: () {

          },
          shape: const CircleBorder(),
          child: Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primary,
            ),
            child: const Icon(CupertinoIcons.add),
          )
      ),
    );

  }
}
