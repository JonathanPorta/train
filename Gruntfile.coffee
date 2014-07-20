module.exports = (grunt) ->
	require('./recurse')(grunt)

	[
		'./src/client'
		'./src/server'
	].map grunt.grunt

	grunt.NpmTasks = ['grunt-contrib-watch', 'grunt-contrib-copy']

	grunt.Config =

		watch:
			base:
				files:[
					'src/client/**/**/*jade'
					'src/client/**/**/*coffee'
					'src/client/**/**/*less'
					'src/server/**/*coffee'
				]
				tasks: ['base']
			all:
				files:[
					'src/server/**/*coffee'
					'src/client/**/**/*jade'
					'src/client/**/**/*coffee'
					'src/client/**/**/*less'
				]
				tasks:['default']

	grunt.initConfig grunt.Config
	grunt.loadNpmTasks npmTask for npmTask in grunt.NpmTasks

	grunt.registerTask 'test', [
#		'lint'
#		'mochaTest:server'
#		'karma:unit'
#		'features'
	]

	grunt.registerTask 'base', [
#		'jsonlint:context'
#		'copy:context'
		'build'
#		'mochaTest:server'
#		'karma:unit'
	]

	grunt.registerTask 'compress', [
		'uglify:all'
		'cssmin:all'
	]

	grunt.registerTask 'default', [
		'build'
		'test'
		'compress'
	]
