gutil       = require 'gutil'
uglify      = require 'gulp-uglify'
rename      = require 'gulp-rename'
mustache    = require 'gulp-mustache'
browserify  = require 'gulp-browserify'

module.exports = (gulp, config) ->
  options = config?.build or {}

  gulp.task 'build', options.deps, ->
    gulp
      .src options.paths, read: false
      .pipe browserify
        transform: ['coffeeify']
        extensions: ['.coffee']
        standalone: options.exports
      .pipe mustache config.pkg
      .pipe do uglify
      .pipe rename options.out.name
      .pipe gulp.dest options.out.dir
