import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// Slider Cubit
class SliderCubit extends Cubit<int> {
  SliderCubit() : super(0);

  void nextPage() {
    if (state < images.length - 1) {
      emit(state + 1);
    }
  }

  void previousPage() {
    if (state > 0) {
      emit(state - 1);
    }
  }
}

// Slider Widget
class SliderWidget extends StatelessWidget {
  SliderWidget({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final SliderCubit sliderCubit = context.read<SliderCubit>();

    return BlocBuilder<SliderCubit, int>(
      builder: (context, state) {
        return GestureDetector(
          onHorizontalDragEnd: (details) {
            if (details.primaryVelocity! > 0) {
              sliderCubit.previousPage();
            } else if (details.primaryVelocity! < 0) {
              sliderCubit.nextPage();
            }
          },
          child: Stack(
            children: [
              PageView.builder(
                itemCount: images.length,
                controller: PageController(initialPage: state),
                onPageChanged: (page) => sliderCubit.emit(page),
                itemBuilder: (context, pagePosition) {
                  final double value = pagePosition.toDouble() - state.toDouble();
                  final double opacity = value.abs().clamp(0.0, 1.0);
                  final double scale = 1.0 - opacity * 0.2;

                  return Opacity(
                    opacity: 1.0 - opacity,
                    child: Transform.scale(
                      scale: scale,
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Image.network(
                          images[pagePosition],
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  );
                },
              ),
              Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(images.length, (index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: index == state ? Colors.blue : Colors.grey,
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

final List<String> images = [
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTIZccfNPnqalhrWev-Xo7uBhkor57_rKbkw&usqp=CAU",
  "https://wallpaperaccess.com/full/2637581.jpg",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTIZccfNPnqalhrWev-Xo7uBhkor57_rKbkw&usqp=CAU",
];