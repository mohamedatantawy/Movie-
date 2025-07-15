import 'dart:async';

import 'package:movie/feature/Home/doamin/Entity/moiveEntity.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Sqlitemothed {
  static Database? _db;
  Future<Database?> get db async {
    if (_db == null) {
      _db = await initdadabase();
      return _db;
    } else {
      return _db;
    }
  }

  initdadabase() async {
    String databasepath = await getDatabasesPath();

    String path = join(databasepath, 'movie.db');
    Database mydatabase = await openDatabase(
      path,
      onCreate: _oncreate,
      version: 1,
      onUpgrade: _onupgrade,
    );
    return mydatabase;
  }

  _oncreate(Database db, int version) async {
    await db.execute('''
CREATE TABLE movies (
        idmoive INTEGER PRIMARY KEY,
        name TEXT NOT NULL,
        imageurl TEXT,
        subtitle TEXT NOT NULL,
        rating REAL NOT NULL,
        timestart TEXT
      )
''');
  }
Future<List<Moiveentity>> getAllMovies() async {
  final mydb = await db;
  final List<Map<String, dynamic>> maps = await mydb!.query('movies');
  return List.generate(maps.length, (i) {
    return Moiveentity(
      idmoive: maps[i]['idmoive'],
      name: maps[i]['name'],
      imageurl: maps[i]['imageurl'],
      subtitle: maps[i]['subtitle'],
      rating: maps[i]['rating'],
      timestart: maps[i]['timestart'],
    );
  });
}
  readData(String sql) async {
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery(sql);
    return response;
  }

  insertData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawInsert(sql);
    return response;
  }

  Future<int> saveMovie(Moiveentity movie) async {
    try {
      final mydb = await db;
      return await mydb!.insert(
        'movies',
        {
          'idmoive': movie.idmoive,
          'name': movie.name,
          'imageurl': movie.imageurl,
          'subtitle': movie.subtitle,
          'rating': movie.rating,
          'timestart': movie.timestart,
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      print('Error saving movie: $e');
      return 0;
    }
  }

  Future<int> deleteMovie(int idmoive) async {
    final mydb = await db;
    return await mydb!.delete(
      'movies',
      where: 'idmoive = ?',
      whereArgs: [idmoive],
    );
  }

  upData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }

  deleteData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    return response;
  }

  _onupgrade(Database db, int oldVersion, int newVersion) {}
}
