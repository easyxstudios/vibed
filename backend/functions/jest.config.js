/** @type {import('ts-jest/dist/types').InitialOptionsTsJest} */
module.exports = {
  preset: "ts-jest",
  testEnvironment: "node",
  testRegex: "(/__tests__/.*|(\\.|/)(test|spec))\\.(jsx?|tsx?)$",
  transform: {
    "^.+\\.tsx?$": "ts-jest",
  },
  rootDir: "src",
  moduleFileExtensions: ["ts", "tsx", "js", "jsx", "json", "node"],
  coverageProvider: "babel",
  collectCoverage: true,
  testTimeout: 10000,
  coverageDirectory: "../coverage",
  coverageReporters: ["clover", "json", "lcov", "text-summary"],
};
