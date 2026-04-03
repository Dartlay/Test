import 'package:flutter/material.dart';

class MainBooksPage extends StatelessWidget {
  const MainBooksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Мои книги'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          BookCard(
            title: 'Война и мир',
            author: 'Лев Толстой',
            coverColor: Colors.blue,
          ),
          SizedBox(height: 12),
          BookCard(
            title: 'Преступление и наказание',
            author: 'Фёдор Достоевский',
            coverColor: Colors.red,
          ),
          SizedBox(height: 12),
          BookCard(
            title: 'Мастер и Маргарита',
            author: 'Михаил Булгаков',
            coverColor: Colors.purple,
          ),
          SizedBox(height: 12),
          BookCard(
            title: 'Анна Каренина',
            author: 'Лев Толстой',
            coverColor: Colors.green,
          ),
          SizedBox(height: 12),
          BookCard(
            title: 'Отцы и дети',
            author: 'Иван Тургенев',
            coverColor: Colors.teal,
          ),
        ],
      ),
    );
  }
}

class BookCard extends StatelessWidget {
  final String title;
  final String author;
  final Color coverColor;

  const BookCard({
    super.key,
    required this.title,
    required this.author,
    required this.coverColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 80,
            decoration: BoxDecoration(
              color: coverColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.menu_book, color: Colors.white, size: 32),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  author,
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
          Icon(Icons.chevron_right, color: Colors.grey.shade400),
        ],
      ),
    );
  }
}
