module.exports = (grunt)->

#Formats template names to be sexier.
	jadeTemplateId = (filepath)->
		filepath
		.replace(
			/^src\/client\/(.*)\/template.jade$/
			'$1'
		)
		.replace(
			/^src\/client\/(.*)\/directives\/(.*).jade$/
			'$1/$2/widget'
		)

	grunt.Config =
		browserify:
			dev:
				files: "build/bundle.js": [
					"src/client/main.coffee"
				]
				options:
					debug: true
					transform: [
						"caching-coffeeify"
					]

		jade:
			index:
				files:
					"build/index.html": "src/client/index.jade"

		ngjade:
			templates:
				options:
					moduleName:"train"
					processName:jadeTemplateId
				files:[{
					expand: false
					src: [
						"src/client/**/**/template.jade"
						"src/client/**/**/directives/*.jade"
					]
					dest: "build/templates.js"
				}]

		less:
			page:
				options:
					paths: [
						"bower_components/bootstrap/less"
					]
				files:
					"build/page.css": [
						"src/client/page.less"
					]

#		karma:
#			unit:
#				options:
#					browsers: ["Chrome"]
#					# browsers: ["PhantomJS"]
#					frameworks: ["jasmine"]
#					preprocessors:
#						"src/client/bundle.js": "coverage"
#						"src/**/*.coffee": "coffee"
#						"src/**/**/*.coffee": "coffee"
#						"src/**/**/**/*.coffee": "coffee"
#					reporters: [
#						'coverage'
#						'dots'
#					]
#					singleRun: true
#					files: [
#						"bower_components/angular/angular.js"
#						"bower_components/angular-mocks/angular-mocks.js"
#						"src/client/bundle.js"
#						"src/client/**/unit.coffee"
#						"src/client/**/**/unit.coffee"
#					]

		uglify:
			all:
				files:
					'build/bundle.min.js': ["build/bundle.js"]

		cssmin:
			all: files: 'build/page.min.css': ["build/page.css"]

		watch:
			build:
				files: [
					'src/client/**/**/*jade'
					'src/client/**/**/*coffee'
					'src/client/**/*coffee'
					'src/client/**/**/*less'
					'src/client/**/*coffee'
					'src/client/**/*jade'
				]
				tasks: ['build']

	grunt.NpmTasks = [
		'grunt-browserify'
		'grunt-contrib-jade'
		'grunt-contrib-less'
#		'grunt-karma'
		'grunt-contrib-uglify'
		'grunt-contrib-cssmin'
		'grunt-contrib-watch'
		'grunt-ngjade'
	]

	grunt.registerTask "build", [
		"browserify:dev"
		"jade:index"
		"less:page"
		"ngjade:templates"
	]
