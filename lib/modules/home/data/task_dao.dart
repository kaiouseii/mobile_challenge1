import 'package:logger/logger.dart';
import 'package:mobile_challenge1/modules/home/views/home_screen/widgets/video_item.dart';
import 'package:sqflite/sqflite.dart';

class TaskDao {
  Logger logger = Logger();
  save(VideoItem videoItem, Database db) async {
    logger.i("Acessando o save");
    return await db.insert(
        'videos',
        VideoItem(
                url: videoItem.url,
                category: videoItem.category,
                index: videoItem.index,
                imageUrl: videoItem.imageUrl)
            .toMap());
  }

  update(VideoItem videoItem, Database db) async {
    logger.i("Acessando o update");
    return await db.rawUpdate(
      '''
      UPDATE videos
      SET id = ${videoItem.index},
      sourceUrl = '${videoItem.url}',
      imageUrl= '${videoItem.imageUrl}',
      category = '${videoItem.category}'
      WHERE id = ${videoItem.index}
      '''
    );
  }

  delete(VideoItem videoItem, Database db) async {
    logger.i("Acessando o delete");
    return await db.delete(
      'videos',
      whereArgs: [videoItem.index],
    );
  }

  searchAll(Database db) async {
    logger.i("Acessando o searchAll");
    final List<Map<String, dynamic>> listOfVideos =
        await db.rawQuery("SELECT * FROM videos");
    logger.i("Procurando dados no banco... encontrado: $listOfVideos");
    return toList(listOfVideos);
  }

  toList(List<Map<String, dynamic>> listOfVideos) {
    logger.i("Convertando to list");
    final List<VideoItem> videos = [];
    for (Map<String, dynamic> line in listOfVideos) {
      final VideoItem videoItem = VideoItem(
        url: line['sourceUrl'],
        category: line['category'],
        index: line['id'],
        imageUrl: line['imageUrl'],
      );
      videos.add(videoItem);
    }
    logger.i("Lista de videos $videos");
    return videos;
  }
}
