# frozen_string_literal: true

require 'spec_helper'

describe Roo::OpenOffice do
  describe '.new' do
    subject do
      Roo::OpenOffice.new('test/files/numbers1.ods')
    end

    it 'creates an instance' do
      expect(subject).to be_a(Roo::OpenOffice)
    end
  end

  describe '#cell' do
    let(:open_offset_sheet) { Roo::OpenOffice.new('test/files/numbers1.ods') }

    specify do
      expect(open_offset_sheet.cell(1, 1)).to eq(1.0)
      expect(open_offset_sheet.cell(2, 1)).to eq(5.0)
      expect(open_offset_sheet.cell(3, 1)).to be_nil
      expect(open_offset_sheet.cell(4, 1)).to eq(10.0)
      expect(open_offset_sheet.cell(5, 1)).to eq(Date.new(1961, 11, 21))
      expect(open_offset_sheet.cell(6, 1)).to eq('tata')
      expect(open_offset_sheet.cell(7, 1)).to be_nil
      expect(open_offset_sheet.cell(8, 1)).to be_nil
      expect(open_offset_sheet.cell(9, 1)).to be_nil
      expect(open_offset_sheet.cell(10, 1)).to be_nil
      expect(open_offset_sheet.cell(11, 1)).to eq('thisisa11')
      expect(open_offset_sheet.cell(12, 1)).to eq(41.0)
      expect(open_offset_sheet.cell(13, 1)).to be_nil
      expect(open_offset_sheet.cell(14, 1)).to be_nil
      expect(open_offset_sheet.cell(15, 1)).to eq(41.0)
      expect(open_offset_sheet.cell(16, 1)).to eq('einundvierzig')
      expect(open_offset_sheet.cell(17, 1)).to be_nil
      expect(open_offset_sheet.cell(18, 1)).to eq(Date.new(2007, 5, 31))
    end
  end
end
