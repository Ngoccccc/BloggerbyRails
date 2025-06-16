class PagesController < ApplicationController
  def home
  end

  def import_products_to_solr
    SolrImportService.import_products
    redirect_to root_path, notice: "Đã import Product lên Solr!"
  end
end
