import 'package:flutter/material.dart';
import 'package:myapp/model/video.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Videoplayerscreen extends StatefulWidget {
  final Video video;
  const Videoplayerscreen({
    super.key,
    required this.video,
  });

  @override
  State<Videoplayerscreen> createState() => _VideoplayerscreenState();
}

class _VideoplayerscreenState extends State<Videoplayerscreen> {
  late YoutubePlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = YoutubePlayerController(
      initialVideoId: widget.video.id,
      flags: const YoutubePlayerFlags(autoPlay: true, mute: false),
    );
    controller.addListener(() {
      if (controller.value.isFullScreen || !controller.value.isFullScreen == false) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: controller.value.isFullScreen
          ? null
          : AppBar(
              title: const Text("Assistir Video"),
            ),
      body: Column(
        children: [
          Expanded(
            child: YoutubePlayer(
              controller: controller,
              showVideoProgressIndicator: true,
              width: double.infinity,
            ),
          ),
          if (!controller.value.isFullScreen) ...[
            ListTile(
              title: Text(
                widget.video.titulo,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(widget.video.descricao),
            ),
            ListTile(
              title: Text(
                widget.video.canal,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            )
          ],
        ],
      ),
    );
  }
}
