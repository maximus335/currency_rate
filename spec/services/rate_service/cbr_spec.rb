# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RateService::Cbr, type: :service do
  describe 'class methods' do
    subject { described_class }

    it { is_expected.to respond_to(:new, :call) }
  end

  describe '#call' do
    before { stub_request(:get, /cbr/).to_return(body: body) }

    subject(:result) { described_class.call }

    let(:body) { nil }

    context 'when response body is supported' do
      let(:body) { %(<Valute ID="R01235"><Value>#{rate}</Value></Valute>) }
      let(:rate) { '68.3456' }

      it 'returns value' do
        expect(result).to eq(rate)
      end
    end

    context 'when response body is not supported' do
      let(:body) { %(<Valute ID="R01235"><NotSuppoted></NotSuppoted></Valute>) }

      it 'returns nil' do
        expect(result).to be_nil
      end
    end

    context 'when retuned error' do
      before { allow(HTTP).to receive(:get).and_raise }

      it 'returns nil' do
        expect(result).to be_nil
      end
    end
  end
end