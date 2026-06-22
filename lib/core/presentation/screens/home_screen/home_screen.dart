import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../modules/roadmap/ui/screens/roadmap_screen/roadmap_screen.dart';
import '../../../constants/asset_paths.dart';
import '../../../di/di.dart';
import '../../bases/base_stateful_widget_state.dart';
import 'view_model/home_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseStatefulWidgetState<HomeScreen> {
  final PageController _pageController = PageController();
  final HomeViewModel _viewModel = getIt.get();

  @override
  void initState() {
    super.initState();
    _viewModel.addListener(() {
      _pageController.jumpToPage(_viewModel.currentPageIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _viewModel,
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          onPageChanged: _viewModel.jumpToPage,
          children: const [
            RoadmapPage(),
            Center(child: Text('Taken Quizzes Page')),
            Center(child: Text('Profile Page')),
          ],
        ),

        bottomNavigationBar: Consumer<HomeViewModel>(
          builder: (context, viewModel, child) {
            return BottomNavigationBar(
              currentIndex: _viewModel.currentPageIndex,
              onTap: _viewModel.jumpToPage,
              iconSize: 20,
              items: [
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage(
                      _viewModel.currentPageIndex == 0
                          ? AssetPaths.homeIconFilled
                          : AssetPaths.homeIcon,
                    ),
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage(
                      _viewModel.currentPageIndex == 1
                          ? AssetPaths.takenQuizzesIconFilled
                          : AssetPaths.takenQuizzesIcon,
                    ),
                  ),
                  label: 'Taken Quizzes',
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage(
                      _viewModel.currentPageIndex == 2
                          ? AssetPaths.profileIconFilled
                          : AssetPaths.profileIcon,
                    ),
                  ),
                  label: 'Profile',
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
