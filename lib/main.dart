import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book List'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          ClickableCard(
            bookName: 'A Brief History Of Time',
            authorName: 'Stephen Hawking',
            rating: '4.5',
            bookCoverImageUrl: 'https://example.com/book1.jpg',
            description: 'A story about the world.',
            cardColor: Colors.blueAccent,
          ),
          ClickableCard(
            bookName: 'Harry Potter And The Half Blood Prince',
            authorName: 'J.K.Rowling',
            rating: '3.8',
            bookCoverImageUrl: 'https://example.com/book2.jpg',
            description: 'An intriguing mystery about three people.',
            cardColor: Colors.greenAccent,
          ),
          
        ],
      ),
    );
  }
}

class ClickableCard extends StatelessWidget {
  final String bookName;
  final String authorName;
  final String rating;
  final String bookCoverImageUrl;
  final String description;
  final Color cardColor;

  const ClickableCard({super.key, 
    required this.bookName,
    required this.authorName,
    required this.rating,
    required this.bookCoverImageUrl,
    required this.description,
    required this.cardColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SecondPage(bookName, bookCoverImageUrl, description, cardColor)),
          );
        },
        child: ListTile(
          leading: Image.network(bookCoverImageUrl),
          title: Text(bookName, style: const TextStyle(color: Color.fromARGB(255, 96, 38, 38))),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(authorName, style: const TextStyle(color: Color.fromARGB(255, 134, 71, 71))),
              Text('Rating: $rating', style: const TextStyle(color: Color.fromARGB(255, 135, 46, 46))),
            ],
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final String bookName;
  final String bookCoverImageUrl;
  final String description;
  final Color cardColor;

  const SecondPage(this.bookName, this.bookCoverImageUrl, this.description, this.cardColor, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Book Name: $bookName', style: const TextStyle(fontSize: 20.0)),
            Image.network(bookCoverImageUrl),
            const Text('Author: Stephen Hawking', style: TextStyle(fontSize: 16.0)),
            Text('Description: $description', style: const TextStyle(fontSize: 16.0)),
            DropdownButton<String>(
              items: ['Option 1', 'Option 2', 'Option 3']
                  .map((String value) => DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      ))
                  .toList(),
              onChanged: (String? value) {
                
              },
              hint: const Text('Select an option'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); 
              },
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}   