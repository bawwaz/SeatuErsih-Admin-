import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih_admin/draft/widget/order_list_page/item_card.dart';
import 'package:seatu_ersih_admin/draft/widget/order_list_page/item_card2.dart';

class OrderListView extends StatelessWidget {
  const OrderListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.all(27),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset("assets/img/angle-circle-right 1.png"),
                Text(
                  "Orders",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: Color(0xFF7EC1EB),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  width: 30,
                )
              ],
            ),
            SizedBox(
              height: 48,
            ),
            Text(
              "Hari ini",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: Color(0xFF000000),
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ItemCard(),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  width: 400,
                  height: 1,
                  decoration: BoxDecoration(
                    color: Color(0xFFD9D9D9),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "28/11/24",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: Color(0xFF000000),
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ItemCard2(),
          ],
        ),
      ),
    );
  }
}
