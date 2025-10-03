import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  bool _isLoading = false;

  Future<void> _openCamera() async {
    setState(() {
      _isLoading = true;
    });

    // Get available cameras
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    // Simulate camera loading delay
    await Future.delayed(const Duration(milliseconds: 500));

    // Navigate to camera screen (you'll need to implement this)
    // For now, we'll just show a dialog
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
      
      _showCameraNotImplementedDialog();
    }
  }

  void _showCameraNotImplementedDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: const Text(
          "Camera Feature",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFF2D2D2D),
          ),
        ),
        content: const Text(
          "The camera feature will be implemented with AI skin analysis integration. For now, this is a preview of the scan interface.",
          style: TextStyle(
            fontSize: 14,
            color: Color(0xFF6B7280),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text(
              "OK",
              style: TextStyle(
                color: Color(0xFFe06c9f),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEF8F5),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            _buildHeader(),
            
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    
                    // Scan Instructions
                    _buildInstructionsCard(),
                    
                    const SizedBox(height: 32),
                    
                    // Face Preview Image
                    _buildFacePreview(),
                    
                    const SizedBox(height: 40),
                    
                    // Scan Button
                    _buildScanButton(),
                    
                    const SizedBox(height: 40),
                    
                    // Features Grid
                    _buildFeaturesGrid(),
                    
                    const SizedBox(height: 60),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back_ios, size: 20),
            onPressed: () => Navigator.of(context).pop(),
          ),
          const Expanded(
            child: Text(
              "Skin Analysis",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFF2D2D2D),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.help_outline, size: 22),
            onPressed: () {
              // Help functionality
            },
          ),
        ],
      ),
    );
  }

  Widget _buildInstructionsCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFb5bfa1), Color(0xFF6e9887)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6e9887).withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            "AI Skin Analysis",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Get personalized skincare recommendations by scanning your face with our advanced AI technology",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white.withOpacity(0.9),
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFacePreview() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 25,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Stack(
          children: [
            // Face Image
            Image.network(
              'https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=400&h=500&fit=crop&crop=face',
              width: double.infinity,
              height: 350,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 350,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFFf283b6), Color(0xFFe06c9f)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.face_retouching_natural,
                        size: 80,
                        color: Colors.white,
                      ),
                      SizedBox(height: 16),
                      Text(
                        "Face Preview",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                );
              },
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(
                  height: 350,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: const Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFe06c9f)),
                    ),
                  ),
                );
              },
            ),
            
            // Scan Overlay
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: const Color(0xFFe06c9f).withOpacity(0.6),
                    width: 3,
                  ),
                ),
              ),
            ),
            
            // Scanning Points (Decorative)
            Positioned(
              top: 50,
              left: 50,
              child: _buildScanPoint(),
            ),
            Positioned(
              top: 50,
              right: 50,
              child: _buildScanPoint(),
            ),
            Positioned(
              bottom: 100,
              left: 80,
              child: _buildScanPoint(),
            ),
            Positioned(
              bottom: 100,
              right: 80,
              child: _buildScanPoint(),
            ),
            Positioned(
              top: 150,
              left: MediaQuery.of(context).size.width / 2 - 20,
              child: _buildScanPoint(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScanPoint() {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFFe06c9f).withOpacity(0.2),
        border: Border.all(
          color: const Color(0xFFe06c9f).withOpacity(0.8),
          width: 2,
        ),
      ),
      child: const Center(
        child: Icon(
          Icons.circle,
          size: 8,
          color: Color(0xFFe06c9f),
        ),
      ),
    );
  }

  Widget _buildScanButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          gradient: _isLoading
              ? const LinearGradient(
                  colors: [Color(0xFFb5bfa1), Color(0xFF6e9887)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : const LinearGradient(
                  colors: [Color(0xFFe06c9f), Color(0xFFf283b6)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: _isLoading
              ? [
                  BoxShadow(
                    color: const Color(0xFF6e9887).withOpacity(0.4),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ]
              : [
                  BoxShadow(
                    color: const Color(0xFFe06c9f).withOpacity(0.4),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: _isLoading ? null : _openCamera,
            child: Stack(
              children: [
                // Button Content
                Center(
                  child: _isLoading
                      ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        )
                      : const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.camera_alt_rounded,
                              size: 24,
                              color: Colors.white,
                            ),
                            SizedBox(width: 12),
                            Text(
                              "Scan Your Face",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                ),
                
                // Pulse Animation (when not loading)
                if (!_isLoading)
                  Positioned.fill(
                    child: IgnorePointer(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.6),
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFeaturesGrid() {
    final List<Map<String, dynamic>> features = [
      {
        'icon': Icons.analytics_outlined,
        'title': 'Deep Analysis',
        'description': 'AI-powered assessment',
        'color': const Color(0xFFE0F7FA),
      },
      {
        'icon': Icons.recommend_outlined,
        'title': 'Personalized',
        'description': 'Custom recommendations',
        'color': const Color(0xFFF3E5F5),
      },
      {
        'icon': Icons.track_changes_outlined,
        'title': 'Progress Tracking',
        'description': 'Monitor improvements',
        'color': const Color(0xFFFFF8E1),
      },
      {
        'icon': Icons.medical_services_outlined,
        'title': 'Expert Insights',
        'description': 'Dermatologist-approved',
        'color': const Color(0xFFFCE4EC),
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "What We Analyze",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF2D2D2D),
            ),
          ),
          const SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.2,
            ),
            itemCount: features.length,
            itemBuilder: (context, index) {
              final feature = features[index];
              return _buildFeatureCard(feature);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard(Map<String, dynamic> feature) {
    return Container(
      decoration: BoxDecoration(
        color: feature['color'] as Color,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              feature['icon'] as IconData,
              size: 20,
              color: const Color(0xFFe06c9f),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            feature['title'] as String,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF2D2D2D),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            feature['description'] as String,
            style: TextStyle(
              fontSize: 12,
              color: const Color(0xFF6B7280),
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}