import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog';
import window from '@ohos.window';

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
  onCreate(want, launchParam): void {
    Logger.info('Ability onCreate');
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
  }

  onDestroy(): void {
    Logger.info('Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    Logger.info('Ability onWindowStageCreate');
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
    Logger.info('Ability onWindowStageDestroy');
  }

  onForeground(): void {
    // Ability has brought to foreground
    Logger.info('Ability onForeground');
  }

  onBackground(): void {
    // Ability has back to background
    Logger.info('Ability onWindowStageDestroy');
  }
};
