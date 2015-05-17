# module.exports = (grunt) ->
#     grunt.initConfig
#         pkg: grunt.file.readJSON 'package.json'
#         coffee:
#             files:
#               'src/js/app.js': ['src/coffee/*.coffee']
#             options:
#               join: true

#         watch:
#             files: ['<%= coffee.files %>']
#             tasks: ['coffee']

#     grunt.loadNpmTasks 'grunt-contrib-coffee'
#     grunt.loadNpmTasks 'grunt-contrib-watch'

#     grunt.registerTask 'default', ['coffee']
