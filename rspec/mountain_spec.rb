describe Mountain do
  context '.new_from_page' do
    it 'it instantiates a mtn based on the 14ers webpage' do
      handies_peak = Mountain.new_from_page("https://www.outtherecolorado.com/gallery/colorados-14ers-ranked-by-difficulty/")

      expect(handies_peak).to be_an_instance_of(Mountain)
      expect(handies_peak.name).to eq("Handies Peak")
      expect(handies_peak.standard_route).to eq("Southwest Slopes")
      expect(handies_peak.elevation_gain).to eq("2,500 feet")
      expect(handies_peak.distance).to eq("5.75 miles")
      expect(handies_peak.klass_difficulty).to eq("Class 1")

    end
  end

  content 'details' do
end
