require "bsielski/trunctate_by_char"

RSpec.describe BSielski::TrunctateByChar do

  subject(:trunctated) {
    described_class.new(limit: limit, suffix: suffix).call(string)
  }

  context "without options" do
    let (:limit) { nil }
    let (:suffix) { nil }
    let (:string) { "A proper string" }

    it "doesn't work" do
      expect{trunctated}.to raise_error "no options"
    end
  end

  context "proper options" do
    scenarios = [
      { limit: 3, suffix: "...", string: "abc",           output: "abc"},
      { limit: 3, suffix: "...", string: "The quick fox", output: "The..."},
      { limit: 3, suffix: "...", string: "",              output: ""},
      { limit: 3, suffix: "...", string: " ",             output: " " },

      { limit: 1, suffix: "...", string: "abc",           output: "a..."},
      { limit: 1, suffix: "...", string: "The quick fox", output: "T..."},
      { limit: 1, suffix: "...", string: "",              output: ""},
      { limit: 1, suffix: "...", string: " ",             output: " " },

      { limit: 1, suffix: "", string: "abc",           output: "a"},
      { limit: 3, suffix: "", string: "The quick fox", output: "The"},
      { limit: 3, suffix: "", string: "",              output: ""},
      { limit: 3, suffix: "", string: " ",             output: " " },
    ]

    scenarios.each do |scenario|
      context "limit: #{scenario[:limit]}, " +
              "suffix: #{scenario[:suffix].inspect}, string: #{scenario[:string].inspect}" do
        let (:limit) { scenario[:limit] }
        let (:suffix) { scenario[:suffix] }
        let (:string) { scenario[:string] }
        
        it "returns #{scenario[:output].inspect}" do
          expect(trunctated).to eq scenario[:output]
        end
      end
    end
  end
end
