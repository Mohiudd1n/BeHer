import 'package:flutter/material.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> products = [
      {
        'name': 'Shiseido',
        'background': const Color(0xFFfef2f4),
        'image': 'https://images.unsplash.com/photo-1556228578-8c89e6adf883?w=150&h=150&fit=crop',
        'isLiked': false,
        'price': '\$42.99',
      },
      {
        'name': 'Huxley',
        'background': const Color(0xFFe8f4f8),
        'image': 'https://images.unsplash.com/photo-1571781926291-c477ebfd024b?w=150&h=150&fit=crop',
        'isLiked': true,
        'price': '\$36.50',
      },
      {
        'name': 'Glow Recipe',
        'background': const Color(0xFFf0f7ed),
        'image': 'https://images.unsplash.com/photo-1596462502278-27bfdc403348?w=150&h=150&fit=crop',
        'isLiked': false,
        'price': '\$28.75',
      },
      {
        'name': 'Kiehl\'s',
        'background': const Color(0xFFfdf2f8),
        'image': 'https://images.unsplash.com/photo-1631729371254-42c2892f0e6e?w=150&h=150&fit=crop',
        'isLiked': true,
        'price': '\$52.00',
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1 / 1.3,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          
          return ProductCard(
            name: product['name'] as String,
            background: product['background'] as Color,
            imageUrl: product['image'] as String,
            isLiked: product['isLiked'] as bool,
            price: product['price'] as String,
          );
        },
      ),
    );
  }
}

class ProductCard extends StatefulWidget {
  final String name;
  final Color background;
  final String imageUrl;
  final bool isLiked;
  final String price;

  const ProductCard({
    super.key,
    required this.name,
    required this.background,
    required this.imageUrl,
    required this.isLiked,
    required this.price,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
    isLiked = widget.isLiked;
  }

  void _toggleLike() {
    setState(() {
      isLiked = !isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.background,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Product Content
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Image
                Expanded(
                  child: Center(
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          widget.imageUrl,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFFedbfb7),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(
                                Icons.eco,
                                color: Colors.white,
                                size: 32,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                
                const SizedBox(height: 12),
                
                // Product Name
                Text(
                  widget.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2D2D2D),
                  ),
                ),
                
                const SizedBox(height: 4),
                
                // Price
                Text(
                  widget.price,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFFe06c9f),
                  ),
                ),
              ],
            ),
          ),
          
          // Heart Icon
          Positioned(
            top: 12,
            right: 12,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: _toggleLike,
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Icon(
                    isLiked ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                    size: 18,
                    color: isLiked ? const Color(0xFFe06c9f) : const Color(0xFF9CA3AF),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}