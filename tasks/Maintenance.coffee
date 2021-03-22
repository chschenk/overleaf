
module.exports = (grunt) ->

	grunt.registerTask 'maintenance:close-editor', "Will stop anyone opening the editor. Will NOT disconnect already connected users.", () ->
		settings = require "settings-sharelatex"
		settings.editorIsOpen = false

	grunt.registerTask 'maintenance:disconnect-all-users', "Will force disconnect all users with the editor open. Make sure to close the editor first to avoid them reconnecting.", () ->
		delay = 10
		settings = require "settings-sharelatex"
		EditorRealTimeController = require "../web/app/src/Features/Editor/EditorRealTimeController"
		EditorRealTimeController.emitToAll 'forceDisconnect', 'Sorry, we are performing a quick update to the editor and need to close it down. Please refresh the page to continue.', delay
