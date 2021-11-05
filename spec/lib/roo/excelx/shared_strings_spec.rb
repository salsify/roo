# frozen_string_literal: true

require 'spec_helper'

describe Roo::Excelx::SharedStrings do
  describe "#to_a" do
    # Example from https://docs.microsoft.com/en-us/office/open-xml/working-with-the-shared-string-table
    let(:shared_string_xml) do
      <<-SHARED_STRING_XML
        <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
            <sst xmlns="https://schemas.openxmlformats.org/spreadsheetml/2006/main" count="6" uniqueCount="5">
        <si>
            <t>Cell A1</t>
        </si>
        <si>
            <t>Cell B1</t>
        </si>
        <si>
            <t>My Cell</t>
        </si>
        <si>
            <r>
                <rPr>
                    <sz val="11"/>
                    <color rgb="FFFF0000"/>
                    <rFont val="Calibri"/>
                    <family val="2"/>
                    <scheme val="minor"/>
                </rPr>
                <t>Cell</t>
            </r>
            <r>
                <rPr>
                    <sz val="11"/>
                    <color theme="1"/>
                    <rFont val="Calibri"/>
                    <family val="2"/>
                    <scheme val="minor"/>
                </rPr>
                <t xml:space="preserve"> </t>
            </r>
            <r>
                <rPr>
                    <b/>
                    <sz val="11"/>
                    <color theme="1"/>
                    <rFont val="Calibri"/>
                    <family val="2"/>
                    <scheme val="minor"/>
                </rPr>
                <t>A2</t>
            </r>
        </si>
        <si>
            <r>
                <rPr>
                    <sz val="11"/>
                    <color rgb="FF00B0F0"/>
                    <rFont val="Calibri"/>
                    <family val="2"/>
                    <scheme val="minor"/>
                </rPr>
                <t>Cell</t>
            </r>
            <r>
                <rPr>
                    <sz val="11"/>
                    <color theme="1"/>
                    <rFont val="Calibri"/>
                    <family val="2"/>
                    <scheme val="minor"/>
                </rPr>
                <t xml:space="preserve"> </t>
            </r>
            <r>
                <rPr>
                    <i/>
                    <sz val="11"/>
                    <color theme="1"/>
                    <rFont val="Calibri"/>
                    <family val="2"/>
                    <scheme val="minor"/>
                </rPr>
                <t>B2</t>
            </r>
        </si>
    </sst>
      SHARED_STRING_XML
    end

    around do |example|
      Tempfile.open('shared_strings') do |file|
        @filepath = file.path
        file.write(shared_string_xml)
        file.close
        example.run
      end
    end

    it "creates an array of strings" do
      expect(described_class.new(@filepath).to_a).to eq(["Cell A1", "Cell B1", "My Cell", "Cell A2", "Cell B2"])
    end
  end
end
