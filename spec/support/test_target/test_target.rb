# frozen_string_literal: true

class TestTarget
  def self.self_method; end

  def self.deprecated_self_method; end

  def method; end

  def deprecated_method; end
end

TestTarget.self_method
TestTarget.new.method
