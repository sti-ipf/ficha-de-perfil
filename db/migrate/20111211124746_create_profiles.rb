class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.string :name
      t.date :dob
      t.string :nationality
      t.string :naturally
      t.integer :associated_id
      t.date :start_date
      t.string :civil_status
      t.string :cpf
      t.string :rg
      t.string :cep
      t.string :street
      t.string :address_number
      t.string :district
      t.string :city
      t.string :state
      t.string :company_phone_number
      t.string :phone
      t.string :mobile
      t.string :unifreire_id
      t.string :twitter
      t.string :facebook
      t.text :another_social_networks
      t.text :curriculum_lattes
      t.boolean :smoker
      t.boolean :has_disability
      t.string :disability_desc
      t.boolean :take_medicenes
      t.text :medicenes_desc
      t.boolean :allergic
      t.text :allergic_desc
      t.string :blood_type
      t.boolean :cronic_disease
      t.text :cronic_disease_desc
      t.date :last_vacation
      t.date :next_vacation
      t.float :deslocation_time_by_google
      t.float :deslocation_time
      t.text :dependents
      t.integer :formation
      t.string :curriculum_file_name
      t.string :curriculum_content_type
      t.integer :curriculum_file_size
      t.datetime :curriculum_updated_at
 
      t.string :avatar_file_name
      t.string :avatar_content_type
      t.integer :avatar_file_size
      t.datetime :avatar_updated_at
      t.timestamps
    end
  end

  def self.down
    drop_table :profiles
  end
end
