import OhosSkiaApp from 'libviewer.so';
import { Logger } from '../utils/Logger';
import { NodeContent } from '@kit.ArkUI';

@Entry
@Component
struct Index {
  @State message: string = 'Viewer';
  private viewerContent: NodeContent = new NodeContent();

  aboutToAppear(): void {
    OhosSkiaApp.createNativeNode(this.viewerContent);
  }

  onDidBuild(): void {}

  aboutToDisappear(): void {}

  setGanesh(): void {
    OhosSkiaApp.setGanesh();
  }

  setGraphiteVulkan(): void {
    OhosSkiaApp.setGraphiteVulkan();
  }

  setGraphiteDawn(): void {
    OhosSkiaApp.setGraphiteDawn();
  }

  onBackPress(): void {}
  aboutToReuse(): void {}
  aboutToRecycle(): void {}
  onWillApplyTheme(theme: Theme): void {}

  build() {
    Column() {
      Tabs({barPosition: BarPosition.End,
            index: 0}) {
        TabContent() {
          ContentSlot(this.viewerContent) // In theory, this.nodeContent should not be copied everytime
        }.tabBar("Ganesh")
        TabContent() {
          ContentSlot(this.viewerContent)
        }.tabBar("Graphite")
        TabContent() {
          ContentSlot(this.viewerContent)
        }.tabBar("Dawn")
      }.onChange((index: number) => {
        if (index == 0) {
          OhosSkiaApp.setGanesh();
        } else if (index == 1) {
          OhosSkiaApp.setGraphiteVulkan();
        } else if (index == 2) {
          OhosSkiaApp.setGraphiteDawn();
        }
      })
      .width('100%')
    }
    .height('100%')
  }
}
