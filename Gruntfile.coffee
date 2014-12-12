module.exports = (grunt) ->

    grunt.initConfig
        watch:
            coffee_app:
                files: ['coffee/**/**.coffee']
                tasks: ["coffee-compile-app"]
            js:
                files: ["coffee/**/**.js"]
                options:
                    livereload: true

        coffee:
            coffee:
                options: {
                    bare: true
                }
                files: [
                    expand: true
                    cwd: 'coffee'
                    src: ['**/*.coffee']
                    dest: 'js'
                    ext: '.js'
                ]

        component:
            dir: "app/coffee/components"


    grunt.loadNpmTasks "grunt-contrib-watch"
    grunt.loadNpmTasks "grunt-contrib-coffee"
    grunt.loadNpmTasks "grunt-newer"
    grunt.loadNpmTasks "grunt-mkdir"

    grunt.loadTasks('tasks')

    grunt.registerTask "default", ["coffee", "watch"]

    # compilation
    grunt.registerTask "coffee-compile-app", ["newer:coffee:coffee"]



