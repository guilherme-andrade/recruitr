class ApplicationService
  attr_reader :result, :errors

  def self.call(*args)
    new(*args).tap do |service|
      service.instance_variable_set(:@result, nil)
      service.instance_variable_set(:@errors, [])
      service.before_call
      service.call
    end
  end

  def success?
    errors.empty?
  end

  def call; end

  def before_call; end
end
