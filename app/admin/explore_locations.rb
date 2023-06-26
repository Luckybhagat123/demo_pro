ActiveAdmin.register ExploreLocation do

  filter :city_name
  
  permit_params :title, :city_name, :desciption, :created_at, :updated_at
  

  show do
    attributes_table do
      row :title
      row :city_name
      row :desciption
      row :created_at
      row :updated_at
    end
  end

  index do 
    selectable_column
    id_column
    column :title
    column :city_name
    column :desciption
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    f.inputs do 
      f.input :title
      f.input :city_name
      f.input :desciption
    end
    actions
  end
end
