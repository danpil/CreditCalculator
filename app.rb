require 'sinatra'
require 'haml'
require_relative 'add_class'

class CreditCalculatorApp < Sinatra::Base
  include Add
  get '/' do
    haml :index
  end

  post '/result' do
    if params['payOff'] == 'Usual'
      @params = Add::Usual.new(params['sum'], params['term'], params['procent'])
      haml :usual
    else
      @params = Add::Equal.new(params['sum'], params['term'], params['procent'])
      haml :equal
    end

  end
end