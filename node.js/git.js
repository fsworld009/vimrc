
// handle some git configuration for windows

exports.spawn = spawnGit
exports.chainableExec = chainableExec
exports.whichAndExec = whichAndExec

var exec = require("child_process").execFile
  , spawn = require("./spawn")
  , npm = require("../npm.js")
  , which = require("which")
  , git = npm.config.get("git")
  , assert = require("assert")
  , log = require("npmlog")
  , win32 = process.platform === "win32"
  , cygwin = win32 && (process.env.ORIGINAL_PATH || '').indexOf('/cygdrive/') != -1
  , msys2bash = typeof process.env.SHELL === 'string' && process.env.SHELL.indexOf('bash')!=-1

function prefixGitArgs () {
  return process.platform === "win32" ? ["-c", "core.longpaths=true"] : []
}

function execGit (args, options, cb) {
  log.info('git', args)
  if(cygwin && args) {
    for(var i=0; i<args.length; i++) {
        if(':\\'.indexOf(args[i]) != 1) {
            args[i] = args[i].replace(/\\/g, '/').replace(/^([A-Za-z])\:\//, '/cygdrive/$1/');
        }
    }
  }else if(win32 && msys2bash){
    for(var i=0; i<args.length; i++) {
        if(':\\'.indexOf(args[i]) != 1) {
            args[i] = args[i].replace(/\\/g, '/').replace(/^([A-Za-z])\:\//, '/$1/');
        }
    }
  }

  var fullArgs = prefixGitArgs().concat(args || [])
  return exec(git, fullArgs, options, cb)
}

function spawnGit (args, options) {
  log.info("git", args)
  return spawn(git, prefixGitArgs().concat(args || []), options)
}

function chainableExec () {
  var args = Array.prototype.slice.call(arguments)
  return [execGit].concat(args)
}

function whichGit (cb) {
  return which(git, cb)
}

function whichAndExec (args, options, cb) {
  assert.equal(typeof cb, "function", "no callback provided")
  // check for git
  whichGit(function (err) {
    if (err) {
      err.code = "ENOGIT"
      return cb(err)
    }

    execGit(args, options, cb)
  })
}
