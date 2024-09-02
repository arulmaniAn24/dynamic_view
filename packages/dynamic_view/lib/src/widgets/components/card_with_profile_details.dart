import 'package:flutter/material.dart';

class CardWithProfileDetails extends StatelessWidget {
  final String title;
  final String idNumber;
  final String mobileNumber;
  final String emailid;
  final double titleFontSize;
  final double textFontSize;
  final double paddingDx;
  final double paddingDy;
  final double width;
  final double height;

  const CardWithProfileDetails(
      {super.key,
      required this.title,
      required this.idNumber,
      required this.mobileNumber,
      required this.emailid,
      required this.titleFontSize,
      required this.textFontSize,
      required this.paddingDx,
      required this.paddingDy,
      required this.width,
      required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: paddingDx, vertical: paddingDy),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Stack(
                    children: [
                      Card(
                        color: Colors.blueGrey[50],
                        margin: const EdgeInsets.only(bottom: 16),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Person Icon
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                ),
                                child: const Icon(
                                  Icons.person_outline,
                                  color: Colors.black,
                                  size: 20,
                                ),
                              ),
                              const SizedBox(width: 18),
                              // Text Content
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      title,
                                      style: TextStyle(
                                        fontSize: titleFontSize,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      idNumber,
                                      style: TextStyle(
                                        fontSize: textFontSize,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      mobileNumber,
                                      style: TextStyle(
                                        fontSize: textFontSize,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      emailid,
                                      style: TextStyle(
                                        fontSize: textFontSize,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
