'use strict'
module.exports = (grunt) ->

	# Config
	grunt.initConfig
		stylus:
			compile:
				options:
					compress:false
				files:
					'../assets/css/Main.css': './stylus/Main.styl'

		grunt_coffee_import:
			options:
				classPath: 'coffee/',
				deployPath:'../assets/js/'
			files: ['Main.coffee']

		watch:
			stylus:
				files:['stylus/*.styl']
				tasks:['stylus']
			coffee:
				files:['coffee/Main.coffee', 'coffee/*.coffee', 'coffee/**/*.coffee']
				tasks:['grunt_coffee_import']

	# Load tasks
	grunt.loadNpmTasks('grunt-contrib-watch')
	grunt.loadNpmTasks('grunt-contrib-stylus')
	grunt.loadNpmTasks('grunt-coffee-import')

	# Register tasks
	grunt.registerTask('default', ['stylus', 'grunt_coffee_import', 'watch'])
