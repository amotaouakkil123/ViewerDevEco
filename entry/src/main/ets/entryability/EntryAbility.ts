import { AbilityConstant, UIAbility, Want } from '@ohos.app.ability.UIAbilityKit';
import { hilog } from '@ohos.hilog';
import { window } from '@ohos.window';

export class Logger {
  static DOMAIN: number = 0xFF00;
  static PREFIX: string = '[sample_viewer]';
  static FORMAT: string = '%{public}s, %{public}s'

  static debug(...args: string[]) {
    hilog.debug(Logger.DOMAIN, Logger.PREFIX, Logger.FORMAT, args);
  }

  static info(...args: string[]) {
    hilog.info(Logger.DOMAIN, Logger.PREFIX, Logger.FORMAT, args);
  }

  static warn(...args: string[]) {
    hilog.warn(Logger.DOMAIN, Logger.PREFIX, Logger.FORMAT, args);
  }

  static error(...args: string[]) {
    hilog.error(Logger.DOMAIN, Logger.PREFIX, Logger.FORMAT, args);
  }
}

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
  }

  onDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');
    globalThis.abilityContext = this.context;
    globalThis.context = this.context;

    windowStage.loadContent('pages/Index', (err) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content.');
    });
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
};
