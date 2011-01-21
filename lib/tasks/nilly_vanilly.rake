namespace :nilly do
  namespace :vanilly do
    task :inspect => :environment do
      ActiveRecord::Base.connection.tables.each do |table|
        model = table.classify.constantize rescue next
        
        model.columns.each do |column|
          if model.respond_to?(:nillify_attributes) && model.nillify_attributes.include?(column.name.to_sym)
            present = "[OK]"
          else
            present = "[  ]"
          end

          if column.text? && column.null && column.default.nil?
            puts [present, model.name.ljust(20), column.name].join(" ")
          end
        end
      end
    end
  end
end