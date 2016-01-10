debug = require('debug') 'gitlab:BaseModel'


class module.exports
  constructor: (@client) ->
    do @_init

  load: (model) =>
    switch model
      when "Groups" then require("./Models/Groups") @client
      when "Issues" then require("./Models/Issues") @client
      when "ProjectDeployKeys" then require("./Models/ProjectDeployKeys") @client
      when "ProjectHooks" then require("./Models/ProjectHooks") @client
      when "ProjectIssues" then require("./Models/ProjectIssues") @client
      when "ProjectMembers" then require("./Models/ProjectMembers") @client
      when "ProjectMergeRequests" then require("./Models/ProjectMergeRequests") @client
      when "ProjectMilestones" then require("./Models/ProjectMilestones") @client
      when "ProjectRepository" then require("./Models/ProjectRepository") @client
      when "Projects" then require("./Models/Projects") @client
      when "Users" then require("./Models/Users") @client

  _init: =>
    @debug =   require('debug') "gitlab:Models:#{@constructor.name}"

    @get =     @client.get
    @post =    @client.post
    @put =     @client.put
    @delete =  @client.delete

    do @init if @init?
