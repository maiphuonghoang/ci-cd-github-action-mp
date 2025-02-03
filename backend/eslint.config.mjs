import globals from "globals";
import pluginJs from "@eslint/js";
import pluginReact from "eslint-plugin-react";


/** @type {import('eslint').Linter.Config[]} */
export default [
  {
    files: ["**/*.{js,mjs,cjs,jsx}"],
    languageOptions: {
      ecmaVersion: "latest",
      sourceType: "commonjs", // ✅ Allows `require` and `module.exports`
      globals: {
        ...globals.node, // ✅ Adds `require`, `module`, `process`, etc.
        ...globals.browser, // ✅ If you're working with frontend code
      },
    },
    rules: {
      // "no-console": "error", // ✅ Flags `console.log()`
      // "no-undef": "error", // ✅ Prevents undefined variables
    },
  },
  pluginJs.configs.recommended,
  pluginReact.configs.flat.recommended,
];