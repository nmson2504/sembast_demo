import 'package:flutter/material.dart';
import 'package:sembast_demo/dao/books_dao.dart';
import 'package:sembast_demo/model/books_model.dart';

class BooksList extends StatefulWidget {
  @override
  _BooksListState createState() => _BooksListState();
}

class _BooksListState extends State<BooksList> {
  final BooksDao dao = BooksDao();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Books List"),
      ),
      body: FutureBuilder<List<Books>>(
        future: dao.getAllBooks(),
        builder: (context, snapshot) {
          // Check for connection state
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            } else if (snapshot.hasData) {
              // Ensure snapshot.data is not null
              final books = snapshot.data!;
              return ListView.builder(
                itemCount: books.length,
                itemBuilder: (context, index) {
                  final book = books[index];
                  return ListTile(
                    title: Text(book.name),
                    trailing: Text(book.rollNo.toString()),
                    onTap: () {
                      setState(() {
                        // Call delete method from BooksDao
                        dao.delete(Books(rollNo: book.rollNo, name: ''));
                        // Refresh the list by reloading data
                        // This example assumes `getAllBooks` is a method that updates the UI.
                      });
                    },
                  );
                },
              );
            } else {
              return Center(child: Text("No data available"));
            }
          } else {
            return Center(child: Text("Unexpected state"));
          }
        },
      ),
    );
  }
}
