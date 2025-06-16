require 'rsolr'

class SolrImportService
  def self.import_products
    solr = RSolr.connect url: 'http://solr:8983/solr/mycore'
    Product.includes(:product_line).find_each do |product|
      solr.add(
        id: product.productCode,
        productName: product.productName,
        productLine: product.productLine,
        productVendor: product.productVendor,
        productDescription: product.productDescription,
        productScale: product.productScale,
        quantityInStock: product.quantityInStock,
        buyPrice: product.buyPrice,
        MSRP: product.MSRP,
        textDescription: product.product_line&.textDescription
      )
    end
    solr.commit
  end

  # Import riêng cho textDescription từ productlines
  def self.import_productlines_text_description
    solr = RSolr.connect url: 'http://solr:8983/solr/mycore'
    Product.includes(:product_line).find_each do |product|
      solr.add(
        id: product.productCode,
        textDescription: product.product_line&.textDescription
      )
    end
    solr.commit
  end
end 