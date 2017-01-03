require "factorymethods/version"

module FactoryMethods
  def deffactory(name, *args)
    define_singleton_method(name.to_sym) do |*args, &block|
      instance = self.new(*args)

      if block
        instance.send(name.to_sym, &block)
      else
        instance.send(name.to_sym)
      end
    end
  end
end
