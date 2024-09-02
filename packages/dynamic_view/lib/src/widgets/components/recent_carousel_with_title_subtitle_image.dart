import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class RecentCarouselWithTitleSubtitleImage extends StatelessWidget {
  final double width;
  final double height;
  final double paddingDx;
  final double paddingDy;
  final double borderRadius;
  final List<Map<String, dynamic>> carouselItem;
  final String titleColor;
  final String descriptionColor;
  final double titleFontSize;
  final double descriptionFontSize;
  final String backgroundColor;
  const RecentCarouselWithTitleSubtitleImage({
    super.key,
    required this.width,
    required this.height,
    required this.paddingDx,
    required this.paddingDy,
    required this.borderRadius,
    required this.carouselItem,
    required this.titleColor,
    required this.descriptionColor,
    required this.titleFontSize,
    required this.descriptionFontSize,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Recently opened',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          CarouselSlider(
            options: CarouselOptions(
              height: 120.0,
              enableInfiniteScroll: false,
              // viewportFraction: 0.5,
            ),
            items: carouselItem.map((item) {
              return Builder(
                builder: (BuildContext context) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 2,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(item['icon'], size: 24, color: Colors.black54),
                          const SizedBox(height: 10),
                          Text(
                            item['title'],
                            style: TextStyle(
                              fontSize: titleFontSize,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              Icon(Icons.check_circle,
                                  size: 18,
                                  color: Color(int.parse(descriptionColor))),
                              const SizedBox(width: 5),
                              Text(
                                item['description'],
                                style: TextStyle(
                                  color: Color(int.parse(descriptionColor)),
                                  fontSize: descriptionFontSize,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
