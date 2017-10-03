var gulp = require('gulp');
var sass = require('gulp-sass');
var clean = require('gulp-clean');
var sourcemaps = require('gulp-sourcemaps');
var cssmin = require('gulp-cssmin');
var rename = require('gulp-rename');
var notify = require('gulp-notify');
var runSequence = require('run-sequence');
var webserver = require('gulp-webserver');
var newer = require('gulp-newer');
var fileinclude = require('gulp-file-include');
var spsync = require('gulp-spsync-creds').sync;

var src_path = "./src";
var dist_path = "./dist";

// gulp default
gulp.task('default', function(done) {
  runSequence('clean', 'sass', 'img', 'font', function() {
    done();
  });
});

//gulp serve
gulp.task('serve', function() {
  var syncsettings = settings.get();
    
  gulp.src(dist_path + '/**/*')
  .pipe(spsync(syncsettings))
  .pipe(notify({
    onLast: true,
    message: 'Deployment to SharePoint complete!'
  }));
});

// gulp sass
gulp.task('sass', function() {
  gulp.src(src_path + '/scss/*.scss')
    .pipe(sourcemaps.init())
    .pipe(sass())
    .pipe(cssmin())
    .pipe(rename({ suffix: '.min' }))
    .pipe(gulp.dest(dist_path + '/css'))

    .pipe(notify({
      onLast: true,
      message: 'compiled scss!'
    }));
});

// gulp scripts
gulp.task('js', function() {
  gulp.src(src_path + "/js/**/*")
  .pipe(gulp.dest(dist_path + '/js'))
  .pipe(notify({
      onLast: true,
      message: 'pushed scripts in dist folder!'
  }));
});

// gulp font
gulp.task('font', function() {
  gulp.src(src_path + "/font/**/*")
  .pipe(gulp.dest(dist_path + '/font'))
  .pipe(notify({
      onLast: true,
      message: 'pushed fonts in dist folder!'
  }));
});

// gulp displaytemplates

// gulp pagelayouts
gulp.task('pagelayouts', function() {
  var pagelayouts = gulp.src(src_path + "/Page Layouts/*.aspx")
  .pipe(newer(dist_path + '/_catalogs/masterpage/_mcwresources'))
  .pipe(fileinclude({
      prefix: '@@',
      basepath: '@file'
  }))
  .pipe(gulp.dest(dist_path + '/_catalogs/masterpage/_mcwresources'))
  .pipe(notify({
      onLast: true,
      message: 'Finished building Page Layouts!'
  }));

  return pagelayouts;
});

// gulp images
gulp.task('img', function() {
  gulp.src(src_path + "/img/**/*")
  .pipe(gulp.dest(dist_path + '/img'))
  .pipe(notify({
      onLast: true,
      message: 'pushed images in dist folder!'
  }));
});

// gulp watch
gulp.task('watch', function() {
  var syncsettings = settings.get();
  syncsettings["cache"] = true;
  gulp.watch(dist_path, ['publish']);
});

// gulp webserver
gulp.task('webserver', function() {
  gulp.src(src_path)
    .pipe(webserver({
      livereload: true,
      directoryListing: true,
      open: true
    }));
});

// gulp clean
gulp.task('clean', function() {
  return gulp.src(dist_path + '/*', { read: false })
    .pipe(clean())

    .pipe(notify({
      onLast: true,
      message: 'dist folder cleaned!'
    }));
});

// settings
var settings = (function() {
  var config = require('./_config.json');
  return {
    get: function() {
      return {
        username: config.username,
        password: config.password,
        site: config.site,
        libraryPath: config.libraryPath,
        publish: config.publish,
      }
    }
  }
})();
module.exports = settings;