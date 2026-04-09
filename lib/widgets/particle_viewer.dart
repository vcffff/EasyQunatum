import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'package:google_fonts/google_fonts.dart';

class ParticleViewer extends StatelessWidget {
  final String formula;
  final double alpha;
  final double beta;
  final bool isCollapsed;
  final AnimationController animationController;
  final String state;
  final Map<String, String> science;
  final String example;
  const ParticleViewer({
    required this.example,
    required this.formula,
    required this.science,
    super.key,
    required this.alpha,
    required this.beta,
    required this.isCollapsed,
    required this.animationController,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF212121), Color(0xFF424242)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.purpleAccent.withOpacity(0.3),
                blurRadius: 20,
                spreadRadius: 5,
              ),
            ],
          ),
          child: Cube(
            onSceneCreated: (Scene scene) {
              final qubit =
                  Object(fileName: 'assets/models/particle.obj')
                    ..scale.setValues(1.0, 1.0, 1.0)
                    ..rotation.setValues(20, 35, 0);
              scene.world.add(qubit);

              final state0 =
                  Object(fileName: 'assets/models/particle.obj')
                    ..position.setValues(2.0, 0.0, 0.0)
                    ..scale.setValues(0.5, 0.5, 0.5);
              final state1 =
                  Object(fileName: 'assets/models/particle.obj')
                    ..position.setValues(-2.0, 0.0, 0.0)
                    ..scale.setValues(0.5, 0.5, 0.5);
              scene.world.add(state0);
              scene.world.add(state1);

              final sphere = Object(fileName: 'assets/models/sphere.obj')
                ..scale.setValues(1.0, 1.0, 1.0);
              scene.world.add(sphere);

              scene.camera.zoom = 4;
              scene.camera.position.setValues(0, 0, 12);
              scene.light.position.setValues(5, 5, 10);

              animationController.addListener(() {
                if (!isCollapsed) {
                  qubit.rotation.y = animationController.value * 160;
                  qubit.rotation.x =
                      math.sin(animationController.value * 2 * math.pi) * 30;
                  final pulse =
                      1 + 0.2 * math.sin(animationController.value * math.pi);
                  qubit.scale.setValues(pulse, pulse, pulse);

                  state0.scale.setValues(
                    0.5 * (alpha * alpha),
                    0.5 * (alpha * alpha),
                    0.5 * (alpha * alpha),
                  );
                  state1.scale.setValues(
                    0.5 * (beta * beta),
                    0.5 * (beta * beta),
                    0.5 * (beta * beta),
                  );
                  state0.rotation.y = animationController.value * 360;
                  state1.rotation.y = -animationController.value * 360;
                } else {
                  qubit.rotation.y = animationController.value * 360;
                  qubit.scale.setValues(1.0, 1.0, 1.0);
                  state0.scale.setValues(
                    alpha > beta ? 0.5 : 0.0,
                    alpha > beta ? 0.5 : 0.0,
                    alpha > beta ? 0.5 : 0.0,
                  );
                  state1.scale.setValues(
                    alpha > beta ? 0.0 : 0.5,
                    alpha > beta ? 0.0 : 0.5,
                    alpha > beta ? 0.0 : 0.5,
                  );
                  state0.rotation.y = animationController.value * 360;
                  state1.rotation.y = -animationController.value * 360;
                }

                qubit.updateTransform();
                state0.updateTransform();
                state1.updateTransform();
                scene.update();
              });
            },
          ),
        ),
        Positioned(
          bottom: 16,
          left: 16,
          right: 16,
          child: AnimatedOpacity(
            opacity: isCollapsed ? 0.8 : 1.0,
            duration: const Duration(milliseconds: 300),
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.deepPurple,
                  builder: (_) {
                    return DraggableScrollableSheet(
                      initialChildSize: 1,
                      minChildSize: 1,
                      maxChildSize: 1,
                      expand: true,
                      builder: (context, scrollController) {
                        return SingleChildScrollView(
                          controller: scrollController,
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Container(
                                  width: 40,
                                  height: 5,
                                  margin: const EdgeInsets.only(bottom: 20),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Formula',
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 25,
                                    ),
                                  ),
                                  Text(
                                    formula,
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 19,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 27),
                              Text(
                                science['note'] ?? 'No data',
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 19,
                                ),
                              ),
                              const SizedBox(height: 40),
                              Text(
                                'Example',
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 25,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                example,
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 19,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                );
              },
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Science Description',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Tap on me!',
                        style: GoogleFonts.poppins(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),

                      Text(
                        _parseLatex(state),
                        style: GoogleFonts.poppins(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  String _parseLatex(String latex) {
    return latex
        .replaceAll(r'|ψ⟩', '|ψ⟩')
        .replaceAll(r'|0⟩', '|0⟩')
        .replaceAll(r'|1⟩', '|1⟩')
        .replaceAll(r'√', '√');
  }
}
