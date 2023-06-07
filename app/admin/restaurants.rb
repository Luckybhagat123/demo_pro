ActiveAdmin.register Restaurant do

  filter :name
  
  permit_params :name, :address, :explore_location_id
  
  index do
    column :name
    column :address
    column :explore_location_id   
  end

end
