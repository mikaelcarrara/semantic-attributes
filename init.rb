# TODO: organize the library code to take advantage of ActiveSupport's auto-loading

require 'predicates'
require 'semantic_attribute'
require 'semantic_attributes'
require 'active_record_predicates'
require 'attribute_formats'
require 'validation_recursion_control'

module Predicates; end
predicates_directory = "#{File.dirname __FILE__}/lib/predicates"
Dir[File.join(predicates_directory, '*.rb')].each do |file|
  constant_name = File.basename(file, '.rb').camelcase
  Predicates.autoload(constant_name, file)
end

ActiveRecord::Base.send(:include, ActiveRecord::Predicates)
ActiveRecord::Base.send(:include, ActiveRecord::AttributeFormats)
ActiveRecord::Base.send(:include, ActiveRecord::ValidationRecursion)

# localization mock
ActiveRecord::Base.class_eval do
  unless respond_to? :_
    def _(s); s; end
  end
end