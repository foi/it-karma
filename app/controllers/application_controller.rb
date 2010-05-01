require 'astronow'
require 'rcfootnotes'
require 'check_permission'

class ApplicationController < ActionController::Base

  helper :all 
  protect_from_forgery

end
