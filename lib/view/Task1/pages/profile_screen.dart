import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:my_app/utils/assets.dart';
import 'package:my_app/view/Task1/widgets/info_card_widget.dart';
import 'package:my_app/view/Task1/widgets/info_item_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Gap(20.h),
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 74.sp,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 70.sp,
                        backgroundImage: AssetImage(
                          Assets.myImage,
                        ), // Placeholder
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.edit_outlined),
                        onPressed: () {},
                        color: Colors.black,
                        iconSize: 28.r,
                      ),
                    ),
                  ],
                ),

                Gap(35.h),

                InfoCard(
                  title: 'Personal info',
                  actionText: 'Edit',
                  items: [
                    InfoItem(
                      icon: Icons.person_outline,
                      label: 'Name',
                      value: 'Ganesh Chaudhary',
                    ),
                    InfoItem(
                      icon: Icons.email_outlined,
                      label: 'E-mail',
                      value: 'ganeshchay2021@gmail.com',
                    ),
                    InfoItem(
                      icon: Icons.phone_outlined,
                      label: 'Phone number',
                      value: '+977-9807706458',
                    ),
                    InfoItem(
                      icon: Icons.home_outlined,
                      label: 'Home address',
                      value:
                          'Madhesh Province, Lahan City, Radha Krishna Chowk Siraha (53800)',
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                InfoCard(
                  title: 'Account info',
                  items: [
                    InfoItem(
                      icon: Icons.account_balance,
                      label: "Bank Name",
                      value: "Nabil Bank Pvt. Ltd.",
                    ),
                     InfoItem(
                      icon: Icons.account_balance_wallet,
                      label: "Available Balance",
                      value: "Rs 25,56,125.0",
                    ),
                  ], // Partially visible in design
                ),
                const SizedBox(height: 100), // Space for bottom nav
              ],
            ),
          ),
        ),
      ),
    );
  }
}
