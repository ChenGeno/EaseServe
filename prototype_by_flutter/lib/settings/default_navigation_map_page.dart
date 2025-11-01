import 'package:flutter/material.dart';

/// Page for selecting which navigation map should be used by default.
class DefaultNavigationMapPage extends StatefulWidget {
  const DefaultNavigationMapPage({super.key});

  @override
  State<DefaultNavigationMapPage> createState() =>
      _DefaultNavigationMapPageState();
}

class _DefaultNavigationMapPageState extends State<DefaultNavigationMapPage> {
  NavigationMapOption _selected = NavigationMapOption.gaode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        centerTitle: true,
        toolbarHeight: 44,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Color(0xFF2A2E39),
            size: 20,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          '默认导航地图设置',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFF2A2E39),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(22),
            boxShadow: const [
              BoxShadow(
                color: Color(0x0F000000),
                blurRadius: 18,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _MapOptionTile(
                title: '百度地图',
                trailing: GestureDetector(
                  onTap: () => _showDownloadHint(context),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                    child: Text(
                      '下载',
                      style: TextStyle(
                        color: Color(0xFF2A8BF2),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                selected: _selected == NavigationMapOption.tencent,
                onTap: () => _updateSelection(NavigationMapOption.tencent),
              ),
              const Divider(
                height: 1,
                indent: 16,
                endIndent: 16,
                color: Color(0xFFE9EDF5),
              ),
              _MapOptionTile(
                title: '高德地图',
                selected: _selected == NavigationMapOption.gaode,
                onTap: () => _updateSelection(NavigationMapOption.gaode),
              ),
              const Divider(
                height: 1,
                indent: 16,
                endIndent: 16,
                color: Color(0xFFE9EDF5),
              ),
              _MapOptionTile(
                title: '系统地图',
                selected: _selected == NavigationMapOption.system,
                onTap: () => _updateSelection(NavigationMapOption.system),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _updateSelection(NavigationMapOption option) {
    setState(() {
      _selected = option;
    });

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text('已选择${option.displayName}为默认导航地图'),
          behavior: SnackBarBehavior.floating,
        ),
      );
  }

  void _showDownloadHint(BuildContext context) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        const SnackBar(
          content: Text('敬请期待腾讯地图下载功能'),
          behavior: SnackBarBehavior.floating,
        ),
      );
  }
}

enum NavigationMapOption {
  tencent('百度地图'),
  gaode('高德地图'),
  system('系统地图');

  final String displayName;

  const NavigationMapOption(this.displayName);
}

class _MapOptionTile extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback onTap;
  final Widget? trailing;

  const _MapOptionTile({
    required this.title,
    required this.selected,
    required this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final selectedColor = selected ? const Color(0xFFF2994A) : const Color(0xFFD0D5DD);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(22),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1D2530),
                  ),
                ),
              ),
              if (trailing != null) trailing!,
              const SizedBox(width: 12),
              Icon(
                selected ? Icons.radio_button_checked : Icons.radio_button_unchecked,
                color: selectedColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
