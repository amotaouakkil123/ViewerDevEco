import fs from '@ohos.file.fs';
import hilog from '@ohos.file.fs';

@Entry
@Component
struct Index {
  @State message: string = 'Viewer';
  xcomponentController: XComponentController = new XComponentController();
  private xComponentContext: Record<string, () => void> = {};

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center}) {
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
        .width('100%')
        .height('100%')
    }
    .width('100%')
    .height('100%')
  }
}
