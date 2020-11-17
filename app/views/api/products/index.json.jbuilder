json.code 200
json.data @products,
  :id,
  :name,
  :price,
  :category,
  :image,
  :email,
  :is_status,
  :created_at,
  :updated_at
json.total @products.total_count
json.pages @products.total_pages
json.current_page @products.current_page
json.message "ok"
