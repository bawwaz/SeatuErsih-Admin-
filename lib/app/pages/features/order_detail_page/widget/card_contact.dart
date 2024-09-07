import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart'; // Import untuk Clipboard

class CardContactDetail extends StatelessWidget {
  final String kabName;
  final String kecName;
  final String address;
  final String phone;

  CardContactDetail({
    super.key,
    required this.address,
    required this.phone,
    required this.kabName,
    required this.kecName,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Alamat',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: screenWidth * 0.038,
          ),
        ),
        SizedBox(height: 4),
        Text(
          '${kecName}, ${kabName}, ${address}',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            color: Color(0xff8A8A8A),
            fontSize: screenWidth * 0.032,
          ),
        ),
        Divider(color: Color(0xffF1F1F1), height: 20, thickness: 1),
        Text(
          'Nomor Telepon',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: screenWidth * 0.038,
          ),
        ),
        SizedBox(height: 7),
        Row(
          children: [
            Text(
              phone,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                color: Color(0xff8A8A8A),
                fontSize: screenWidth * 0.032,
              ),
            ),
            SizedBox(width: 13),
            GestureDetector(
              onTap: () {
                Clipboard.setData(ClipboardData(text: phone));
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Nomor telepon telah disalin ke clipboard!',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: screenWidth * 0.030,
                      ),
                    ),
                    backgroundColor: Color(0xff7EC1EB),
                  ),
                );
              },
              child: Icon(Icons.copy, color: Color(0xff8a8a8a)),
            ),
          ],
        ),
        SizedBox(height: 6),
        Text(
          '*Sebaiknya hubungi customer sebelum ke lokasi',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            color: Color.fromARGB(255, 255, 96, 84),
            fontSize: screenWidth * 0.028,
          ),
        ),
      ],
    );
  }
}
