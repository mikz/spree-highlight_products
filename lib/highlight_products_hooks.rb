class HighlightProductsHooks < Spree::ThemeSupport::HookListener
  insert_before :admin_products_index_row_actions, 'admin/products/highlight_product_button'
  
end