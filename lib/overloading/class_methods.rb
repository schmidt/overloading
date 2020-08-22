module Overloading::ClassMethods
  def method_added(method_name)
    return if @do_not_track

    @methods ||= {}
    @methods[method_name] ||= {}

    methods = @methods[method_name]

    method = instance_method(method_name)

    methods[method.arity] = method

    @do_not_track = true

    define_method(method_name) do |*args|
      method = methods[args.size]
      if method
        method.bind(self).call(*args)
      else
        super(*args)
      end
    end
  ensure
    @do_not_track = false
  end
end
