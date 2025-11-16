import 'package:flutter/material.dart';
import 'package:todo_app/utils/app_colors.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //navigate to task details
      },
      child: AnimatedContainer(
        duration: Duration(seconds: 600),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.primaryColor.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: .1),
              offset: const Offset(0, 4),
              blurRadius: 8,
            ),
          ],
        ),
        child: ListTile(
          leading: GestureDetector(
            onTap: () {
              //check icon onTap
            },
            child: AnimatedContainer(
              duration: Duration(microseconds: 600),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                shape: BoxShape.circle,
                // border: Border.all(color: Colors.grey, width: 1),
              ),
              child: Icon(Icons.check, color: Colors.white),
            ),
          ),
          //task tile
          title: Text(
            'Done',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
          ),
          //task subtitle
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Description',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Date',
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      Text(
                        'SubDate',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
