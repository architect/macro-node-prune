#!/usr/bin/env sh

# Fork of https://github.com/tuananh/node-prune
#   ... which is a port of https://github.com/tj/node-prune to bash
#
# See also:
#   - https://github.com/tuananh/node-prune
#   - https://github.com/timoxley/cruft
#   - https://yarnpkg.com/en/docs/cli/autoclean
#   - https://github.com/ModClean/modclean
#
# Prunes common files that are unnecessarily published in npm packages
# when people don't configure `.npmignore` or package.json's `files`

fileCount (){
  find . -type d -prune -exec find {} -type f \
  -not -path "*architect/shared*" \
  -not -path "*architect/views*" \
  -not -path "*@begin*" \
  -not -path "*@smallwins*" \; | wc -l
}

beforeSize=$(du -hsk . | cut -d$'\t' -f 1)
beforeFiles=$(fileCount)

# Common unneeded files
find . -type d -name node_modules -prune -exec find {} -type f \( \
  -name   _config.yml -o \
  -name   .appveyor.yml -o \
  -name   .babelrc -o \
  -name   .coveralls.yml -o \
  -name   .dir-locals.el -o \
  -name   .dntrc -o \
  -name   .documentup.json -o \
  -iname  .ds_store -o \
  -name   .editorconfig -o \
  -name   .editorconfig -o \
  -name   .eslintignore -o \
  -name   .eslintrc -o \
  -name   .eslintrc.js -o \
  -name   .eslintrc.json -o \
  -name   .eslintrc.yaml -o \
  -name   .eslintrc.yml -o \
  -name   .flowconfig -o \
  -name   .gitattributes -o \
  -name   .gitignore -o \
  -name   .gitkeep -o \
  -name   .gitlab-ci.yml -o \
  -name   .gitmodules -o \
  -name   .gradle -o \
  -name   .htmllintrc -o \
  -name   .idea -o \
  -name   .istanbul.yml -o \
  -name   .jamignore -o \
  -name   .jsbeautifyrc -o \
  -name   .jscsrc -o \
  -name   .jshintignore -o \
  -name   .jshintrc -o \
  -name   .lint -o \
  -name   .lintignore -o \
  -name   .npmignore -o \
  -name   .npmrc -o \
  -name   .stylelintrc -o \
  -name   .stylelintrc.js -o \
  -name   .stylelintrc.json -o \
  -name   .stylelintrc.yaml -o \
  -name   .stylelintrc.yml -o \
  -name   .tern-port -o \
  -name   .tern-project -o \
  -name   .travis.yml -o \
  -name   .yarn-integrity -o \
  -name   .yarn-metadata.json -o \
  -name   .yarnclean -o \
  -name   .yo-rc -o \
  -name   .yo-rc.json -o \
  -name   .zuul.yml -o \
  -name   appveyor.yml -o \
  -iname  AUTHORS -o \
  -name   benchmark -o \
  -name   bower.json -o \
  -name   builderror.log -o \
  -name   cakefile -o \
  -iname  CHANGELOG -o \
  -iname  CHANGELOG.md -o \
  -iname  changes -o \
  -name   circle.yml -o \
  -iname  CONTRIBUTORS -o \
  -name   desktop.ini -o \
  -name   dockerfile -o \
  -name   eslint -o \
  -iname  Gruntfile.js -o \
  -iname  Gulpfile.js -o \
  -name   htmllint.js -o \
  -name   jest.config.js -o \
  -name   jsl.conf -o \
  -name   jsstyle -o \
  -name   karma.conf.js -o \
  -iname  LICENCE -o \
  -iname  LICENSE -o \
  -iname  LICENSE-BSD -o \
  -iname  LICENSE-jsbn -o \
  -iname  LICENSE-MIT -o \
  -iname  LICENSE-MIT.txt -o \
  -iname  LICENSE.BSD -o \
  -iname  LICENSE.md -o \
  -iname  LICENSE.txt -o \
  -iname  Makefile -o \
  -name   mocha.opts -o \
  -name   npm-debug.log -o \
  -iname  README -o \
  -iname  README.md -o \
  -iname  README.txt -o \
  -name   robot.html -o \
  -name   stylelint.config.js -o \
  -iname  thumbs.db -o \
  -name   tsconfig.json -o \
  -name   wercker.yml -o \
  -name   "*.coffee" -o \
  -name   "*.gypi" -o \
  -name   "*.jst" -o \
  -name   "*.markdown" -o \
  -name   "*.md" -o \
  -name   "*.mkd" -o \
  -name   "*.obj" -o \
  -name   "*.sln" -o \
  -name   "*.swp" -o \
  -name   "*.vcxproj.filters" -o \
  -name   "*.vcxproj" -o \
  \( -name   '*.ts' -and \! -name '*.d.ts' \) \
\) \
-not -path "*@architect/shared*" \
-not -path "*@architect/views*" \
-not -path "*@begin*" \
-not -path "*@smallwins*" \
-print0 \; | xargs -0 rm -rf

# Common unneeded directories
find . -type d -name node_modules -prune -exec find {} -type d \( \
  -name   __mocks__ -o \
  -name   __tests__ -o \
  -name   __test__ -o \
  -name   .circleci -o \
  -name   .github -o \
  -name   .idea -o \
  -name   .nyc_output -o \
  -name   .vscode -o \
  -name   assets -o \
  -name   coverage -o \
  -name   doc -o \
  -name   docs -o \
  -name   example -o \
  -name   examples -o \
  -name   images -o \
  -name   powered-test -o \
  -name   samples -o \
  -name   test -o \
  -name   tests -o \
  -name   website \
\) \
-not -path "*@architect/shared*" \
-not -path "*@architect/views*" \
-not -path "*@begin*" \
-not -path "*@smallwins*" \
-print0 \; | xargs -0 rm -rf

# TODO look into issues I was seeing before removing these
# -name node-gyp -o \
# -name node-pre-gyp -o \
# -name gyp -o \

afterSize=$(du -hsk . | cut -d$'\t' -f 1)
afterFiles=$(fileCount)

echo ${beforeSize}
echo ${afterSize}
echo ${beforeFiles}
echo ${afterFiles}
