BaseModel = require './BaseModel'

class Projects extends BaseModel
    init: =>
        console.log @test
        @members = @load 'ProjectMembers'
        @hooks =   @load 'ProjectHooks'

    all: (fn = null) =>
        @debug "Projects::all()"
        @get "projects", (data) => fn data if fn

    show: (projectId, fn = null) =>
        @debug "Projects::show()"
        @get "projects/#{parseInt projectId}", (data) => fn data if fn

    create: (name, params = {}, fn = null) =>
        @debug "Projects::create()"
        params.name = name
        @post "projects", params


module.exports = (client) -> new Projects client
