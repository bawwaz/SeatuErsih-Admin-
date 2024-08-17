import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_request_page/order_request_controller.dart';

class CardNote extends GetView<OrderRequestController> {
  const CardNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 3,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: TextField(
        onChanged: (value) =>
            controller.updateNoteText(value), 
        decoration: InputDecoration(
          hintText: 'Berikan alasan...',
          hintStyle: GoogleFonts.poppins(
            fontSize: 15,
            color: Color(0xFF8A8A8A),
          ),
          border: InputBorder.none,
        ),
        maxLines: 3,
      ),
    );
  }
}
