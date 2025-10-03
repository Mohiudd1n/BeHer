import 'package:flutter/material.dart';
import '../models/user_skin_profile.dart';
import 'home_screen.dart';
import '../layout.dart';

class OnboardingScreen extends StatefulWidget {
  final int initialPage;
  final UserSkinProfile? existingProfile;
  const OnboardingScreen({
    super.key,
    this.initialPage = 0,
    this.existingProfile,
  });

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _controller;
  late UserSkinProfile profile;
  int _currentPage = 0;

  final List<Map<String, dynamic>> _onboardingData = [
    {
      'title': 'Welcome to BeHer',
      'subtitle': 'Your personal skincare journey starts here',
      'icon': Icons.spa_rounded,
      'color': Color(0xFFFCE4EC),
    },
    {
      'title': 'Skin Type',
      'subtitle': 'Help us understand your skin better',
      'icon': Icons.water_drop_rounded,
      'color': Color(0xFFE0F7FA),
    },
    {
      'title': 'Skin Concerns',
      'subtitle': 'Select what you\'d like to improve',
      'icon': Icons.flag_rounded,
      'color': Color(0xFFFFF8E1),
    },
    {
      'title': 'Desired Effects',
      'subtitle': 'What results are you looking for?',
      'icon': Icons.auto_awesome_rounded,
      'color': Color(0xFFF3E5F5),
    },
    {
      'title': 'Previous Products',
      'subtitle': 'Share what has worked for you before',
      'icon': Icons.eco_rounded,
      'color': Color(0xFFE8F5E8),
    },
  ];

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialPage;
    _controller = PageController(initialPage: widget.initialPage);
    profile = widget.existingProfile ?? UserSkinProfile();
  }

  void _nextPage() {
    if (_currentPage < 4) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
      setState(() {
        _currentPage++;
      });
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _controller.previousPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
      setState(() {
        _currentPage--;
      });
    }
  }

  void _finishOnboarding() {
    if (widget.existingProfile != null) {
      Navigator.pop(context, profile);
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => AppLayout(profile: profile),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEF8F5),
      body: SafeArea(
        child: Column(
          children: [
            // Progress Bar
            _buildProgressBar(),
            
            Expanded(
              child: PageView(
                controller: _controller,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                children: [
                  _buildGetStartedStep(),
                  _buildSkinTypeStep(),
                  _buildConcernsStep(),
                  _buildDesiredEffectsStep(),
                  _buildPreviousProductsStep(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        children: [
          // Progress indicators
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(5, (index) {
              return Expanded(
                child: Container(
                  height: 4,
                  margin: EdgeInsets.only(right: index == 4 ? 0 : 8),
                  decoration: BoxDecoration(
                    color: index <= _currentPage 
                        ? const Color(0xFFe06c9f)
                        : Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 12),
          // Step text
          Text(
            'Step ${_currentPage + 1} of 5',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFF6B7280),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGetStartedStep() {
    final data = _onboardingData[0];
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Icon
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: data['color'] as Color,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                data['icon'] as IconData,
                size: 50,
                color: const Color(0xFFe06c9f),
              ),
            ),
          ),
          
          const SizedBox(height: 40),
          
          // Title
          Text(
            data['title'] as String,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w700,
              color: Color(0xFF2D2D2D),
            ),
            textAlign: TextAlign.center,
          ),
          
          const SizedBox(height: 16),
          
          // Subtitle
          Text(
            data['subtitle'] as String,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF6B7280),
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
          
          const SizedBox(height: 60),
          
          // Get Started Button
          Container(
            width: double.infinity,
            height: 56,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFf283b6), Color(0xFFe06c9f)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFe06c9f).withOpacity(0.3),
                  blurRadius: 15,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: _nextPage,
                child: const Center(
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkinTypeStep() {
    final data = _onboardingData[1];
    final List<String> skinTypes = ['Oily', 'Dry', 'Combination', 'Normal', 'Sensitive'];
    
    return _buildSelectionStep(
      data: data,
      options: skinTypes,
      selectedValue: profile.skinType,
      onSelect: (value) {
        setState(() {
          profile.skinType = value;
        });
      },
      showBack: true,
    );
  }

  Widget _buildConcernsStep() {
    final data = _onboardingData[2];
    final List<String> concerns = [
      'Acne', 'Wrinkles', 'Dark Circles', 'Pigmentation', 
      'Sensitivity', 'Redness', 'Large Pores', 'Dullness'
    ];
    
    return _buildMultiSelectStep(
      data: data,
      options: concerns,
      selectedList: profile.concerns,
    );
  }

  Widget _buildDesiredEffectsStep() {
    final data = _onboardingData[3];
    final List<String> effects = [
      'Glow', 'Hydration', 'Anti-Aging', 'Even Tone', 
      'Reduce Oiliness', 'Brightening', 'Firmness', 'Calming'
    ];
    
    return _buildMultiSelectStep(
      data: data,
      options: effects,
      selectedList: profile.desiredEffects,
    );
  }

  Widget _buildPreviousProductsStep() {
    final data = _onboardingData[4];
    TextEditingController controller = TextEditingController(
      text: profile.previousProducts.join(", "),
    );

    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          // Header
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: data['color'] as Color,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                data['icon'] as IconData,
                size: 35,
                color: const Color(0xFFe06c9f),
              ),
            ),
          ),
          
          const SizedBox(height: 32),
          
          Text(
            data['title'] as String,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: Color(0xFF2D2D2D),
            ),
            textAlign: TextAlign.center,
          ),
          
          const SizedBox(height: 8),
          
          Text(
            data['subtitle'] as String,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF6B7280),
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
          
          const SizedBox(height: 40),
          
          // Text Field
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: TextField(
              controller: controller,
              maxLines: 4,
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(20),
                hintText: "E.g., Cetaphil, Neutrogena, The Ordinary...",
                hintStyle: TextStyle(
                  color: Color(0xFF9CA3AF),
                  fontSize: 16,
                ),
              ),
              onChanged: (value) {
                if (value.isNotEmpty) {
                  profile.previousProducts = value
                      .split(',')
                      .map((e) => e.trim())
                      .where((e) => e.isNotEmpty)
                      .toList();
                }
              },
            ),
          ),
          
          const SizedBox(height: 40),
          
          // Navigation Arrows for last step
          _buildNavigationArrows(
            showNext: false,
            showFinish: true,
            onFinish: _finishOnboarding,
          ),
        ],
      ),
    );
  }

  Widget _buildSelectionStep({
    required Map<String, dynamic> data,
    required List<String> options,
    required String? selectedValue,
    required Function(String) onSelect,
    bool showBack = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          // Header
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: data['color'] as Color,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                data['icon'] as IconData,
                size: 35,
                color: const Color(0xFFe06c9f),
              ),
            ),
          ),
          
          const SizedBox(height: 32),
          
          Text(
            data['title'] as String,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: Color(0xFF2D2D2D),
            ),
            textAlign: TextAlign.center,
          ),
          
          const SizedBox(height: 8),
          
          Text(
            data['subtitle'] as String,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF6B7280),
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
          
          const SizedBox(height: 40),
          
          // Options
          Expanded(
            child: ListView(
              children: options.map((option) {
                final isSelected = selectedValue == option;
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: isSelected ? const Color(0xFFe06c9f) : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.06),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                    border: Border.all(
                      color: isSelected 
                          ? const Color(0xFFe06c9f) 
                          : const Color(0xFFF3F4F6),
                      width: 2,
                    ),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(16),
                      onTap: () {
                        onSelect(option);
                        Future.delayed(const Duration(milliseconds: 300), _nextPage);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                option,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: isSelected ? Colors.white : const Color(0xFF2D2D2D),
                                ),
                              ),
                            ),
                            if (isSelected)
                              const Icon(
                                Icons.check_circle_rounded,
                                color: Colors.white,
                                size: 24,
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          
          const SizedBox(height: 20),
          
          // Navigation Arrows
          _buildNavigationArrows(showBack: showBack),
        ],
      ),
    );
  }

  Widget _buildMultiSelectStep({
    required Map<String, dynamic> data,
    required List<String> options,
    required List<String> selectedList,
  }) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          // Header
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: data['color'] as Color,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                data['icon'] as IconData,
                size: 35,
                color: const Color(0xFFe06c9f),
              ),
            ),
          ),
          
          const SizedBox(height: 32),
          
          Text(
            data['title'] as String,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: Color(0xFF2D2D2D),
            ),
            textAlign: TextAlign.center,
          ),
          
          const SizedBox(height: 8),
          
          Text(
            data['subtitle'] as String,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF6B7280),
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
          
          const SizedBox(height: 40),
          
          // Options Grid
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 3,
              ),
              itemCount: options.length,
              itemBuilder: (context, index) {
                final option = options[index];
                final isSelected = selectedList.contains(option);
                return Container(
                  decoration: BoxDecoration(
                    color: isSelected ? const Color(0xFFe06c9f) : Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.06),
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                    border: Border.all(
                      color: isSelected 
                          ? const Color(0xFFe06c9f) 
                          : const Color(0xFFF3F4F6),
                      width: 1.5,
                    ),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            selectedList.remove(option);
                          } else {
                            selectedList.add(option);
                          }
                        });
                      },
                      child: Center(
                        child: Text(
                          option,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: isSelected ? Colors.white : const Color(0xFF2D2D2D),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          
          const SizedBox(height: 20),
          
          // Navigation Arrows
          _buildNavigationArrows(showBack: true),
        ],
      ),
    );
  }

  Widget _buildNavigationArrows({
    bool showBack = true,
    bool showNext = true,
    bool showFinish = false,
    VoidCallback? onFinish,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Back Arrow
        if (showBack)
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(28),
                onTap: _previousPage,
                child: const Icon(
                  Icons.arrow_back_rounded,
                  color: Color(0xFF2D2D2D),
                  size: 24,
                ),
              ),
            ),
          )
        else
          const SizedBox(width: 56),

        // Next Arrow or Finish Button
        if (showNext)
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFf283b6), Color(0xFFe06c9f)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFe06c9f).withOpacity(0.3),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(28),
                onTap: _nextPage,
                child: const Icon(
                  Icons.arrow_forward_rounded,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ),
          )
        else if (showFinish)
          Container(
            height: 56,
            padding: const EdgeInsets.symmetric(horizontal: 32),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFb5bfa1), Color(0xFF6e9887)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(28),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF6e9887).withOpacity(0.3),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(28),
                onTap: onFinish ?? _finishOnboarding,
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Finish",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(
                      Icons.check_rounded,
                      color: Colors.white,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),
          )
        else
          const SizedBox(width: 56),
      ],
    );
  }
}