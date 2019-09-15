RSpec.describe Pq2 do
  it 'has a version number' do
    expect(Pq2::VERSION).not_to be nil
  end

  context 'README.md example 1' do
    let(:pq) { described_class.new }

    it do
      pq.push(2)
      pq.push(1)
      pq.push(3)
      expect(pq.empty?).to be false
      expect(pq.pop).to eq 1
      expect(pq.first).to eq 2
      expect(pq.pop).to eq 2
      expect(pq.pop).to eq 3
      expect(pq.empty?).to be true
    end
  end

  context 'README.md example 2' do
    let(:pq) { described_class.new(emails) }
    let(:emails) { [email1, email2, email3, email4] }
    let(:email1) { Email.new('a@github.com') }
    let(:email2) { Email.new('a@example.com') }
    let(:email3) { Email.new('b@github.com') }
    let(:email4) { Email.new('b@example.com') }

    before do
      class Email
        include Comparable

        attr_reader :domain, :local

        def initialize(email)
          @local, @domain = email.split(?@)
        end

        def <=>(other)
          order = domain <=> other.domain
          return order unless order == 0
          local <=> other.domain
        end
      end
    end

    it do
      expect(pq.pop).to eq email2
      expect(pq.pop).to eq email4
      expect(pq.pop).to eq email1
      expect(pq.pop).to eq email3
    end
  end
end
