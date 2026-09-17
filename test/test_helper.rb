# frozen_string_literal: true

require "simplecov"
SimpleCov.start do
  if respond_to?(:skip)
    skip "/test/"
  else
    add_filter "/test/"
  end
end

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "cyrillic"

require "minitest/autorun"
require "open3"
