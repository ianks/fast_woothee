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

known_failures = [
  # https://github.com/woothee/woothee-rust/issues/14
  "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 YaBrowser/17.11.1.1087 (beta) Yowser/2.5 Safari/537.36"
]

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
          skip 'Known failure' if known_failures.include?(e['target'])

          expect(r[attr].to_s).to eql(e[attr.to_s])
        end
      end

      it "crawler?" do
        expected = e['category'] == 'crawler' && e['name'] != 'misc crawler'
        expect(FastWoothee.crawler?(e['target'])).to eq(expected)
      end
    end
  end

  describe "#is_safari_mobile" do
    it "detects when it is an iphone" do
      expect(FastWoothee.ios?("Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1")).to be(true)
    end
  end
end
