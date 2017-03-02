# frozen_string_literal: true
require "spec_helper"
require 'yaml'

def each_target
  targets = Dir['woothee/testsets/*.yaml']

  targets.each do |filename|
    YAML.load_file(filename).each do |e|
      yield e, File.basename(filename, ".yaml")
    end
  end
end

describe FastWoothee do
  it "has a version number" do
    expect(FastWoothee::VERSION).not_to be nil
  end

  each_target do |e, groupname|
    r = FastWoothee.parse(e['target'])

    context "#{groupname}: #{e['target']}" do
      testable_keys = e.keys.map(&:to_sym).reject { |i| i == :target }

      testable_keys.each do |attr|
        it attr do
          expect(r[attr].to_s).to eql(e[attr.to_s])
        end
      end

      it "crawler?" do
        expected = e['category'] == 'crawler' && e['name'] != 'misc crawler'
        expect(FastWoothee.crawler?(e['target'])).to eq(expected)
      end
    end
  end
end
