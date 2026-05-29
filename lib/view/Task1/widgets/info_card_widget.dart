import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app/view/Task1/widgets/info_item_widget.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final String? actionText;
  final List<InfoItem> items;

  const InfoCard({
    super.key,
    required this.title,
    this.actionText,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style:  TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (actionText != null)
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      actionText!,
                      style: TextStyle(color: Colors.blue, fontSize: 18.sp),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 10),
            ...items,
          ],
        ),
      ),
    );
  }
}