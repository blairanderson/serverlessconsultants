// Assigning modules to local variables
var gulp = require('gulp');
var data = require('gulp-data');
var fs = require('fs');
var request = require('request');
var async = require('async');
require('dotenv').config();
var SERVERLESS_PLUGINS = '_data/serverless_plugins.json';

// Copy Tachyons core files from node_modules to vendor directory
gulp.task('default', ['tachyons-core', 'tachyons-main']);

gulp.task('tachyons-core', function() {
  return gulp
    .src(['node_modules/tachyons-sass/scss/*.scss'])
    .pipe(gulp.dest('_sass/tachyons-sass/scss/'));
});

gulp.task('tachyons-main', function() {
  return gulp
    .src(['node_modules/tachyons-sass/tachyons.scss'])
    .pipe(gulp.dest('_sass/tachyons-sass'));
});

gulp.task('sync:plugins', ['sync:fetch-plugins', 'sync:plugin-repo-package']);

gulp.task('sync:fetch-plugins', function() {
  return request(
    'https://raw.githubusercontent.com/serverless/plugins/master/plugins.json'
  ).pipe(fs.createWriteStream(SERVERLESS_PLUGINS));
});

gulp.task('sync:plugin-repo-package', function(done) {
  var plugins = JSON.parse(fs.readFileSync(SERVERLESS_PLUGINS, 'utf8'));

  async.map(
    plugins,
    function getInfo(plugin, callback) {
      request(
        `https://api.npmjs.org/downloads/point/last-month/${plugin.name}`,
        function(err, resp, data) {
          if (err) {
            console.log(err);
            callback(null, Object.assign(plugin, { 'last-month': 0 }));
          } else {
            console.log(data);
            var downloads = JSON.parse(data).downloads || 0;
            callback(null, Object.assign(plugin, { 'last-month': downloads }));
          }
        }
      );
    },
    function(e, plugins) {
      if (e) {
        console.log(e);
      } else {
        fs.writeFile(
          SERVERLESS_PLUGINS,
          JSON.stringify(plugins, null, 2),
          'utf8',
          done
        );
      }
    }
  );
});

gulp.task('consultants', function() {
  require('./_data/consultants.json').forEach(createFile);
});

function createFile(filedat) {
  const coname = filedat.url.split('://')[1].replace('www.', '').split('.')[0];

  const filename = `./_consultants/${coname}.md`;

  const data = `---\ntitle: ${filedat.title}\nlayout: redirect\nnote: THIS FILE IS GENERATED AUTOMATICALLY, EDIT _data/consultants.json instead \nredirect_to:\n  - ${filedat.url} \n---`;

  fs.unlinkSync(filename);
  fs.open(filename, 'r', function(err, fd) {
    if (err) {
      fs.writeFile(filename, data, function(err) {
        if (err) {
          console.log(err);
        }
        console.log('The file was saved!');
      });
    } else {
      console.log('The file exists!');
    }
  });
}
