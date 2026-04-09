import 'dart:math' as math;

import 'package:easyquantum/widgets/particle_viewer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  final String formula;
  final Map<String, String> info;
  const HomeScreen({super.key, required this.info, required this.formula});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  double _alpha = 1 / math.sqrt(2);
  double _beta = 1 / math.sqrt(2);
  bool _isCollapsed = false;
  String _state = r'|ψ⟩ = 1/√2 |0⟩ + 1/√2 |1⟩';

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _updateState() {
    setState(() {
      _state =
          r'|ψ⟩ = ' +
          _alpha.toStringAsFixed(2) +
          r'|0⟩ + ' +
          _beta.toStringAsFixed(2) +
          r'|1⟩';
    });
  }

  void _collapseState() {
    final random = math.Random();
    final probAlpha = _alpha * _alpha;
    setState(() {
      _isCollapsed = true;
      if (random.nextDouble() < probAlpha) {
        _alpha = 1.0;
        _beta = 0.0;
        _state = r'|ψ⟩ = |0⟩';
      } else {
        _alpha = 0.0;
        _beta = 1.0;
        _state = r'|ψ⟩ = |1⟩';
      }
    });
  }

  void _resetState() {
    setState(() {
      _isCollapsed = false;
      _alpha = 1 / math.sqrt(2);
      _beta = 1 / math.sqrt(2);
      _updateState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.info['title'] ?? 'no data',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 20),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.purpleAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        elevation: 4,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: ParticleViewer(
              example: widget.info['example'] ?? 'no task',
              formula: widget.formula,
              science: widget.info,
              alpha: _alpha,
              beta: _beta,
              isCollapsed: _isCollapsed,
              animationController: _animationController,
              state: _state,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              children: [
                Text(
                  'Adjust α (|ψ⟩ = α|0⟩ + β|1⟩)',
                  style: GoogleFonts.poppins(fontSize: 16),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '|α|²: ${(_alpha * _alpha).toStringAsFixed(2)}',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '|β|²: ${(_beta * _beta).toStringAsFixed(2)}',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Slider(
                  value: _alpha,
                  min: 0,
                  max: 1,
                  onChanged:
                      _isCollapsed
                          ? null
                          : (value) {
                            setState(() {
                              _alpha = value;
                              _beta = math.sqrt(1 - _alpha * _alpha);
                              _updateState();
                            });
                          },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: _collapseState,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                      ),
                      child: Text(
                        'Measure Qubit',
                        style: GoogleFonts.poppins(fontSize: 16),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: _resetState,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[700],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                      ),
                      child: Text(
                        'Reset State',
                        style: GoogleFonts.poppins(fontSize: 16),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
