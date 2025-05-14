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

  setGaneshGL(): void {
    OhosSkiaApp.setGaneshGL();
  }

  setGaneshVk(): void {
    OhosSkiaApp.setGaneshVk();
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
        }.tabBar("Ganesh GL")
        TabContent() {
          ContentSlot(this.viewerContent)
        }.tabBar("Ganesh Vk")
        TabContent() {
          ContentSlot(this.viewerContent)
        }.tabBar("Graphite")
        TabContent() {
          ContentSlot(this.viewerContent)
        }.tabBar("Dawn")
      }.onChange((index: number) => {
        if (index == 0) {
          OhosSkiaApp.setGaneshGL();
        } if (index == 1) {
          OhosSkiaApp.setGaneshVk();
        } else if (index == 2) {
          OhosSkiaApp.setGraphiteVulkan();
        } else if (index == 3) {
          OhosSkiaApp.setGraphiteDawn();
        }
      })
      .width('100%')
    }
    .height('100%')
  }
}
