import 'package:flutter/material.dart';
import '../theme/colors.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
      child: Row(
        children: [
          // Government emblem
          Container(
            width: 38,
            height: 46,
            alignment: Alignment.center,
            child: const Icon(
              Icons.account_balance,
              color: Colors.black87,
              size: 32,
            ),
          ),

          const SizedBox(width: 8),

          // Platform information
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cooperative Services',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                    color: AppColors.darkBlue,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Cooperative Gig Services Platform',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 9.5,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textGrey,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'सहकार से सेवा, सेवा से समृद्धि',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 9,
                    color: AppColors.textGrey,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 6),

          // Location
          const Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.location_on,
                    color: Colors.deepOrange,
                    size: 14,
                  ),
                  SizedBox(width: 2),
                  Text(
                    'Coimbatore',
                    style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textDark,
                    ),
                  ),
                ],
              ),
              Text(
                'Tamil Nadu',
                style: TextStyle(
                  fontSize: 8,
                  color: AppColors.textGrey,
                ),
              ),
            ],
          ),

          const SizedBox(width: 7),

          // Citizen profile
          const DecoratedBox(
            decoration: BoxDecoration(
              color: Color(0xFFF4F8FC),
              borderRadius: BorderRadius.all(
                Radius.circular(7),
              ),
              border: Border.fromBorderSide(
                BorderSide(
                  color: AppColors.border,
                ),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 6,
                vertical: 5,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 14,
                    backgroundColor: Color(0xFFDCEAF7),
                    child: Icon(
                      Icons.person,
                      color: AppColors.darkBlue,
                      size: 18,
                    ),
                  ),
                  SizedBox(width: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dinesh Kumar',
                        style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textDark,
                        ),
                      ),
                      SizedBox(height: 1),
                      Text(
                        'Citizen',
                        style: TextStyle(
                          fontSize: 8,
                          color: AppColors.textGrey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}