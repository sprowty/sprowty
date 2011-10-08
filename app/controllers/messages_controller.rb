class MessagesController < ApplicationController
  before_filter :require_user
end
