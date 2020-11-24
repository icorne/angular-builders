#!/usr/bin/env bash
function installNext() {
    yarn workspace simple-app add @angular-builders/custom-webpack@next
    yarn workspace multiple-apps add @angular-builders/custom-webpack@next
}

installNext
#Check that it works the same way angular-devkit builders do when there is no custom webpack config provided
cd ./examples/sanity-app
#ng build is verified during lerna run
yarn test --browsers=ChromeHeadlessCI
yarn e2e --protractor-config=./e2e/protractor-ci.conf.js

#Check scenarios with custom webpack config
cd ../full-cycle-app
#ng build is verified during lerna run
#check karma builder
yarn test --browsers=ChromeHeadlessCI
#check browser and dev-server
yarn e2e --protractor-config=./e2e/protractor-ci.conf.js
yarn e2e --protractor-config=./e2e/protractor-ci-prod.conf.js --prod
yarn e2e --protractor-config=./e2e/protractor-ci-itwcw.conf.js -c itwcw


