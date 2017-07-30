// Assigning modules to local variables
var gulp = require('gulp');
var data = require('gulp-data');
var fs = require('fs');
var request = require('request');
var async = require('async');

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

gulp.task('sync:plugins', function() {
  return request(
    'https://raw.githubusercontent.com/serverless/plugins/master/plugins.json'
  ).pipe(fs.createWriteStream('_data/serverless_plugins.json'));
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
