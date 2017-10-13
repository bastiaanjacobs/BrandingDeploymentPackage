// npm packages
var gulp = require('gulp');
var sass = require('gulp-sass');
var clean = require('gulp-clean');
var sourcemaps = require('gulp-sourcemaps');
var cssmin = require('gulp-cssmin');
var rename = require('gulp-rename');
var notify = require('gulp-notify');
var runSequence = require('run-sequence');
var webserver = require('gulp-webserver');
var livereload = require('gulp-livereload');
var watch = require('gulp-watch');
var open = require('gulp-open');
var newer = require('gulp-newer');
var connect = require('gulp-connect');
var fileinclude = require('gulp-file-include');
var merge = require('merge-stream');
var browserSync = require('browser-sync').create();
var spsync = require('gulp-spsync-creds').sync;

//customer settings
var customer_folder = '_clusius';

//config paths
var src_root =  './src';
var src_npm = './node_modules';
var src_scss = './src/scss';
var src_dp_cwp = './src/Display Templates/Content Web Parts';
var src_dp_search = './src/Display Templates/Search';
var src_pagelayouts = './src/Page Layouts';
var src_components = './src/Components';
var src_images = './src/img';
var src_fonts = './src/font';
var src_scripts = './src/js';
var src_scripts_library = './src/Library';
var src_jquery = './node_modules/jquery/dist';
var src_momentjs = './node_modules/moment/min';

var dist_root = './dist';
var dist_css = './dist/Style Library/_mcwresources/css';
var dist_dp_cwp = "./dist/_catalogs/masterpage/Display Templates/Content Web Parts/" + customer_folder;
var dist_dp_search = "./dist/_catalogs/masterpage/Display Templates/Search/" + customer_folder;
var dist_pagelayouts = "./dist/_catalogs/masterpage/" + customer_folder;
var dist_images = './dist/Style Library/_mcwresources/img';
var dist_fonts = './dist/Style Library/_mcwresources/font';
var dist_scripts = './dist/Style Library/_mcwresources/js';
var dist_components = './dist/Style Library/_mcwresources/components';

// gulp default
gulp.task('default', function(done) {
  runSequence('clean', 'scss', 'components', 'images', 'scripts', 'fonts', 'displaytemplates', 'pagelayouts', 'connect', 'open', 'watch', function() {
    done();
  });
});

//gulp serve
gulp.task('serve', function() {
  var syncsettings = settings.get();

  gulp.src(dist_root + '/**/**.*', { base: dist_root })
  .pipe(spsync(syncsettings))
  .pipe(notify({
    onLast: true,
    message: 'Deployment to SharePoint complete!'
  }));
});

// gulp scss
gulp.task('scss', function() {
  gulp.src(src_scss + '/*.scss')
    .pipe(sourcemaps.init())
    .pipe(sass())
    .pipe(cssmin())
    .pipe(rename({ suffix: '.min' }))
    .pipe(gulp.dest(dist_css))
    .pipe(connect.reload())

    .pipe(notify({
      onLast: true,
      message: 'compiled scss!'
    }));
});

// gulp components
gulp.task('components', function() {
  gulp.src(src_components + '/**/*')
  .pipe(fileinclude({
    prefix: '@@',
    basepath: '@file'
  }))
  .pipe(gulp.dest(dist_components))
  .pipe(connect.reload())

  .pipe(notify({
      onLast: true,
      message: 'pushed components in dist folder!'
  }));
});

// gulp images
gulp.task('images', function() {
  gulp.src(src_images + "/**/*")
  .pipe(gulp.dest(dist_images))
  .pipe(notify({
      onLast: true,
      message: 'pushed images in dist folder!'
  }));
});

// gulp scripts
gulp.task('scripts', function() {
  gulp.src(src_scripts + "/**/*")
  .pipe(newer(dist_scripts))
  .pipe(gulp.dest(dist_scripts))
  .pipe(notify({
      onLast: true,
      message: 'pushed scripts in dist folder!'
  }));
  var jquery = gulp.src(src_jquery + "/jquery.min.js")
  .pipe(gulp.dest(dist_scripts + "/vendor/"))
  var momentjs = gulp.src(src_momentjs + "/moment.min.js")
  .pipe(gulp.dest(dist_scripts + "/vendor/"))
});

// gulp font
gulp.task('fonts', function() {
  gulp.src(src_fonts + "/**/*")
  .pipe(newer(dist_fonts))
  .pipe(gulp.dest(dist_fonts))
  .pipe(notify({
      onLast: true,
      message: 'pushed fonts in dist folder!'
  }));
});

// gulp displaytemplates
gulp.task('displaytemplates', function() {
  var dest_cwp = dist_dp_cwp;
  var dest_search = dist_dp_search;

  var dp_cwp = gulp.src(src_dp_cwp + "/**/*.html")
      .pipe(newer(dest_cwp))
      .pipe(gulp.dest(dest_cwp))
      .pipe(notify({
          onLast: true,
          message: 'Finished building display templates!'
      }));

  var dp_search = gulp.src(src_dp_search + "/**/*.html")
      .pipe(newer(dist_dp_search))
      .pipe(gulp.dest(dist_dp_search))

    return merge(dp_cwp, dp_search);
});

// gulp pagelayouts
gulp.task('pagelayouts', function() {
  var pagelayouts = gulp.src(src_pagelayouts + "/*.aspx")
  .pipe(newer(dist_pagelayouts))
  .pipe(fileinclude({
      prefix: '@@',
      basepath: '@file'
  }))
  .pipe(gulp.dest(dist_pagelayouts))
  .pipe(notify({
      onLast: true,
      message: 'Finished building Page Layouts!'
  }));

  return pagelayouts;
});

//gulp connect
gulp.task('connect', function() {
  connect.server({
      root: 'dist',
      port: 2323,
      livereload: true
  });
});

//gulp open
gulp.task('open', function(){
  gulp.src('dist/index.html')
      .pipe(open({uri: 'http://localhost:8001'}));
});

//gulp watch
gulp.task('watch', function () {
  gulp.watch(src_path + '/Components/**/*.html', ['components']);
  gulp.watch(src_path + '/scss/**/*.scss', ['scss']);
});

// gulp clean
gulp.task('clean', function() {
  return gulp.src(dist_root + '/*', { read: false })
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