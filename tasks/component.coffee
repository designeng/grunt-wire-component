exec = require("child_process").exec

module.exports = (grunt) ->

    srcRegexp = /\/coffee\//
    srcExtention = ".coffee"

    specContent = ""

    grunt.registerTask "component", "create wire-component", (name) ->
        config = grunt.config.get "component"
        specName = config.specName || "spec"
        targetDir = config.dir 
        componentDir = targetDir + "/" + name
        componentSpecFile = componentDir + "/#{specName}.coffee"

        jsComponentDir = componentDir.replace(srcRegexp, "/js/")

        grunt.file.mkdir componentDir
        grunt.file.write componentSpecFile, specContent

        exec "coffee --bare  --compile #{componentSpecFile} --output #{jsComponentDir}", (err) ->    
            if err
                console.log "ERROR:", err
            else
                grunt.log.ok "compiled"
        
        jsComponentSpecFile = componentSpecFile.replace(srcRegexp, "/js/").replace(srcExtention, ".js")

        grunt.file.write jsComponentSpecFile, specContent