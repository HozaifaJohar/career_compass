import 'package:career_compass/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FlashMessage extends StatelessWidget {
  final String errorText;
  const FlashMessage({required this.errorText, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          height: 90,
          decoration: BoxDecoration(
            color: AppColors.amber,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          child: Row(
            children: [
              const SizedBox(
                width: 48,
              ),
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'oh snap!',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      const Spacer(),
                      Text(
                        errorText,
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )
                    ]),
              ),
            ],
          ),
        ),
        Positioned(
          //note we use positioned only in stack widget..
          bottom: 0,
          child: ClipRRect(
            //ClipRRect this to make bottom left of the flash message rounded...
            borderRadius:
                const BorderRadius.only(bottomLeft: Radius.circular(20)),
            child: SvgPicture.asset(
              'images/bubbles.svg',
              height: 48,
              width: 40,
              color: Colors.amber,
            ),
          ),
        ),
        Positioned(
            top: 60,
            right: 0,
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.only(bottomRight: Radius.circular(21)),
              child: Image.asset(
                'images/oneBubble.png',
                height: 30,
                color: Colors.amber,
              ),
            ))
      ],
    );
  }
}
