#!/usr/bin/env coffee

surnames = require './surnames'

getSurname = () ->
  r = Math.random() * surnames[surnames.length-1].cumfreq
  cf = 0
  index = 0
  while cf < r
    current = surnames[index]
    cf = current.cumfreq
    ++index
  return current.name

module.exports = getSurname

if not module.parent?
  nFamilies = process.argv[2] or= 1
  console.log "#{getSurname()}" for i in [1..nFamilies]
