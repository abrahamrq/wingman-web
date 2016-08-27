class FirstModelDefinition < ActiveRecord::Migration
  def change
    create_table :interests do |p|
      p.string :type
      p.string :description
    end

    create_table :interests_users do |p|
      p.belongs_to :user, index: true
      p.belongs_to :preference, index: true
    end

    create_table :users do |u|
      u.string :first_name
      u.string :last_name
      u.string :nickname
      u.string :gender
      u.string :email
      u.date :birthdate
      u.string :password
      u.timestamps
    end

    create_table :dateplan do |p|
      p.string :places
      p.string :title
      p.belongs_to :user
    end    
  end
end
