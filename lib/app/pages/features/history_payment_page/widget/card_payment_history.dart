import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentHistory extends StatelessWidget {
  String paymentChannel;
  final DateTime orderDate;
  String orderType;
  String price;
  final String? profilePictureUrl;

  PaymentHistory({
    super.key,
    required this.paymentChannel,
    required this.orderDate,
    required this.orderType,
    required this.price,
    this.profilePictureUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            if (profilePictureUrl != null)
              SvgPicture.network(
                profilePictureUrl!,
                height: 18,
                width: 18,
                placeholderBuilder: (BuildContext context) => CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey.shade200,
                ),
              )
            else
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey.shade200,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
            SizedBox(width: 13),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        paymentChannel,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 13,
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        DateFormat('• dd MMMM yyyy').format(orderDate),
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          color: Color(0xff8A8A8A),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Text(
                    orderType == 'regular_clean'
                        ? 'Regular Clean'
                        : 'Deep Clean',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      color: Color(0xff8A8A8A),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              '+ Rp.$price',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: Colors.green,
                fontSize: 13,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 7,
        ),
        Divider(thickness: 1, color: Colors.black12),
        SizedBox(
          height: 7,
        ),
      ],
    );
  }
}
