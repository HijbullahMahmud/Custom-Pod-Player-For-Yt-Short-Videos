part of 'package:pod_player/src/pod_player.dart';

class _MobileOverlay extends StatelessWidget {
  final String tag;

  const _MobileOverlay({
    required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    const overlayColor = Colors.black38;
    // const itemColor = Colors.white;
    // final podCtr = Get.find<PodGetXVideoController>(tag: tag);
    return Stack(
      alignment: Alignment.center,
      children: [
        _VideoGestureDetector(
          tag: tag,
          child: ColoredBox(
            color: overlayColor,
            child: Row(
              children: [
                const Expanded(child: SizedBox()),
                SizedBox(
                  height: double.infinity,
                  child: Center(
                    child: _AnimatedPlayPauseIcon(tag: tag, size: 42),
                  ),
                ),
                const Expanded(child: SizedBox()),
              ],
            ),
          ),
        ),
      ],
    );
  }

  bool _isRtl() {
    final Locale locale = WidgetsBinding.instance.platformDispatcher.locale;
    final langs = [
      'ar', // Arabic
      'fa', // Farsi
      'he', // Hebrew
      'ps', // Pashto
      'ur', // Urdu
    ];
    for (int i = 0; i < langs.length; i++) {
      final lang = langs[i];
      if (locale.toString().contains(lang)) {
        return true;
      }
    }
    return false;
  }

  void _bottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (context) => SafeArea(child: _MobileBottomSheet(tag: tag)),
    );
  }
}
