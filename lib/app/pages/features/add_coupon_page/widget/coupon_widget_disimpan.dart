import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CouponDisimpan extends StatelessWidget {
  final String percent;
  final String description;
  final String expiredDate;
  const CouponDisimpan({
    super.key, required this.percent, required this.description, required this.expiredDate,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 338,
          height: 122,
          child: Stack(
            children: [
              Positioned(
                left: 17,
                top: 0,
                child: Container(
                  width: 305,
                  height: 122,
                  decoration: ShapeDecoration(
                    color: Color(0xFF7EC1EB),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 304,
                top: 40,
                child: Container(
                  width: 34,
                  height: 34,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: OvalBorder(),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 43,
                child: Container(
                  width: 34,
                  height: 34,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: OvalBorder(),
                  ),
                ),
              ),
              Positioned(
                left: 122,
                top: 0,
                child: Container(
                  width: 1.50,
                  height: 122,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 99,
                        child: Container(
                          width: 1.50,
                          height: 23,
                          decoration: BoxDecoration(color: Colors.white),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 67,
                        child: Container(
                          width: 1.50,
                          height: 26,
                          decoration: BoxDecoration(color: Colors.white),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 36,
                        child: Container(
                          width: 1.50,
                          height: 26,
                          decoration: BoxDecoration(color: Colors.white),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 1.50,
                          height: 30,
                          decoration: BoxDecoration(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 137,
                top: 13,
                child: Text(
                  '$percent',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 33,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Positioned(
                left: 137,
                top: 57,
                child: Text(
                  '$description',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Positioned(
                left: 137,
                top: 85,
                child: Text(
                  '$expiredDate',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Positioned(
                left: 49,
                top: 30,
                child: Container(
                  width: 60,
                  height: 60,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: ShapeDecoration(
                            color: Color(0xFFC6EAFF),
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 5.68,
                        top: 15,
                        child: Container(
                          width: 47.84,
                          height: 30,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/img/icon-app.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
