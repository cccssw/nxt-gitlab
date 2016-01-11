debug = require('debug') 'gitlab:ApiBaseHTTP'
{ApiBase} = require './ApiBase'
querystring = require 'querystring'
rest = require 'rest-js'

class module.exports.ApiBaseHTTP extends ApiBase
  handleOptions: =>
    super
    @options.base_url ?= ''

    unless @options.url
      throw "`url` is mandatory"

    if !@options.token and !@options.access_token
      throw "`private_token or access_token` is mandatory"

    @options.restOption ||= {defaultFormat: '',crossDomain: true,}
    @options.slumber ?= {}
    @options.slumber.append_slash ?= false

    if @options.auth?
      @options.slumber.auth = @options.auth

    debug "handleOptions()"

  init: =>
    super
    @slumber = rest @options.url+"/"+@options.base_url+"/",@options.restOption

  prepare_opts: (opts) =>
    opts.__query ?= {}
    if @options.token
      opts.__query.private_token = @options.token
    if @options.access_token
      opts.__query.access_token = @options.access_token    
    
    return opts

  fn_wrapper: (fn) =>
    return (err, ret) =>
      if err
        debug 'an error has occured', err
      arity = fn.length
      switch arity
        when 1 then fn ret
        when 2 then fn err, ret
  authPath:(path,query)=>
    opts = @prepare_opts query
    if opts.__query.private_token
      path+="?private_token="+opts.__query.private_token
    if opts.__query.access_token
      path+="?access_token="+opts.__query.access_token
    return path

  get: (path, query={}, fn=null) =>
    if 'function' is typeof query
      fn = query
      query = {}
    opts = @prepare_opts query
    path = @authPath path,query
    @slumber.read path,opts, @fn_wrapper fn

  delete: (path, fn=null) =>
    opts = @prepare_opts {}
    path = @authPath path,{}
    @slumber.remove path, opts, @fn_wrapper fn

  post: (path, data={}, fn=null) =>
    opts = @prepare_opts data
    path = @authPath path,data
    @slumber.create path, opts, @fn_wrapper fn

  put: (path, data={}, fn=null) =>
    opts = @prepare_opts data
    path = @authPath path,data
    @slumber.update path, opts, @fn_wrapper fn

  patch: (path, data={}, fn=null) =>
    opts = @prepare_opts data
    path = @authPath path,data
    @slumber.update path, opts, @fn_wrapper fn
