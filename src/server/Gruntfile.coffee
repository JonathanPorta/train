module.exports = (grunt) ->
	grunt.Config =
# 		shell:
# 			kill:
# 				#command: "lsof -i TCP -P | grep 4444 | awk '{print $2}' | xargs -I {} kill {} >/dev/null || exit 0"
# 				command: "killall java node ; killall java node ; exit 0"
# 			selenium:
# 				command: [
# 					"java -jar ./selenium/selenium-server-standalone-2.35.0.jar"
# 					"-Dwebdriver.chrome.driver=./selenium/phantomJS"
# #					"-Dwebdriver.chrome.driver=./selenium/chromedriver"
# 					">/dev/null"
# 				].join ' '
# 				options:
# 					async: true
# 					kill: true
# 			sleep:
# 				command:
# 					"sleep 1"

# 			install:
# 				command: "[ -f ./selenium/selenium-server-standalone-2.35.0.jar ] || ./node_modules/protractor/bin/install_selenium_standalone"

#		cucumberjs:
#			all:
#				files:
#					src: ['src/features/behavior/users/*']
#			current:
#				files:
#					src: ['src/features/behavior/users/*']
#				options:
#					tags: '@current'
#			options:
#				steps: 'src/features/behavior/steps'

		# jsonlint:
		# 	context:
		# 		src: ['src/context.json']
		# 	inventory:
		# 		src: ['build/test.json']

	grunt.NpmTasks = [
		#'grunt-cucumber'
		# 'grunt-shell-spawn'
		# 'grunt-jsonlint'
	]

	grunt.registerTask "lint", [
		# "jsonlint:context"
#		"jsonlint:inventory"
	]

	grunt.registerTask "features", [
		#"shell:kill"
#		"shell:selenium"
		# "shell:sleep"
		#"cucumberjs:all"
#		"shell:selenium:kill"
		#"shell:kill"
	]

	grunt.registerTask "feature", [
		#"shell:kill"
#		"shell:selenium"
		# "shell:sleep"
		#"cucumberjs:current"
#		"shell:selenium:kill"
		#"shell:kill"
	]
