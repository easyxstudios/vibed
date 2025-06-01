module.exports = {
    root: true,
    env: {
        es6: true,
        node: true,
    },
    extends: [
        "eslint:recommended",
        "plugin:import/errors",
        "plugin:import/warnings",
        "plugin:import/typescript",
        "google",
        "plugin:@typescript-eslint/recommended",
    ],
    parser: "@typescript-eslint/parser",
    parserOptions: {
        project: ["tsconfig.json", "tsconfig.dev.json"],
        sourceType: "module",
    },
    ignorePatterns: [
        "/lib/**/*", // Ignore built files.
    ],
    plugins: [
        "@typescript-eslint",
        "import",
    ],
    rules: {
        "linebreak-style": ["off"],
        "import/no-unresolved": 0,
        "indent": 0,
        "max-len": ["error", { "code": 120 }],
        "require-jsdoc": 0,
        "@typescript-eslint/no-empty-interface": 0,
        "valid-jsdoc": 0,
        "camelcase": 0,
        "object-curly-spacing": 0,
        "no-trailing-spaces": 0,
        "operator-linebreak": 0,
        "padded-blocks": 0,
        "eol-last": 0,
        "@typescript-eslint/no-var-requires": 0,
        "quotes": 0,
        "spaced-comment": 0,
    },
};
