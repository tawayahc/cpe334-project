import 'package:flutter/material.dart';
import 'package:fundflow/features/home/models/bank.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:intl/intl.dart';

class BankCard extends StatelessWidget {
  final Bank bank;

  BankCard({required this.bank});

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat('#,##0.00');

    return Container(
      margin: const EdgeInsets.only(right: 16),
      width: 160, // Set the width to avoid overflow
      decoration: BoxDecoration(
        color: Colors.white, // Set background color to white
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Placeholder for bank logo
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: bank.color.withOpacity(0.9), // Placeholder color
                  ),
                ),
                const SizedBox(width: 8),
                // Bank Name and Subtitle with Flexible to prevent overflow
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        bank.name,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: bank.color,
                          // color: Colors.black,
                        ),
                        maxLines: 1,
                        minFontSize: 10, // Minimum size when shrinking
                        overflow: TextOverflow.ellipsis, // Ellipsis if too long
                      ),
                      AutoSizeText(
                        'ธนาคาร${bank.name}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black, // Set text color to black
                        ),
                        maxLines: 1,
                        minFontSize: 10, // Minimum size when shrinking
                        overflow: TextOverflow.ellipsis, // Ellipsis if too long
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
                height: 8), // Adjust space between text and gradient box
            // Aligned gradient box for balance
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 140, // Ensure width balances with the left and right
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: LinearGradient(
                    colors: [
                      bank.color.darken(0.15), // Darker shade of the bank.color
                      bank.color, // Original color
                      bank.color
                          .withOpacity(0.9), // Lighter shade with 20% opacity
                    ],
                    stops: const [
                      0.0,
                      0.5,
                      1.0
                    ], // Control the position of the color transitions
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 1, // Adjust padding to fit the text height
                  horizontal: 16,
                ),
                child: AutoSizeText(
                  '฿ ${formatter.format(bank.balance)}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Set the text color to white
                  ),
                  maxLines: 1,
                  minFontSize: 16, // Allow the text to shrink if needed
                  overflow: TextOverflow.ellipsis, // Ellipsis if too long
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

extension ColorBrightness on Color {
  Color darken([double amount = .1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(this);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
    return hslDark.toColor();
  }
}
