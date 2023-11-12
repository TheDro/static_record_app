
module ActiveRecord
  module ConnectionHandling # :nodoc:
    def static_adapter_class
      ConnectionAdapters::StaticAdapter
    end

    def static_connection(config)
      static_adapter_class.new(config)
    end
  end

  module ConnectionAdapters # :nodoc:
    class StaticAdapter < AbstractAdapter
      def initialize(...)
        binding.pry
        super
      end

      def data_source_sql(name = nil, type: nil)
        binding.pry
        ""
      end

      def primary_keys(table_name)
        ["id"]
      end

      # [{"cid"=>0, "name"=>"id", "type"=>"INTEGER", "notnull"=>1, "dflt_value"=>nil, "pk"=>1, "auto_increment"=>true},
      #  {"cid"=>1, "name"=>"street", "type"=>"varchar", "notnull"=>0, "dflt_value"=>nil, "pk"=>0},
      #  {"cid"=>2, "name"=>"city", "type"=>"varchar", "notnull"=>0, "dflt_value"=>nil, "pk"=>0},
      #  {"cid"=>3, "name"=>"region_id", "type"=>"varchar", "notnull"=>0, "dflt_value"=>nil, "pk"=>0},
      #  {"cid"=>4, "name"=>"country_id", "type"=>"bigint", "notnull"=>0, "dflt_value"=>nil, "pk"=>0},
      #  {"cid"=>5, "name"=>"zip_code", "type"=>"varchar", "notnull"=>0, "dflt_value"=>nil, "pk"=>0},
      #  {"cid"=>6, "name"=>"user_id", "type"=>"bigint", "notnull"=>0, "dflt_value"=>nil, "pk"=>0},
      #  {"cid"=>7, "name"=>"created_at", "type"=>"datetime(6)", "notnull"=>1, "dflt_value"=>nil, "pk"=>0},
      #  {"cid"=>8, "name"=>"updated_at", "type"=>"datetime(6)", "notnull"=>1, "dflt_value"=>nil, "pk"=>0}]
      def column_definitions(table_name)
        [
          {"name"=> "id", "type"=>"INTEGER", "pk"=>1},
          {"name"=> "name", "type"=>"varchar", "pk"=>0},
        ]
      end

      def new_column_from_field(table_name, field, definitions)
        # ActiveRecord::ConnectionAdapters::Column.new(
        #   field["name"],
        #   nil
        # )
        binding.pry
        Struct.new(:name, :type, :pk, :sql_type, :default)
              .new(field["name"], field["type"], field["pk"], field["type"], nil)
      end

      def internal_exec_query(sql, name = nil, binds = [], prepare: false, async: false)
        binding.pry
        build_result(columns: [], rows: [])
        build_result(columns: ["id", "name"], rows: [[1, "Ontario"]])
        # ActiveRecord::Result.new(["id", "name"], [[1, "Ontario"]], {})
      end

    #   TODO: override select_all instead
    end
    ActiveSupport.run_load_hooks(:active_record_static_adapter, StaticAdapter)
  end
end