class SearchController < ApplicationController
  def index
  end

  def results
    query = params[:q]
    solr = RSolr.connect url: 'http://solr:8983/solr/mycore'
    response = solr.get 'select', params: {
      q: params[:q].presence || '*:*',
      rows: 200,
      defType: 'edismax',
      qf: 'productName productLine productVendor productDescription productScale quantityInStock buyPrice MSRP textDescription'
    }
    @results = response['response']['docs']
    render :index
  end
end 