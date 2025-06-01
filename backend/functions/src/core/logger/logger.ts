import * as functions from "firebase-functions";

export class Logger {
  constructor(private className: string) {}

  info(message: string) {
    functions.logger.info(`[${this.className}] ${message}`);
  }

  error(message: string, error?: Error | unknown ) {
    functions.logger.error(`[${this.className}] ${message}`, error);
    if (error instanceof Error) {
      functions.logger.error(`[${this.className}] ${error.stack}`);
    }
  }
}
