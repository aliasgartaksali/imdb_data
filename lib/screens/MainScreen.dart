import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/MovieList.dart';
import '../providers/movies.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TextEditingController _textFieldController = TextEditingController();
  var _allMovies = 0;
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    Provider.of<Movies>(context).fetchAndSetGenres();
    super.didChangeDependencies();
  }

  Future<void> fetchAllMovies() async {
    setState(() {
      _isLoading = true;
    });
    await Provider.of<Movies>(context, listen: false).fetchAndSetMovies(_textFieldController.text);
    setState(() {
      _allMovies = Provider.of<Movies>(context, listen: false).movieList.length;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 24,
            ),
            Row(
              children: <Widget>[
                Text(
                  "Home",
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w900,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _textFieldController,
              // onSubmitted: () => fetchAllMovies(),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black87),
                ),
                labelText: 'Search for movies',
                suffixIcon: IconButton(
                  onPressed: () => fetchAllMovies(),
                  icon: Icon(
                    Icons.search,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            (_allMovies == 0) ? (_isLoading ? CircularProgressIndicator() : Text("No movies to show currently...start typing something (Ex: Thor) and then click on the search button to view the movies.")) : MovieList(),
          ],
        ),
      ),
    );
  }
}
