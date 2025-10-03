import 'package:flutter/material.dart';
import '../components/header_section.dart';
import '../components/hero_banner.dart';
import '../components/scan_button.dart';
import '../components/category_tabs.dart';
import '../components/product_grid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedCategory = 0;

  void _onCategoryChanged(int index) {
    setState(() {
      _selectedCategory = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFCFB), // Soft off-white background
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header Section
                    HeaderSection(userName: "Sarah"),
                    
                    const SizedBox(height: 8),
                    
                    // Hero Banner
                    const HeroBanner(),
                    
                    const SizedBox(height: 20),
                    
                    // Scan Button
                    const ScanButton(),
                    
                    const SizedBox(height: 24),
                    
                    // Category Tabs
                    CategoryTabs(
                      selectedIndex: _selectedCategory,
                      onCategoryChanged: _onCategoryChanged,
                    ),
                    
                    const SizedBox(height: 20),
                    
                    // Product Grid
                    const ProductGrid(),
                    
                    const SizedBox(height: 80), // Space for bottom nav
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}