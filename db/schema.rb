# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140612020206) do

  create_table "adjustment_metadata", :force => true do |t|
    t.integer "adjustment_id"
    t.integer "enterprise_id"
    t.string  "fee_name"
    t.string  "fee_type"
    t.string  "enterprise_role"
  end

  add_index "adjustment_metadata", ["adjustment_id"], :name => "index_adjustment_metadata_on_adjustment_id"
  add_index "adjustment_metadata", ["enterprise_id"], :name => "index_adjustment_metadata_on_enterprise_id"

  create_table "carts", :force => true do |t|
    t.integer "user_id"
  end

  add_index "carts", ["user_id"], :name => "index_carts_on_user_id"

  create_table "cms_blocks", :force => true do |t|
    t.integer  "page_id",    :null => false
    t.string   "identifier", :null => false
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "cms_blocks", ["page_id", "identifier"], :name => "index_cms_blocks_on_page_id_and_identifier"

  create_table "cms_categories", :force => true do |t|
    t.integer "site_id",          :null => false
    t.string  "label",            :null => false
    t.string  "categorized_type", :null => false
  end

  add_index "cms_categories", ["site_id", "categorized_type", "label"], :name => "index_cms_categories_on_site_id_and_categorized_type_and_label", :unique => true

  create_table "cms_categorizations", :force => true do |t|
    t.integer "category_id",      :null => false
    t.string  "categorized_type", :null => false
    t.integer "categorized_id",   :null => false
  end

  add_index "cms_categorizations", ["category_id", "categorized_type", "categorized_id"], :name => "index_cms_categorizations_on_cat_id_and_catd_type_and_catd_id", :unique => true

  create_table "cms_files", :force => true do |t|
    t.integer  "site_id",                                          :null => false
    t.integer  "block_id"
    t.string   "label",                                            :null => false
    t.string   "file_file_name",                                   :null => false
    t.string   "file_content_type",                                :null => false
    t.integer  "file_file_size",                                   :null => false
    t.string   "description",       :limit => 2048
    t.integer  "position",                          :default => 0, :null => false
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
  end

  add_index "cms_files", ["site_id", "block_id"], :name => "index_cms_files_on_site_id_and_block_id"
  add_index "cms_files", ["site_id", "file_file_name"], :name => "index_cms_files_on_site_id_and_file_file_name"
  add_index "cms_files", ["site_id", "label"], :name => "index_cms_files_on_site_id_and_label"
  add_index "cms_files", ["site_id", "position"], :name => "index_cms_files_on_site_id_and_position"

  create_table "cms_layouts", :force => true do |t|
    t.integer  "site_id",                       :null => false
    t.integer  "parent_id"
    t.string   "app_layout"
    t.string   "label",                         :null => false
    t.string   "identifier",                    :null => false
    t.text     "content"
    t.text     "css"
    t.text     "js"
    t.integer  "position",   :default => 0,     :null => false
    t.boolean  "is_shared",  :default => false, :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "cms_layouts", ["parent_id", "position"], :name => "index_cms_layouts_on_parent_id_and_position"
  add_index "cms_layouts", ["site_id", "identifier"], :name => "index_cms_layouts_on_site_id_and_identifier", :unique => true

  create_table "cms_pages", :force => true do |t|
    t.integer  "site_id",                           :null => false
    t.integer  "layout_id"
    t.integer  "parent_id"
    t.integer  "target_page_id"
    t.string   "label",                             :null => false
    t.string   "slug"
    t.string   "full_path",                         :null => false
    t.text     "content"
    t.integer  "position",       :default => 0,     :null => false
    t.integer  "children_count", :default => 0,     :null => false
    t.boolean  "is_published",   :default => true,  :null => false
    t.boolean  "is_shared",      :default => false, :null => false
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  add_index "cms_pages", ["parent_id", "position"], :name => "index_cms_pages_on_parent_id_and_position"
  add_index "cms_pages", ["site_id", "full_path"], :name => "index_cms_pages_on_site_id_and_full_path"

  create_table "cms_revisions", :force => true do |t|
    t.string   "record_type", :null => false
    t.integer  "record_id",   :null => false
    t.text     "data"
    t.datetime "created_at"
  end

  add_index "cms_revisions", ["record_type", "record_id", "created_at"], :name => "index_cms_revisions_on_record_type_and_record_id_and_created_at"

  create_table "cms_sites", :force => true do |t|
    t.string  "label",                          :null => false
    t.string  "identifier",                     :null => false
    t.string  "hostname",                       :null => false
    t.string  "path"
    t.string  "locale",      :default => "en",  :null => false
    t.boolean "is_mirrored", :default => false, :null => false
  end

  add_index "cms_sites", ["hostname"], :name => "index_cms_sites_on_hostname"
  add_index "cms_sites", ["is_mirrored"], :name => "index_cms_sites_on_is_mirrored"

  create_table "cms_snippets", :force => true do |t|
    t.integer  "site_id",                       :null => false
    t.string   "label",                         :null => false
    t.string   "identifier",                    :null => false
    t.text     "content"
    t.integer  "position",   :default => 0,     :null => false
    t.boolean  "is_shared",  :default => false, :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "cms_snippets", ["site_id", "identifier"], :name => "index_cms_snippets_on_site_id_and_identifier", :unique => true
  add_index "cms_snippets", ["site_id", "position"], :name => "index_cms_snippets_on_site_id_and_position"

  create_table "coordinator_fees", :id => false, :force => true do |t|
    t.integer "order_cycle_id"
    t.integer "enterprise_fee_id"
  end

  add_index "coordinator_fees", ["enterprise_fee_id"], :name => "index_coordinator_fees_on_enterprise_fee_id"
  add_index "coordinator_fees", ["order_cycle_id"], :name => "index_coordinator_fees_on_order_cycle_id"

  create_table "distributors_payment_methods", :id => false, :force => true do |t|
    t.integer "distributor_id"
    t.integer "payment_method_id"
  end

  add_index "distributors_payment_methods", ["distributor_id"], :name => "index_distributors_payment_methods_on_distributor_id"
  add_index "distributors_payment_methods", ["payment_method_id"], :name => "index_distributors_payment_methods_on_payment_method_id"

  create_table "distributors_shipping_methods", :id => false, :force => true do |t|
    t.integer "distributor_id"
    t.integer "shipping_method_id"
  end

  add_index "distributors_shipping_methods", ["distributor_id"], :name => "index_distributors_shipping_methods_on_distributor_id"
  add_index "distributors_shipping_methods", ["shipping_method_id"], :name => "index_distributors_shipping_methods_on_shipping_method_id"

  create_table "enterprise_fees", :force => true do |t|
    t.integer  "enterprise_id"
    t.string   "fee_type"
    t.string   "name"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "enterprise_fees", ["enterprise_id"], :name => "index_enterprise_fees_on_enterprise_id"

  create_table "enterprise_groups", :force => true do |t|
    t.string   "name"
    t.boolean  "on_front_page"
    t.integer  "position"
    t.string   "promo_image_file_name"
    t.string   "promo_image_content_type"
    t.integer  "promo_image_file_size"
    t.datetime "promo_image_updated_at"
    t.text     "description"
    t.text     "long_description"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
  end

  create_table "enterprise_groups_enterprises", :id => false, :force => true do |t|
    t.integer "enterprise_group_id"
    t.integer "enterprise_id"
  end

  add_index "enterprise_groups_enterprises", ["enterprise_group_id"], :name => "index_enterprise_groups_enterprises_on_enterprise_group_id"
  add_index "enterprise_groups_enterprises", ["enterprise_id"], :name => "index_enterprise_groups_enterprises_on_enterprise_id"

  create_table "enterprise_relationships", :force => true do |t|
    t.integer "parent_id"
    t.integer "child_id"
  end

  add_index "enterprise_relationships", ["child_id"], :name => "index_enterprise_relationships_on_child_id"
  add_index "enterprise_relationships", ["parent_id", "child_id"], :name => "index_enterprise_relationships_on_parent_id_and_child_id", :unique => true
  add_index "enterprise_relationships", ["parent_id"], :name => "index_enterprise_relationships_on_parent_id"

  create_table "enterprise_roles", :force => true do |t|
    t.integer "user_id"
    t.integer "enterprise_id"
  end

  add_index "enterprise_roles", ["enterprise_id"], :name => "index_enterprise_roles_on_enterprise_id"
  add_index "enterprise_roles", ["user_id"], :name => "index_enterprise_roles_on_user_id"

  create_table "enterprises", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.text     "long_description"
    t.boolean  "is_primary_producer"
    t.boolean  "is_distributor"
    t.string   "contact"
    t.string   "phone"
    t.string   "email"
    t.string   "website"
    t.string   "twitter"
    t.string   "abn"
    t.string   "acn"
    t.integer  "address_id"
    t.string   "pickup_times"
    t.string   "next_collection_at"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.text     "distributor_info"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.string   "promo_image_file_name"
    t.string   "promo_image_content_type"
    t.integer  "promo_image_file_size"
    t.datetime "promo_image_updated_at"
    t.boolean  "visible",                  :default => true
    t.string   "facebook"
    t.string   "instagram"
    t.string   "linkedin"
  end

  add_index "enterprises", ["address_id"], :name => "index_enterprises_on_address_id"

  create_table "exchange_fees", :force => true do |t|
    t.integer  "exchange_id"
    t.integer  "enterprise_fee_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "exchange_fees", ["enterprise_fee_id"], :name => "index_exchange_fees_on_enterprise_fee_id"
  add_index "exchange_fees", ["exchange_id"], :name => "index_exchange_fees_on_exchange_id"

  create_table "exchange_variants", :force => true do |t|
    t.integer  "exchange_id"
    t.integer  "variant_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "exchange_variants", ["exchange_id"], :name => "index_exchange_variants_on_exchange_id"
  add_index "exchange_variants", ["variant_id"], :name => "index_exchange_variants_on_variant_id"

  create_table "exchanges", :force => true do |t|
    t.integer  "order_cycle_id"
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.integer  "payment_enterprise_id"
    t.string   "pickup_time"
    t.string   "pickup_instructions"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.boolean  "incoming",              :default => false, :null => false
  end

  add_index "exchanges", ["order_cycle_id"], :name => "index_exchanges_on_order_cycle_id"
  add_index "exchanges", ["payment_enterprise_id"], :name => "index_exchanges_on_payment_enterprise_id"
  add_index "exchanges", ["receiver_id"], :name => "index_exchanges_on_receiver_id"
  add_index "exchanges", ["sender_id"], :name => "index_exchanges_on_sender_id"

  create_table "landing_page_images", :force => true do |t|
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "order_cycles", :force => true do |t|
    t.string   "name"
    t.datetime "orders_open_at"
    t.datetime "orders_close_at"
    t.integer  "coordinator_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "product_distributions", :force => true do |t|
    t.integer  "product_id"
    t.integer  "distributor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "enterprise_fee_id"
  end

  add_index "product_distributions", ["distributor_id"], :name => "index_product_distributions_on_distributor_id"
  add_index "product_distributions", ["enterprise_fee_id"], :name => "index_product_distributions_on_enterprise_fee_id"
  add_index "product_distributions", ["product_id"], :name => "index_product_distributions_on_product_id"

  create_table "spree_activators", :force => true do |t|
    t.string   "description"
    t.datetime "expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "starts_at"
    t.string   "name"
    t.string   "event_name"
    t.string   "type"
    t.integer  "usage_limit"
    t.string   "match_policy", :default => "all"
    t.string   "code"
    t.boolean  "advertise",    :default => false
    t.string   "path"
  end

  create_table "spree_addresses", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "zipcode"
    t.string   "phone"
    t.string   "state_name"
    t.string   "alternative_phone"
    t.integer  "state_id"
    t.integer  "country_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "company"
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "spree_addresses", ["firstname"], :name => "index_addresses_on_firstname"
  add_index "spree_addresses", ["lastname"], :name => "index_addresses_on_lastname"

  create_table "spree_adjustments", :force => true do |t|
    t.integer  "source_id"
    t.decimal  "amount",          :precision => 10, :scale => 2
    t.string   "label"
    t.string   "source_type"
    t.integer  "adjustable_id"
    t.datetime "created_at",                                                       :null => false
    t.datetime "updated_at",                                                       :null => false
    t.boolean  "mandatory"
    t.boolean  "locked"
    t.integer  "originator_id"
    t.string   "originator_type"
    t.boolean  "eligible",                                       :default => true
    t.string   "adjustable_type"
  end

  add_index "spree_adjustments", ["adjustable_id"], :name => "index_adjustments_on_order_id"

  create_table "spree_assets", :force => true do |t|
    t.integer  "viewable_id"
    t.integer  "attachment_width"
    t.integer  "attachment_height"
    t.integer  "attachment_file_size"
    t.integer  "position"
    t.string   "viewable_type",           :limit => 50
    t.string   "attachment_content_type"
    t.string   "attachment_file_name"
    t.string   "type",                    :limit => 75
    t.datetime "attachment_updated_at"
    t.text     "alt"
  end

  add_index "spree_assets", ["viewable_id"], :name => "index_assets_on_viewable_id"
  add_index "spree_assets", ["viewable_type", "type"], :name => "index_assets_on_viewable_type_and_type"

  create_table "spree_calculators", :force => true do |t|
    t.string   "type"
    t.integer  "calculable_id",   :null => false
    t.string   "calculable_type", :null => false
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "spree_configurations", :force => true do |t|
    t.string   "name"
    t.string   "type",       :limit => 50
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  add_index "spree_configurations", ["name", "type"], :name => "index_configurations_on_name_and_type"

  create_table "spree_countries", :force => true do |t|
    t.string  "iso_name"
    t.string  "iso"
    t.string  "iso3"
    t.string  "name"
    t.integer "numcode"
    t.boolean "states_required", :default => true
  end

  create_table "spree_credit_cards", :force => true do |t|
    t.string   "month"
    t.string   "year"
    t.string   "cc_type"
    t.string   "last_digits"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "start_month"
    t.string   "start_year"
    t.string   "issue_number"
    t.integer  "address_id"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.string   "gateway_customer_profile_id"
    t.string   "gateway_payment_profile_id"
  end

  create_table "spree_gateways", :force => true do |t|
    t.string   "type"
    t.string   "name"
    t.text     "description"
    t.boolean  "active",      :default => true
    t.string   "environment", :default => "development"
    t.string   "server",      :default => "test"
    t.boolean  "test_mode",   :default => true
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  create_table "spree_inventory_units", :force => true do |t|
    t.integer  "lock_version",            :default => 0
    t.string   "state"
    t.integer  "variant_id"
    t.integer  "order_id"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.integer  "shipment_id"
    t.integer  "return_authorization_id"
  end

  add_index "spree_inventory_units", ["order_id"], :name => "index_inventory_units_on_order_id"
  add_index "spree_inventory_units", ["shipment_id"], :name => "index_inventory_units_on_shipment_id"
  add_index "spree_inventory_units", ["variant_id"], :name => "index_inventory_units_on_variant_id"

  create_table "spree_line_items", :force => true do |t|
    t.integer  "order_id"
    t.integer  "variant_id"
    t.integer  "quantity",                                            :null => false
    t.decimal  "price",                :precision => 8,  :scale => 2, :null => false
    t.datetime "created_at",                                          :null => false
    t.datetime "updated_at",                                          :null => false
    t.integer  "max_quantity"
    t.string   "currency"
    t.decimal  "distribution_fee",     :precision => 10, :scale => 2
    t.string   "shipping_method_name"
  end

  add_index "spree_line_items", ["order_id"], :name => "index_line_items_on_order_id"
  add_index "spree_line_items", ["variant_id"], :name => "index_line_items_on_variant_id"

  create_table "spree_log_entries", :force => true do |t|
    t.integer  "source_id"
    t.string   "source_type"
    t.text     "details"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "spree_mail_methods", :force => true do |t|
    t.string   "environment"
    t.boolean  "active",      :default => true
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "spree_option_types", :force => true do |t|
    t.string   "name",         :limit => 100
    t.string   "presentation", :limit => 100
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.integer  "position",                    :default => 0, :null => false
  end

  create_table "spree_option_types_prototypes", :id => false, :force => true do |t|
    t.integer "prototype_id"
    t.integer "option_type_id"
  end

  create_table "spree_option_values", :force => true do |t|
    t.integer  "position"
    t.string   "name"
    t.string   "presentation"
    t.integer  "option_type_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "spree_option_values_variants", :id => false, :force => true do |t|
    t.integer "variant_id"
    t.integer "option_value_id"
  end

  add_index "spree_option_values_variants", ["variant_id", "option_value_id"], :name => "index_option_values_variants_on_variant_id_and_option_value_id"
  add_index "spree_option_values_variants", ["variant_id"], :name => "index_option_values_variants_on_variant_id"

  create_table "spree_orders", :force => true do |t|
    t.string   "number",               :limit => 15
    t.decimal  "item_total",                         :precision => 10, :scale => 2, :default => 0.0, :null => false
    t.decimal  "total",                              :precision => 10, :scale => 2, :default => 0.0, :null => false
    t.string   "state"
    t.decimal  "adjustment_total",                   :precision => 10, :scale => 2, :default => 0.0, :null => false
    t.integer  "user_id"
    t.datetime "created_at",                                                                         :null => false
    t.datetime "updated_at",                                                                         :null => false
    t.datetime "completed_at"
    t.integer  "bill_address_id"
    t.integer  "ship_address_id"
    t.decimal  "payment_total",                      :precision => 10, :scale => 2, :default => 0.0
    t.integer  "shipping_method_id"
    t.string   "shipment_state"
    t.string   "payment_state"
    t.string   "email"
    t.text     "special_instructions"
    t.integer  "distributor_id"
    t.integer  "order_cycle_id"
    t.string   "currency"
    t.string   "last_ip_address"
    t.integer  "cart_id"
  end

  add_index "spree_orders", ["number"], :name => "index_orders_on_number"

  create_table "spree_payment_methods", :force => true do |t|
    t.string   "type"
    t.string   "name"
    t.text     "description"
    t.boolean  "active",      :default => true
    t.string   "environment", :default => "development"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.datetime "deleted_at"
    t.string   "display_on"
  end

  create_table "spree_payments", :force => true do |t|
    t.decimal  "amount",               :precision => 10, :scale => 2, :default => 0.0, :null => false
    t.integer  "order_id"
    t.datetime "created_at",                                                           :null => false
    t.datetime "updated_at",                                                           :null => false
    t.integer  "source_id"
    t.string   "source_type"
    t.integer  "payment_method_id"
    t.string   "state"
    t.string   "response_code"
    t.string   "avs_response"
    t.string   "identifier"
    t.string   "cvv_response_code"
    t.string   "cvv_response_message"
  end

  add_index "spree_payments", ["order_id"], :name => "index_spree_payments_on_order_id"

  create_table "spree_paypal_accounts", :force => true do |t|
    t.string "email"
    t.string "payer_id"
    t.string "payer_country"
    t.string "payer_status"
  end

  create_table "spree_pending_promotions", :force => true do |t|
    t.integer "user_id"
    t.integer "promotion_id"
  end

  add_index "spree_pending_promotions", ["promotion_id"], :name => "index_spree_pending_promotions_on_promotion_id"
  add_index "spree_pending_promotions", ["user_id"], :name => "index_spree_pending_promotions_on_user_id"

  create_table "spree_preferences", :force => true do |t|
    t.text     "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "key"
    t.string   "value_type"
  end

  add_index "spree_preferences", ["key"], :name => "index_spree_preferences_on_key", :unique => true

  create_table "spree_prices", :force => true do |t|
    t.integer "variant_id",                               :null => false
    t.decimal "amount",     :precision => 8, :scale => 2
    t.string  "currency"
  end

  add_index "spree_prices", ["variant_id"], :name => "index_spree_prices_on_variant_id"

  create_table "spree_product_groups", :force => true do |t|
    t.string "name"
    t.string "permalink"
    t.string "order"
  end

  add_index "spree_product_groups", ["name"], :name => "index_product_groups_on_name"
  add_index "spree_product_groups", ["permalink"], :name => "index_product_groups_on_permalink"

  create_table "spree_product_groups_products", :id => false, :force => true do |t|
    t.integer "product_id"
    t.integer "product_group_id"
  end

  create_table "spree_product_option_types", :force => true do |t|
    t.integer  "position"
    t.integer  "product_id"
    t.integer  "option_type_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "spree_product_properties", :force => true do |t|
    t.string   "value"
    t.integer  "product_id"
    t.integer  "property_id"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.integer  "position",    :default => 0
  end

  add_index "spree_product_properties", ["product_id"], :name => "index_product_properties_on_product_id"

  create_table "spree_product_scopes", :force => true do |t|
    t.string  "name"
    t.text    "arguments"
    t.integer "product_group_id"
  end

  add_index "spree_product_scopes", ["name"], :name => "index_product_scopes_on_name"
  add_index "spree_product_scopes", ["product_group_id"], :name => "index_product_scopes_on_product_group_id"

  create_table "spree_products", :force => true do |t|
    t.string   "name",                 :default => "",    :null => false
    t.text     "description"
    t.datetime "available_on"
    t.datetime "deleted_at"
    t.string   "permalink"
    t.text     "meta_description"
    t.string   "meta_keywords"
    t.integer  "tax_category_id"
    t.integer  "shipping_category_id"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
    t.integer  "count_on_hand",        :default => 0
    t.integer  "supplier_id"
    t.boolean  "group_buy"
    t.float    "group_buy_unit_size"
    t.boolean  "on_demand",            :default => false
    t.string   "variant_unit"
    t.float    "variant_unit_scale"
    t.string   "variant_unit_name"
    t.text     "notes"
    t.integer  "primary_taxon_id",                        :null => false
  end

  add_index "spree_products", ["available_on"], :name => "index_products_on_available_on"
  add_index "spree_products", ["deleted_at"], :name => "index_products_on_deleted_at"
  add_index "spree_products", ["name"], :name => "index_products_on_name"
  add_index "spree_products", ["permalink"], :name => "index_products_on_permalink"
  add_index "spree_products", ["permalink"], :name => "permalink_idx_unique", :unique => true
  add_index "spree_products", ["primary_taxon_id"], :name => "index_spree_products_on_primary_taxon_id"

  create_table "spree_products_promotion_rules", :id => false, :force => true do |t|
    t.integer "product_id"
    t.integer "promotion_rule_id"
  end

  add_index "spree_products_promotion_rules", ["product_id"], :name => "index_products_promotion_rules_on_product_id"
  add_index "spree_products_promotion_rules", ["promotion_rule_id"], :name => "index_products_promotion_rules_on_promotion_rule_id"

  create_table "spree_products_taxons", :force => true do |t|
    t.integer "product_id"
    t.integer "taxon_id"
  end

  add_index "spree_products_taxons", ["product_id"], :name => "index_products_taxons_on_product_id"
  add_index "spree_products_taxons", ["taxon_id"], :name => "index_products_taxons_on_taxon_id"

  create_table "spree_promotion_action_line_items", :force => true do |t|
    t.integer "promotion_action_id"
    t.integer "variant_id"
    t.integer "quantity",            :default => 1
  end

  create_table "spree_promotion_actions", :force => true do |t|
    t.integer "activator_id"
    t.integer "position"
    t.string  "type"
  end

  create_table "spree_promotion_rules", :force => true do |t|
    t.integer  "activator_id"
    t.integer  "user_id"
    t.integer  "product_group_id"
    t.string   "type"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "spree_promotion_rules", ["product_group_id"], :name => "index_promotion_rules_on_product_group_id"
  add_index "spree_promotion_rules", ["user_id"], :name => "index_promotion_rules_on_user_id"

  create_table "spree_promotion_rules_users", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "promotion_rule_id"
  end

  add_index "spree_promotion_rules_users", ["promotion_rule_id"], :name => "index_promotion_rules_users_on_promotion_rule_id"
  add_index "spree_promotion_rules_users", ["user_id"], :name => "index_promotion_rules_users_on_user_id"

  create_table "spree_properties", :force => true do |t|
    t.string   "name"
    t.string   "presentation", :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "spree_properties_prototypes", :id => false, :force => true do |t|
    t.integer "prototype_id"
    t.integer "property_id"
  end

  create_table "spree_prototypes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "spree_return_authorizations", :force => true do |t|
    t.string   "number"
    t.string   "state"
    t.decimal  "amount",     :precision => 10, :scale => 2, :default => 0.0, :null => false
    t.integer  "order_id"
    t.text     "reason"
    t.datetime "created_at",                                                 :null => false
    t.datetime "updated_at",                                                 :null => false
  end

  create_table "spree_roles", :force => true do |t|
    t.string "name"
  end

  create_table "spree_roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  add_index "spree_roles_users", ["role_id"], :name => "index_roles_users_on_role_id"
  add_index "spree_roles_users", ["user_id"], :name => "index_roles_users_on_user_id"

  create_table "spree_shipments", :force => true do |t|
    t.string   "tracking"
    t.string   "number"
    t.decimal  "cost",               :precision => 8, :scale => 2
    t.datetime "shipped_at"
    t.integer  "order_id"
    t.integer  "shipping_method_id"
    t.integer  "address_id"
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
    t.string   "state"
  end

  add_index "spree_shipments", ["number"], :name => "index_shipments_on_number"
  add_index "spree_shipments", ["order_id"], :name => "index_spree_shipments_on_order_id"

  create_table "spree_shipping_categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "spree_shipping_methods", :force => true do |t|
    t.string   "name"
    t.integer  "zone_id"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "display_on"
    t.integer  "shipping_category_id"
    t.boolean  "match_none"
    t.boolean  "match_all"
    t.boolean  "match_one"
    t.datetime "deleted_at"
    t.boolean  "require_ship_address", :default => true
    t.text     "description"
  end

  create_table "spree_skrill_transactions", :force => true do |t|
    t.string   "email"
    t.float    "amount"
    t.string   "currency"
    t.integer  "transaction_id"
    t.integer  "customer_id"
    t.string   "payment_type"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "spree_state_changes", :force => true do |t|
    t.string   "name"
    t.string   "previous_state"
    t.integer  "stateful_id"
    t.integer  "user_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "stateful_type"
    t.string   "next_state"
  end

  create_table "spree_states", :force => true do |t|
    t.string  "name"
    t.string  "abbr"
    t.integer "country_id"
  end

  create_table "spree_tax_categories", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.boolean  "is_default",  :default => false
    t.datetime "deleted_at"
  end

  create_table "spree_tax_rates", :force => true do |t|
    t.decimal  "amount",             :precision => 8, :scale => 5
    t.integer  "zone_id"
    t.integer  "tax_category_id"
    t.datetime "created_at",                                                          :null => false
    t.datetime "updated_at",                                                          :null => false
    t.boolean  "included_in_price",                                :default => false
    t.string   "name"
    t.boolean  "show_rate_in_label",                               :default => true
  end

  create_table "spree_taxonomies", :force => true do |t|
    t.string   "name",                      :null => false
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.integer  "position",   :default => 0
  end

  create_table "spree_taxons", :force => true do |t|
    t.integer  "parent_id"
    t.integer  "position",          :default => 0
    t.string   "name",                             :null => false
    t.string   "permalink"
    t.integer  "taxonomy_id"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.integer  "lft"
    t.integer  "rgt"
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
    t.datetime "icon_updated_at"
    t.text     "description"
    t.string   "meta_title"
    t.string   "meta_description"
    t.string   "meta_keywords"
  end

  add_index "spree_taxons", ["parent_id"], :name => "index_taxons_on_parent_id"
  add_index "spree_taxons", ["permalink"], :name => "index_taxons_on_permalink"
  add_index "spree_taxons", ["taxonomy_id"], :name => "index_taxons_on_taxonomy_id"

  create_table "spree_tokenized_permissions", :force => true do |t|
    t.integer  "permissable_id"
    t.string   "permissable_type"
    t.string   "token"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "spree_tokenized_permissions", ["permissable_id", "permissable_type"], :name => "index_tokenized_name_and_type"

  create_table "spree_trackers", :force => true do |t|
    t.string   "environment"
    t.string   "analytics_id"
    t.boolean  "active",       :default => true
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "spree_users", :force => true do |t|
    t.string   "encrypted_password"
    t.string   "password_salt"
    t.string   "email"
    t.string   "remember_token"
    t.string   "persistence_token"
    t.string   "reset_password_token"
    t.string   "perishable_token"
    t.integer  "sign_in_count",                        :default => 0, :null => false
    t.integer  "failed_attempts",                      :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "login"
    t.integer  "ship_address_id"
    t.integer  "bill_address_id"
    t.datetime "created_at",                                          :null => false
    t.datetime "updated_at",                                          :null => false
    t.string   "authentication_token"
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "remember_created_at"
    t.string   "spree_api_key",          :limit => 48
    t.datetime "reset_password_sent_at"
    t.string   "api_key",                :limit => 40
  end

  add_index "spree_users", ["email"], :name => "email_idx_unique", :unique => true
  add_index "spree_users", ["persistence_token"], :name => "index_users_on_persistence_token"

  create_table "spree_variants", :force => true do |t|
    t.string   "sku",                                            :default => "",    :null => false
    t.decimal  "weight",           :precision => 8, :scale => 2
    t.decimal  "height",           :precision => 8, :scale => 2
    t.decimal  "width",            :precision => 8, :scale => 2
    t.decimal  "depth",            :precision => 8, :scale => 2
    t.datetime "deleted_at"
    t.boolean  "is_master",                                      :default => false
    t.integer  "product_id"
    t.integer  "count_on_hand",                                  :default => 0
    t.decimal  "cost_price",       :precision => 8, :scale => 2
    t.integer  "position"
    t.integer  "lock_version",                                   :default => 0
    t.boolean  "on_demand",                                      :default => false
    t.string   "cost_currency"
    t.float    "unit_value"
    t.string   "unit_description",                               :default => ""
    t.string   "display_name"
    t.string   "display_as"
  end

  add_index "spree_variants", ["product_id"], :name => "index_variants_on_product_id"

  create_table "spree_zone_members", :force => true do |t|
    t.integer  "zoneable_id"
    t.string   "zoneable_type"
    t.integer  "zone_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "spree_zones", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.boolean  "default_tax",        :default => false
    t.integer  "zone_members_count", :default => 0
  end

  create_table "suburbs", :force => true do |t|
    t.string  "name"
    t.integer "postcode"
    t.float   "latitude"
    t.float   "longitude"
    t.integer "state_id"
  end

  add_foreign_key "adjustment_metadata", "enterprises", name: "adjustment_metadata_enterprise_id_fk"
  add_foreign_key "adjustment_metadata", "spree_adjustments", name: "adjustment_metadata_adjustment_id_fk", column: "adjustment_id"

  add_foreign_key "carts", "spree_users", name: "carts_user_id_fk", column: "user_id"

  add_foreign_key "cms_blocks", "cms_pages", name: "cms_blocks_page_id_fk", column: "page_id"

  add_foreign_key "cms_categories", "cms_sites", name: "cms_categories_site_id_fk", column: "site_id", dependent: :delete

  add_foreign_key "cms_categorizations", "cms_categories", name: "cms_categorizations_category_id_fk", column: "category_id"

  add_foreign_key "cms_files", "cms_blocks", name: "cms_files_block_id_fk", column: "block_id"
  add_foreign_key "cms_files", "cms_sites", name: "cms_files_site_id_fk", column: "site_id"

  add_foreign_key "cms_layouts", "cms_layouts", name: "cms_layouts_parent_id_fk", column: "parent_id"
  add_foreign_key "cms_layouts", "cms_sites", name: "cms_layouts_site_id_fk", column: "site_id", dependent: :delete

  add_foreign_key "cms_pages", "cms_layouts", name: "cms_pages_layout_id_fk", column: "layout_id"
  add_foreign_key "cms_pages", "cms_pages", name: "cms_pages_parent_id_fk", column: "parent_id"
  add_foreign_key "cms_pages", "cms_pages", name: "cms_pages_target_page_id_fk", column: "target_page_id"
  add_foreign_key "cms_pages", "cms_sites", name: "cms_pages_site_id_fk", column: "site_id", dependent: :delete

  add_foreign_key "cms_snippets", "cms_sites", name: "cms_snippets_site_id_fk", column: "site_id", dependent: :delete

  add_foreign_key "coordinator_fees", "enterprise_fees", name: "coordinator_fees_enterprise_fee_id_fk"
  add_foreign_key "coordinator_fees", "order_cycles", name: "coordinator_fees_order_cycle_id_fk"

  add_foreign_key "distributors_payment_methods", "enterprises", name: "distributors_payment_methods_distributor_id_fk", column: "distributor_id"
  add_foreign_key "distributors_payment_methods", "spree_payment_methods", name: "distributors_payment_methods_payment_method_id_fk", column: "payment_method_id"

  add_foreign_key "distributors_shipping_methods", "enterprises", name: "distributors_shipping_methods_distributor_id_fk", column: "distributor_id"
  add_foreign_key "distributors_shipping_methods", "spree_shipping_methods", name: "distributors_shipping_methods_shipping_method_id_fk", column: "shipping_method_id"

  add_foreign_key "enterprise_fees", "enterprises", name: "enterprise_fees_enterprise_id_fk"

  add_foreign_key "enterprise_groups_enterprises", "enterprise_groups", name: "enterprise_groups_enterprises_enterprise_group_id_fk"
  add_foreign_key "enterprise_groups_enterprises", "enterprises", name: "enterprise_groups_enterprises_enterprise_id_fk"

  add_foreign_key "enterprise_relationships", "enterprises", name: "enterprise_relationships_child_id_fk", column: "child_id"
  add_foreign_key "enterprise_relationships", "enterprises", name: "enterprise_relationships_parent_id_fk", column: "parent_id"

  add_foreign_key "enterprise_roles", "enterprises", name: "enterprise_roles_enterprise_id_fk"
  add_foreign_key "enterprise_roles", "spree_users", name: "enterprise_roles_user_id_fk", column: "user_id"

  add_foreign_key "enterprises", "spree_addresses", name: "enterprises_address_id_fk", column: "address_id"

  add_foreign_key "exchange_fees", "enterprise_fees", name: "exchange_fees_enterprise_fee_id_fk"
  add_foreign_key "exchange_fees", "exchanges", name: "exchange_fees_exchange_id_fk"

  add_foreign_key "exchange_variants", "exchanges", name: "exchange_variants_exchange_id_fk"
  add_foreign_key "exchange_variants", "spree_variants", name: "exchange_variants_variant_id_fk", column: "variant_id"

  add_foreign_key "exchanges", "enterprises", name: "exchanges_payment_enterprise_id_fk", column: "payment_enterprise_id"
  add_foreign_key "exchanges", "enterprises", name: "exchanges_receiver_id_fk", column: "receiver_id"
  add_foreign_key "exchanges", "enterprises", name: "exchanges_sender_id_fk", column: "sender_id"
  add_foreign_key "exchanges", "order_cycles", name: "exchanges_order_cycle_id_fk"

  add_foreign_key "order_cycles", "enterprises", name: "order_cycles_coordinator_id_fk", column: "coordinator_id"

  add_foreign_key "product_distributions", "enterprise_fees", name: "product_distributions_enterprise_fee_id_fk"
  add_foreign_key "product_distributions", "enterprises", name: "product_distributions_distributor_id_fk", column: "distributor_id"
  add_foreign_key "product_distributions", "spree_products", name: "product_distributions_product_id_fk", column: "product_id"

  add_foreign_key "spree_addresses", "spree_countries", name: "spree_addresses_country_id_fk", column: "country_id"
  add_foreign_key "spree_addresses", "spree_states", name: "spree_addresses_state_id_fk", column: "state_id"

  add_foreign_key "spree_inventory_units", "spree_orders", name: "spree_inventory_units_order_id_fk", column: "order_id"
  add_foreign_key "spree_inventory_units", "spree_return_authorizations", name: "spree_inventory_units_return_authorization_id_fk", column: "return_authorization_id"
  add_foreign_key "spree_inventory_units", "spree_shipments", name: "spree_inventory_units_shipment_id_fk", column: "shipment_id"
  add_foreign_key "spree_inventory_units", "spree_variants", name: "spree_inventory_units_variant_id_fk", column: "variant_id"

  add_foreign_key "spree_line_items", "spree_orders", name: "spree_line_items_order_id_fk", column: "order_id"
  add_foreign_key "spree_line_items", "spree_variants", name: "spree_line_items_variant_id_fk", column: "variant_id"

  add_foreign_key "spree_option_types_prototypes", "spree_option_types", name: "spree_option_types_prototypes_option_type_id_fk", column: "option_type_id"
  add_foreign_key "spree_option_types_prototypes", "spree_prototypes", name: "spree_option_types_prototypes_prototype_id_fk", column: "prototype_id"

  add_foreign_key "spree_option_values", "spree_option_types", name: "spree_option_values_option_type_id_fk", column: "option_type_id"

  add_foreign_key "spree_option_values_variants", "spree_option_values", name: "spree_option_values_variants_option_value_id_fk", column: "option_value_id"
  add_foreign_key "spree_option_values_variants", "spree_variants", name: "spree_option_values_variants_variant_id_fk", column: "variant_id"

  add_foreign_key "spree_orders", "carts", name: "spree_orders_cart_id_fk"
  add_foreign_key "spree_orders", "enterprises", name: "spree_orders_distributor_id_fk", column: "distributor_id"
  add_foreign_key "spree_orders", "order_cycles", name: "spree_orders_order_cycle_id_fk"
  add_foreign_key "spree_orders", "spree_addresses", name: "spree_orders_bill_address_id_fk", column: "bill_address_id"
  add_foreign_key "spree_orders", "spree_addresses", name: "spree_orders_ship_address_id_fk", column: "ship_address_id"
  add_foreign_key "spree_orders", "spree_users", name: "spree_orders_user_id_fk", column: "user_id"

  add_foreign_key "spree_payments", "spree_orders", name: "spree_payments_order_id_fk", column: "order_id"
  add_foreign_key "spree_payments", "spree_payment_methods", name: "spree_payments_payment_method_id_fk", column: "payment_method_id"

  add_foreign_key "spree_prices", "spree_variants", name: "spree_prices_variant_id_fk", column: "variant_id"

  add_foreign_key "spree_product_option_types", "spree_option_types", name: "spree_product_option_types_option_type_id_fk", column: "option_type_id"
  add_foreign_key "spree_product_option_types", "spree_products", name: "spree_product_option_types_product_id_fk", column: "product_id"

  add_foreign_key "spree_product_properties", "spree_products", name: "spree_product_properties_product_id_fk", column: "product_id"
  add_foreign_key "spree_product_properties", "spree_properties", name: "spree_product_properties_property_id_fk", column: "property_id"

  add_foreign_key "spree_products", "enterprises", name: "spree_products_supplier_id_fk", column: "supplier_id"
  add_foreign_key "spree_products", "spree_shipping_categories", name: "spree_products_shipping_category_id_fk", column: "shipping_category_id"
  add_foreign_key "spree_products", "spree_tax_categories", name: "spree_products_tax_category_id_fk", column: "tax_category_id"
  add_foreign_key "spree_products", "spree_taxons", name: "spree_products_primary_taxon_id_fk", column: "primary_taxon_id"

  add_foreign_key "spree_products_promotion_rules", "spree_products", name: "spree_products_promotion_rules_product_id_fk", column: "product_id"
  add_foreign_key "spree_products_promotion_rules", "spree_promotion_rules", name: "spree_products_promotion_rules_promotion_rule_id_fk", column: "promotion_rule_id"

  add_foreign_key "spree_products_taxons", "spree_products", name: "spree_products_taxons_product_id_fk", column: "product_id", dependent: :delete
  add_foreign_key "spree_products_taxons", "spree_taxons", name: "spree_products_taxons_taxon_id_fk", column: "taxon_id", dependent: :delete

  add_foreign_key "spree_promotion_action_line_items", "spree_promotion_actions", name: "spree_promotion_action_line_items_promotion_action_id_fk", column: "promotion_action_id"
  add_foreign_key "spree_promotion_action_line_items", "spree_variants", name: "spree_promotion_action_line_items_variant_id_fk", column: "variant_id"

  add_foreign_key "spree_promotion_actions", "spree_activators", name: "spree_promotion_actions_activator_id_fk", column: "activator_id"

  add_foreign_key "spree_promotion_rules", "spree_activators", name: "spree_promotion_rules_activator_id_fk", column: "activator_id"

  add_foreign_key "spree_properties_prototypes", "spree_properties", name: "spree_properties_prototypes_property_id_fk", column: "property_id"
  add_foreign_key "spree_properties_prototypes", "spree_prototypes", name: "spree_properties_prototypes_prototype_id_fk", column: "prototype_id"

  add_foreign_key "spree_return_authorizations", "spree_orders", name: "spree_return_authorizations_order_id_fk", column: "order_id"

  add_foreign_key "spree_roles_users", "spree_roles", name: "spree_roles_users_role_id_fk", column: "role_id"
  add_foreign_key "spree_roles_users", "spree_users", name: "spree_roles_users_user_id_fk", column: "user_id"

  add_foreign_key "spree_shipments", "spree_addresses", name: "spree_shipments_address_id_fk", column: "address_id"
  add_foreign_key "spree_shipments", "spree_orders", name: "spree_shipments_order_id_fk", column: "order_id"

  add_foreign_key "spree_shipping_methods", "spree_shipping_categories", name: "spree_shipping_methods_shipping_category_id_fk", column: "shipping_category_id"
  add_foreign_key "spree_shipping_methods", "spree_zones", name: "spree_shipping_methods_zone_id_fk", column: "zone_id"

  add_foreign_key "spree_state_changes", "spree_users", name: "spree_state_changes_user_id_fk", column: "user_id"

  add_foreign_key "spree_states", "spree_countries", name: "spree_states_country_id_fk", column: "country_id"

  add_foreign_key "spree_tax_rates", "spree_tax_categories", name: "spree_tax_rates_tax_category_id_fk", column: "tax_category_id"
  add_foreign_key "spree_tax_rates", "spree_zones", name: "spree_tax_rates_zone_id_fk", column: "zone_id"

  add_foreign_key "spree_taxons", "spree_taxonomies", name: "spree_taxons_taxonomy_id_fk", column: "taxonomy_id"
  add_foreign_key "spree_taxons", "spree_taxons", name: "spree_taxons_parent_id_fk", column: "parent_id"

  add_foreign_key "spree_users", "spree_addresses", name: "spree_users_bill_address_id_fk", column: "bill_address_id"
  add_foreign_key "spree_users", "spree_addresses", name: "spree_users_ship_address_id_fk", column: "ship_address_id"

  add_foreign_key "spree_variants", "spree_products", name: "spree_variants_product_id_fk", column: "product_id"

  add_foreign_key "spree_zone_members", "spree_zones", name: "spree_zone_members_zone_id_fk", column: "zone_id"

  add_foreign_key "suburbs", "spree_states", name: "suburbs_state_id_fk", column: "state_id"

end
