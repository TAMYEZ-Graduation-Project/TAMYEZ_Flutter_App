import '../../../../../../core/constants/app_enums.dart';
import '../../../../../../core/entities/career_entity.dart';
import '../../../../../../core/entities/roadmap_step_entity.dart';

class RoadmapScreenSkeletonizerFakeData {
  final CareerEntity fakeCareer = const CareerEntity(
    id: '1',
    title: 'Software Engineer',
    pictureUrl: 'https://picsum.photos/200/300',
    roadmap: [
      RoadmapStepEntity(
        id: '1',
        title: 'Introduction to Programming',
        progressStatus: RoadmapStepProgressStatusEnum.completed,
      ),
      RoadmapStepEntity(
        id: '2',
        title: 'Data Structures and Algorithms',
        progressStatus: RoadmapStepProgressStatusEnum.inProgress,
      ),
      RoadmapStepEntity(
        id: '3',
        title: 'Web Development',
        progressStatus: RoadmapStepProgressStatusEnum.available,
      ),
      RoadmapStepEntity(id: '4', title: 'Database Management'),
    ],
  );
}
