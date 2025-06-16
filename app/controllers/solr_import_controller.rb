class SolrImportController < ApplicationController
  def index
  end

  def import_productlines_text_description
    SolrImportService.import_productlines_text_description
    redirect_to solr_import_index_path, notice: "Đã import textDescription từ productlines lên Solr!"
  end
end 