import 'package:flutter/material.dart';
import 'package:provider_with_post_json_api/Model/postModel.dart';
import 'package:provider_with_post_json_api/util/post_service.dart';

class AlbumList extends StatefulWidget {
  @override
  _AlbumListState createState() => _AlbumListState();
}

class _AlbumListState extends State<AlbumList> {
  Future<List<Album>> futureAlbum;
  @override
  void initState() {
    super.initState();
    futureAlbum = fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fetch Data Example'),
      ),
      body: Center(
        child: FutureBuilder<List<Album>>(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                        leading: Text(snapshot.data[index].id.toString()),
                        title: Text(snapshot.data[index].title));
                  });
              // return Text(snapshot.data.body);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            // By default, show a loading spinner.
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
