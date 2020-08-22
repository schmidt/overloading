require 'overloading/version'

module Overloading
  def self.included(base)
    base.extend(Overloading::ClassMethods)
  end
end

require 'overloading/class_methods'
