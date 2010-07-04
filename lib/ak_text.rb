# AkText

class String
  def levenshtein_with(s2)
	String.levenshtein(self, s2)
  end

  def self.levenshtein(s1, s2)
    if $KCODE =~ /^U/i
      unpack_rule = 'U*'
    else
      unpack_rule = 'C*'
    end
    s = s1.unpack(unpack_rule)
    t = s2.unpack(unpack_rule)
    n = s.length
    m = t.length
    return m if (0 == n)
    return n if (0 == m)
    d = (0..m).to_a
    x = nil
    (0...n).each do |i|
      e = i + 1
      (0...m).each do |j|
        cost = (s[i] == t[j]) ? 0 : 1
        x = [d[j + 1] + 1, e + 1, d[j] + cost].min
        d[j] = e
        e = x
      end
      d[m] = x
    end
    return x
  end
end