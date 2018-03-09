module NillyVanilly
  # Inspect the database schema, in a quest to find columns suitable for nillification.
  class Inspect
    def initialize
      @results = []
    end

    # A nested array with one row for each column suitable for nillification.
    def results
      ActiveRecord::Base.connection.tables.each do |table|
        model = table.classify.constantize rescue next

        model.columns.each do |column|
          present = model.respond_to?(:nillify_attributes) && model.nillify_attributes.include?(column.name.to_sym)

          @results << [present, model.name, column.name] if include_column(column)
        end
      end

      @results
    end

    # Print an inspection report to stdout.
    def self.print
      new.results.each do |result|
        puts [result[0] ? "[OK]" : "[  ]", result[1].ljust(20), result[2]].join(" ")
      end
    end

    private
      def include_column(column)
        %i(string text).include?(column.type) && column.null && column.default.nil?
      end
  end
end
