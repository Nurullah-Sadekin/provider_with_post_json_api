class AlbumList {
  final List<Album> albums;

  AlbumList({
    this.albums,
  });

  factory AlbumList.fromJson(List<dynamic> parsedJson) {
    List<Album> albums = List<Album>();
    albums = parsedJson.map((i) => Album.fromJson(i)).toList();

    return AlbumList(albums: albums);
  }
}

class Album {
  final int userId;
  final int id;
  final String title;
  final String body;
  Album({this.userId, this.id, this.title, this.body});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
