# frozen_string_literal: true

require 'roda'
require 'sequel'
require 'sqlite3'
require_relative 'helpers/contract_helper'
require_relative 'helpers/successfull_result'
#
#
# require_relative 'lib/notes_contract'
# require_relative 'lib/edit_contract'
# require_relative 'lib/date_contract'
# require_relative 'lib/invitations_contract'
# app class
class App < Roda
  plugin :render
  plugin :public
  plugin :hash_routes
  plugin :view_options
  DB = Sequel.connect("sqlite:///#{File.expand_path('./db/exchanges.db', __dir__)}")
  require_relative 'models/flat'
  require_relative 'models/house'
  require_relative 'models/region'
  require_relative 'models/wanted_floor'
  require_relative 'models/wanted_region'

  include ContractHelper

  #opts[:flats] = Flat
  # opts[:statuses] = Status
  require_relative 'routes/home_page_route'
  require_relative 'routes/flats_route'
  # require_relative 'routes/closest_dates_route'
  # require_relative 'routes/invites_route'

  route do |r|
    r.public
    r.hash_branches
    r.root do
      r.redirect '/home_page'
    end
  end
end