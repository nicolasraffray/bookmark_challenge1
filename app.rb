# frozen_string_literal: true

require 'sinatra/base'
require_relative './lib/bookmarks.rb'

class BookmarkManager < Sinatra::Base
  enable :sessions, :method_override

  before do
    @bookmark = Bookmarks
  end

  get '/' do
    erb :form
  end

  get '/bookmarks' do
    erb :show_bookmarks
  end

  post '/bookmarks' do
    @bookmark.create(url: params[:bookmark], title: params[:title])
    redirect '/bookmarks'
  end

  delete '/bookmarks/:id' do
    Bookmarks.delete(id: params[:id])
    redirect '/bookmarks'
  end

  run! if app_file == $PROGRAM_NAME
end
