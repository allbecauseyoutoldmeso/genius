# frozen_string_literal: true

shared_examples_for 'code_pegs_validator' do
  describe '#valid?' do
    it 'is false if there are more than 4 pegs' do
      subject.code_pegs = %w[red green yellow blue pink]

      expect(subject.valid?).to eq(false)

      expect(
        subject.errors.messages[:code_pegs]
      ).to contain_exactly(
        I18n.t(
          'activerecord.errors.models.guess.attributes.code_pegs.more_than_four'
        )
      )
    end

    it 'is false if there are less than 4 pegs' do
      subject.code_pegs = %w[red green yellow]

      expect(subject.valid?).to eq(false)

      expect(
        subject.errors.messages[:code_pegs]
      ).to contain_exactly(
        I18n.t(
          'activerecord.errors.models.guess.attributes.code_pegs.less_than_four'
        )
      )
    end

    it 'is false if colours are invalid' do
      subject.code_pegs = %w[red green yellow turquoise]

      expect(subject.valid?).to eq(false)

      expect(
        subject.errors.messages[:code_pegs]
      ).to contain_exactly(
        I18n.t(
          'activerecord.errors.models.guess.attributes.code_pegs.invalid_colours'
        )
      )
    end
  end
end
