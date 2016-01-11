nct-gitlab(fork from nxt-gitlab)
===========
This is a fork of
This is a fork of original node-gitlab repository (https://github.com/moul/node-gitlab), we add some new features and bugfixes. All our changes are submited to the original repository as pull request, but in order to speed up the process of producing a new node and meteor module we decide to host own package.


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/moul/node-gitlab/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

[![NPM Badge](https://nodei.co/npm/gitlab.png?downloads=true&stars=true)](https://npmjs.org/package/gitlab)
--

[GitLab](https://github.com/gitlabhq/gitlabhq) API Nodejs library.
It wraps the HTTP api library described [here](https://github.com/moul/gitlabhq/tree/master/doc/api).

Install
=======

```bash
# Install from npm
npm install nct-gitlab
```

Usage
=====

Coffee-Script
-------------
```coffee
# Connection
gitlab = (require 'gitlab')
  url:   'http://example.com'
  token: 'abcdefghij123456'

or
gitlab = (require 'gitlab')
  url:   'http://example.com'
  access_token: 'abcdefghij123456'

# Listing users
gitlab.users.all (users) ->
  console.log "##{user.id}: #{user.email}, #{user.name}, #{user.created_at}" for user in users

# Listing projects
gitlab.projects.all (projects) ->
  for project in projects
    console.log "##{project.id}: #{project.name}, path: #{project.path}, default_branch: #{project.default_branch}, private: #{project.private}, owner: #{project.owner.name} (#{project.owner.email}), date: #{project.created_at}"
```

Javascript
----------
```javascript
// Connection
var gitlab = require('gitlab')({
  url:   'http://example.com',
  token: 'abcdefghij123456'
});

or

var gitlab = require('gitlab')({
  url:   'http://example.com',
  access_token: 'abcdefghij123456'
});


// Listing users
gitlab.users.all(function(users) {
  for (var i = 0; i < users.length; i++) {
    console.log("#" + users[i].id + ": " + users[i].email + ", " + users[i].name + ", " + users[i].created_at);
  }
});

// Listing projects
gitlab.projects.all(function(projects) {
  for (var i = 0; i < projects.length; i++) {
    console.log("#" + projects[i].id + ": " + projects[i].name + ", path: " + projects[i].path + ", default_branch: " + projects[i].default_branch + ", private: " + projects[i]["private"] + ", owner: " + projects[i].owner.name + " (" + projects[i].owner.email + "), date: " + projects[i].created_at);
  }
});
```

See [Examples directory](https://github.com/moul/node-gitlab/tree/master/examples) for more examples

Develop
=======

[![Gitter chat](https://badges.gitter.im/moul/node-gitlab.png)](https://gitter.im/moul/node-gitlab)

Edit the Coffee-Script files in `src`, then build them using `cake build`.
Use `cake watch` to build files continuously while developing.

Contributors
------------
- [cccssw](https://github.com/cccssw)
- [Dave Irvine](https://github.com/dave-irvine)
- [Glavin Wiechert](https://github.com/Glavin001)
- [Florian Quiblier](https://github.com/fofoy)
- [Anthony Heber](https://github.com/aheber)
- [Evan Heidtmann](https://github.com/ezheidtmann)
- [luoqpolyvi](https://github.com/luoqpolyvi)
- [Brian Vanderbusch](https://github.com/LongLiveCHIEF)
- [daprahamian](https://github.com/daprahamian)


Ermlab Contributors
--------------------

- [pgorecki](https://github.com/pgorecki)
- [mkkalinowski](https://github.com/mkkalinowski)
- [ksirg](https://github.com/ksirg)

License
-------

MIT
