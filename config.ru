require 'rubygems'
require 'bundler/setup'
require 'rack'
require 'sinatra'
require 'sinatra/content_for'
$stdout.sync = true if development?
require 'sinatra/reloader' if development?
require 'yaml'
require 'json'
require 'haml'
require 'sass'
require 'tiqav'
require 'tmp_cache'
require File.dirname(__FILE__)+'/bootstrap'
Bootstrap.init :helpers, :controllers

set :haml, :escape_html => true

run Sinatra::Application
