require "haikunator/version"

module Haikunator
  ADJECTIVES = %w[
    aged amazing ancient autumn awesome bare beautiful big
    billowing bitter black blue bold bright broken clear
    cold cool crimson crisp crystal damp dark dawn delicate
    delightful divine dry elegant empty enormous fading
    fallen falling fantastic fine floral fragrant fresh
    frosty gentle golden gracious green handsome hidden holy
    hot icy joyful late lingering little lively lonely long
    lovely marvelous merciful misty morning muddy nameless
    old painful patient peaceful perfect polished pretty
    proud pure purple quiet raw red refreshing restful
    restless rough sacred secluded sharp shy silent simple
    sleepy small smooth snowy soaring soft solitary sparkling
    spring startling still stunning summer surprising sweet
    tender throbbing tiny tranquil twilight unexpected unusual
    wandering warm weathered weightless wet white wild winter
    wispy withered wonderful young
  ].freeze

  NOUNS = %w[
    air amber apple bamboo bell bird blood breadcrumb breeze
    brook bush butterfly candle canyon cave cherry cloud color
    creek crescent darkness dawn dew diamond dove dream dust
    evening face feather field fire firefly flower fog forest
    frog frost glade glitter grass half hand haze heart hill
    ice journey kitten lake leaf leave life light marionette
    meadow mirror monk moon moonlight morning mountain nighfall
    night orb origami paper pebble petal pine pond puppy quarter
    rain rainbow resonance retreat river rock sand scroll sea
    seed shadow shape silence skin sky smile smoke snow
    snowflake someone sound spring star stone summer sun sunset
    sunshine surf sword tea temple thunder tree violet voice
    water waterfall wave wheelhouse whisper wildflower wildness
    wind wood world zen one first two second three third four
    fourth five fifth six sixth seven seventh eight eighth nine
    ninth ten tenth eleven eleventh twelve twelfth thirteen
    thirteenth fourteen fifteen sixteen sixteenth seventeen
    seventeenth eighteen eighteenth nineteen nineteenth twenty
    twentieth hundreds thousands millions many some
  ].freeze

  class << self
    def haikunate(str, token_range = 9999, delimiter = "-")
      @prng = Random.new(str.to_s.gsub(/\H/, "").to_i(16))
      build(token_range, delimiter)
    end

    private

    def build(token_range, delimiter)
      [
        ADJECTIVES[random(ADJECTIVES.length)],
        NOUNS[random(NOUNS.length)],
        random(token_range)
      ].compact.join(delimiter)
    end

    def random(range)
      @prng.rand(range) unless range < 1
    end
  end
end
