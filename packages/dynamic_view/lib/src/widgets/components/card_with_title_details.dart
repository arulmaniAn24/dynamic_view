import 'package:flutter/material.dart';

class CardWithTitleDetails extends StatelessWidget {
  final String title;
  final String idNumber;
  final String name;
  final String mobileNumber;
  final double titleFontSize;
  final double textFontSize;
  final double paddingDx;
  final double paddingDy;
  final double width;
  final double height;

  const CardWithTitleDetails({
    super.key,
    required this.title,
    required this.idNumber,
    required this.name,
    required this.mobileNumber,
    required this.titleFontSize,
    required this.textFontSize,
    required this.paddingDx,
    required this.paddingDy,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: paddingDx, vertical: paddingDy),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Card(
                    color: Colors.blueGrey[50],
                    margin: const EdgeInsets.only(bottom: 16),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                title,
                                style: TextStyle(
                                  fontSize: titleFontSize,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                ),
                                child: const Icon(
                                  Icons.person_outline,
                                  color: Colors.black,
                                  size: 24,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 18.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        idNumber,
                                        style: TextStyle(
                                          fontSize: textFontSize,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        name,
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
                                    ],
                                  ),
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
            ),
          ],
        ),
      ),
    );
  }
}
