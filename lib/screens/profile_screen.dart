import 'package:flutter/material.dart';
import '../models/user_skin_profile.dart';
import 'onboarding_screen.dart';

class ProfileScreen extends StatefulWidget {
  final UserSkinProfile profile;
  const ProfileScreen({super.key, required this.profile});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late UserSkinProfile profile;

  @override
  void initState() {
    super.initState();
    profile = widget.profile;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEF8F5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              _buildHeader(),

              const SizedBox(height: 8),

              // Profile Header Card
              _buildProfileHeaderCard(),

              const SizedBox(height: 24),

              // Section: Skin Profile
              _buildSectionHeader("Skin Profile"),

              // Skin Type Card
              _buildInfoCard(
                icon: Icons.water_drop_rounded,
                label: "Skin Type",
                value: profile.skinType ?? 'Not set',
                bgColor: const Color(0xFFE0F7FA),
              ),

              // Concerns Card
              _buildConcernsCard(),

              // Desired Effects Card
              _buildDesiredEffectsCard(),

              // Previous Products Card
              _buildPreviousProductsCard(),

              const SizedBox(height: 24),

              // Routine Section
              _buildRoutineSection(),

              const SizedBox(height: 24),

              // Similar Products Section
              _buildSimilarProductsSection(),

              const SizedBox(height: 24),

              // Retake Quiz Button
              _buildRetakeQuizButton(),

              const SizedBox(height: 32),
            ],
          ),
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
              "Your Profile",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFF2D2D2D),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.settings_outlined, size: 22),
            onPressed: () {
              // Settings functionality
            },
          ),
        ],
      ),
    );
  }

  Widget _buildProfileHeaderCard() {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFf283b6), Color(0xFFe06c9f)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFe06c9f).withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ClipOval(
              child: Image.network(
                'https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=150&h=150&fit=crop&crop=face',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [Color(0xFFf283b6), Color(0xFFe06c9f)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: const Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 40,
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            "Erica",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            "erica@example.com",
            style: TextStyle(
              fontSize: 14,
              color: Colors.white70,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.white, width: 2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 90,
                  vertical: 10,
                ),
              ),
              onPressed: () {
                // Your button action
              },
              child: const Text(
                "Edit Profile",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Color(0xFF2D2D2D),
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String label,
    required String value,
    required Color bgColor,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Icon(
                icon,
                size: 24,
                color: const Color(0xFFe06c9f),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF6B7280),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2D2D2D),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildConcernsCard() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFF8E1),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Icon(
                    Icons.flag_rounded,
                    size: 24,
                    color: const Color(0xFFe06c9f),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              const Text(
                "Skin Concerns",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2D2D2D),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: profile.concerns.map((concern) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFe06c9f).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: const Color(0xFFe06c9f).withOpacity(0.3),
                    width: 1,
                  ),
                ),
                child: Text(
                  concern,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF2D2D2D),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildDesiredEffectsCard() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF3E5F5),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Icon(
                    Icons.auto_awesome_rounded,
                    size: 24,
                    color: const Color(0xFFe06c9f),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              const Text(
                "Desired Effects",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2D2D2D),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: profile.desiredEffects.map((effect) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFb5bfa1).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: const Color(0xFFb5bfa1).withOpacity(0.3),
                    width: 1,
                  ),
                ),
                child: Text(
                  effect,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF2D2D2D),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildPreviousProductsCard() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFCE4EC),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Icon(
                    Icons.eco_rounded,
                    size: 24,
                    color: const Color(0xFFe06c9f),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              const Text(
                "Products That Worked",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2D2D2D),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...profile.previousProducts.map((product) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  Container(
                    width: 6,
                    height: 6,
                    decoration: const BoxDecoration(
                      color: Color(0xFFe06c9f),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      product,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF2D2D2D),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }

  Widget _buildRoutineSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Header
        _buildSectionHeader("Your Skincare Routine"),

        // Morning Routine Card
        _buildRoutineCard(
          time: "Morning",
          icon: Icons.wb_sunny_rounded,
          bgColor: const Color(0xFFE3F2FD),
          steps: [
            _buildRoutineStep("Cleanser", "CeraVe Hydrating Facial Cleanser"),
            _buildRoutineStep(
              "Toner",
              "The Ordinary Glycolic Acid 7% Toning Solution",
            ),
            _buildRoutineStep(
              "Serum",
              "The Ordinary Niacinamide 10% + Zinc 1%",
            ),
            _buildRoutineStep(
              "Moisturizer",
              "La Roche-Posay Toleriane Double Repair Face Moisturizer",
            ),
            _buildRoutineStep(
              "Sunscreen",
              "Supergoop! Unseen Sunscreen SPF 40",
            ),
          ],
        ),

        const SizedBox(height: 12),

        // Night Routine Card
        _buildRoutineCard(
          time: "Night",
          icon: Icons.nightlight_rounded,
          bgColor: const Color(0xFFF3E5F5),
          steps: [
            _buildRoutineStep("Oil Cleanser", "DHC Deep Cleansing Oil"),
            _buildRoutineStep(
              "Water Cleanser",
              "CeraVe Hydrating Facial Cleanser",
            ),
            _buildRoutineStep(
              "Exfoliant",
              "Paula's Choice 2% BHA Liquid Exfoliant",
            ),
            _buildRoutineStep("Serum", "The Ordinary Hyaluronic Acid 2% + B5"),
            _buildRoutineStep("Moisturizer", "Kiehl's Ultra Facial Cream"),
          ],
        ),
      ],
    );
  }

  Widget _buildRoutineCard({
    required String time,
    required IconData icon,
    required Color bgColor,
    required List<Widget> steps,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Icon(
                      icon,
                      size: 24,
                      color: const Color(0xFFe06c9f),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  "$time Routine",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2D2D2D),
                  ),
                ),
              ],
            ),
          ),

          // Divider
          Container(
            height: 1,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            color: Colors.white.withOpacity(0.5),
          ),

          // Steps
          ...steps,
        ],
      ),
    );
  }

  Widget _buildRoutineStep(String step, String product) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Step Number/Icon
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: const Color(0xFFe06c9f).withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: const Color(0xFFe06c9f).withOpacity(0.3),
                width: 1,
              ),
            ),
            child: const Center(
              child: Icon(Icons.check, size: 16, color: Color(0xFFe06c9f)),
            ),
          ),

          const SizedBox(width: 16),

          // Step Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  step,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2D2D2D),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  product,
                  style: TextStyle(
                    fontSize: 13,
                    color: const Color(0xFF6B7280),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),

          // Time/Duration
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFb5bfa1).withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              "2 min",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0xFF2D2D2D),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSimilarProductsSection() {
    final List<Map<String, dynamic>> similarProducts = [
      {
        'name': 'The Ordinary Niacinamide 10% + Zinc 1%',
        'brand': 'The Ordinary',
        'price': '\$5.90',
        'image':
            'https://images.unsplash.com/photo-1556228578-8c89e6adf883?w=150&h=150&fit=crop',
        'rating': 4.8,
      },
      {
        'name': 'CeraVe Hydrating Facial Cleanser',
        'brand': 'CeraVe',
        'price': '\$14.99',
        'image':
            'https://images.unsplash.com/photo-1571781926291-c477ebfd024b?w=150&h=150&fit=crop',
        'rating': 4.6,
      },
      {
        'name': 'La Roche-Posay Toleriane Moisturizer',
        'brand': 'La Roche-Posay',
        'price': '\$21.99',
        'image':
            'https://images.unsplash.com/photo-1596462502278-27bfdc403348?w=150&h=150&fit=crop',
        'rating': 4.7,
      },
      {
        'name': 'Paula\'s Choice 2% BHA Liquid',
        'brand': 'Paula\'s Choice',
        'price': '\$32.00',
        'image':
            'https://images.unsplash.com/photo-1631729371254-42c2892f0e6e?w=150&h=150&fit=crop',
        'rating': 4.9,
      },
      {
        'name': 'Kiehl\'s Ultra Facial Cream',
        'brand': 'Kiehl\'s',
        'price': '\$36.00',
        'image':
            'https://images.unsplash.com/photo-1617897903246-719242758050?w=150&h=150&fit=crop',
        'rating': 4.5,
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Similar Products You Might Like",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2D2D2D),
                ),
              ),
              TextButton(
                onPressed: () {
                  // View all products
                },
                child: const Text(
                  "View All",
                  style: TextStyle(
                    color: Color(0xFFe06c9f),
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),

        // Products Horizontal List
        SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: similarProducts.length,
            itemBuilder: (context, index) {
              final product = similarProducts[index];
              return _buildProductCard(product);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildProductCard(Map<String, dynamic> product) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 12),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              color: const Color(0xFFF5F5F5),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              child: Image.network(
                product['image'] as String,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: const Color(0xFFedbfb7),
                    child: const Center(
                      child: Icon(Icons.eco, color: Colors.white, size: 32),
                    ),
                  );
                },
              ),
            ),
          ),

          // Product Info
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Brand
                Text(
                  product['brand'] as String,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF6B7280),
                  ),
                ),

                const SizedBox(height: 4),

                // Product Name
                Text(
                  product['name'] as String,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2D2D2D),
                    height: 1.2,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: 8),

                // Rating and Price
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Rating
                    Row(
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          size: 14,
                          color: Color(0xFFFFD700),
                        ),
                        const SizedBox(width: 2),
                        Text(
                          product['rating'].toString(),
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF2D2D2D),
                          ),
                        ),
                      ],
                    ),

                    // Price
                    Text(
                      product['price'] as String,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFe06c9f),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRetakeQuizButton() {
    return Container(
      margin: const EdgeInsets.all(16),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFe06c9f),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0,
          shadowColor: Colors.transparent,
        ),
        onPressed: () async {
          final updatedProfile = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) =>
                  OnboardingScreen(initialPage: 1, existingProfile: profile),
            ),
          );

          if (updatedProfile != null && updatedProfile is UserSkinProfile) {
            setState(() {
              profile = updatedProfile;
            });
          }
        },
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.quiz_rounded, size: 20, color: Colors.white),
            SizedBox(width: 12),
            Text(
              "Retake Quiz",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}