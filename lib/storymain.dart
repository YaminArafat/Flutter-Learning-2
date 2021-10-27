import 'package:angela3_i_m_rich/story.dart';

class StoryMain {
  int _storyNo = 0;
  List<Story> _stories = [
    Story(storyText: 'a', storyTextForOp1: 'b', storyTextForOp2: 'c'),
    Story(storyText: 'b', storyTextForOp1: 'c', storyTextForOp2: 'd'),
    Story(storyText: 'c', storyTextForOp1: 'd', storyTextForOp2: 'e'),
    Story(storyText: 'd', storyTextForOp1: 'e', storyTextForOp2: 'e'),
  ];

  String getStory() {
    return _stories[_storyNo].storyText;
  }

  String getStoryOp1() {
    return _stories[_storyNo].storyTextForOp1;
  }

  String getStoryOp2() {
    return _stories[_storyNo].storyTextForOp2;
  }

  String findNextStory(String curr) {
    return '';
  }

  void nextStory() {
    if (_storyNo < _stories.length - 1) {
      _storyNo++;
    }
  }

  bool isOver() {
    return _storyNo == _stories.length - 1;
  }

  void setStory() {
    _storyNo = 0;
  }
}
