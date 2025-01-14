import { hilog } from '@kit.PerformanceAnalysisKit';
import fs from '@ohos.file.fs';

@Entry
@Component
struct Index {
  @State message: string = 'Skia_Viewer';
  xcomponentController: XComponentController = new XComponentController();
  private xComponentContext: Record<string, () => void> = {};

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center}) {
      Text(this.message)// Title "Skia_Viewer
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .onClick(() => {})
      XComponent({
        id: 'xcomponentId',
        type: 'surface',
        controller: this.xcomponentController,
        libraryname: 'viewer'
      })
        .margin({ bottom: '10%' })
        .onLoad((xComponentContext?: object | Record<string, () => void>) => {
          if (xComponentContext) {
            this.xComponentContext = xComponentContext as Record<string, () => void>;
          }
        })
        .onDestroy(() => {})
        .width('80%')
        .height('50%')
    }
    .width('100%')
    .height('100%')
  }
}
