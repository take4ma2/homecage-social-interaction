# frozen_string_literal: true

# HomecageSocialInteraction module
module HomecageSocialInteraction
  # Datum class
  class Datum
    attr_accessor :cage_id
    attr_accessor :animal_id
    attr_accessor :group_id
    attr_accessor :n
    attr_accessor :dates
    attr_accessor :particles
    attr_accessor :xors
    attr_accessor :xs1, :xs2, :xs3, :xs4
    attr_accessor :ys1, :ys2, :ys3, :ys4
    attr_accessor :areas1, :areas2, :areas3, :areas4

    def initialize(cage_id = '')
      @cage_id = cage_id
      @dates = []
      @particles = []
      @xors = []
      @xs1 = []
      @xs2 = []
      @xs3 = []
      @xs4 = []
      @ys1 = []
      @ys2 = []
      @ys3 = []
      @ys4 = []
      @areas1 = []
      @areas2 = []
      @areas3 = []
      @areas4 = []
    end

    #
    # Total duration of contacting two subjects
    # @return [Float] Duration of contact(sec.)
    #
    def duration_of_contact
      t = 0.0
      contacts.each_with_index do |(d, b), i|
        next if i <= 0
        t += d - @dates[i - 1] if b
      end
      t
    end

    def each_minutes
      contact = contacts
      start = contact[0][0]
      durs = []
      index = 0
      dur = 0.0
      contact.each_with_index do |(d, b), i|
        next if i.zero?
        dur += d - @dates[i - 1] if b
        if d - start >= 60.0
          durs << dur
          dur = 0.0
          start = d
          index += 1
        end
      end
      durs
    end

    #
    # Total duration of contacting two subjects
    # @return [Float] Duration of contact(sec.)
    #
    def n_of_contact
      cnt = 0
      pre = false
      contacts.each_with_index do |c, i|
        next if i.zero?

        cnt += 1 if (pre != c[1]) && c[1]
        pre = c[1]
      end
      cnt
    end

    #
    # Create Array([date,  N of particles is 1.0 or not])
    # @return [Array] [date, N of particles is 1.0 or not]
    #
    def contacts
      contact = @particles.map { |p| p < 2.0 }
      vals = []
      @dates.each_with_index { |d, i| vals << [d, contact[i]] }
      vals
    end
  end
end
