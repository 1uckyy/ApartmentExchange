# frozen_string_literal: true

# home_page route
class App
  hash_branch('flats') do |r|
    set_layout_options template: '../views/layout'
    set_view_subdir 'flats'

    r.is do
      r.get do
        @search = r.params['search']
        @selection = r.params['select']
        @page_number = r.params['page_number']&.to_i || 0
        flats = Flat.search_by(@search, @selection) || Flat
        flats = flats.order(:id)
        @count = flats.count
        @pages_count = (@count.to_f / 5).ceil - 1
        @flats = flats.limit(5, @page_number * 5).all
        view :flats
      end
    end
  end
end
