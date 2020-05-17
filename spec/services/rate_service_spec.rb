# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RateService, type: :service do
  describe 'class methods' do
    subject { described_class }

    it { is_expected.to respond_to(:new, :call) }
  end

  describe '#call' do
    before { stub_request(:get, /cbr/).to_return(body: body) }

    subject(:result) { described_class.call }

    let(:body) { %(<Valute ID="R01235"><Value>#{rate}</Value></Valute>) }
    let(:rate) { '68.3456' }

    context 'when force_rate dosn`t exist' do
      it 'returns rate from cbr' do
        expect(result).to eq(rate)
      end
    end

    context 'when force_rate exist' do
      let(:force_rate) { create(:force_rate, expire_datetime: expire_datetime) }

      context 'when force_rate dosn`t expire' do
        let(:expire_datetime) { Time.now + 3.days }

        it 'returns rate from cbr' do
          force_rate
          expect(result).to eq(force_rate.rate.to_s)
        end
      end

      context 'when force_rate expire' do
        let(:expire_datetime) { Time.now - 3.days }

        it 'returns rate from cbr' do
          force_rate
          expect(result).to eq(rate)
        end
      end
    end
  end
end