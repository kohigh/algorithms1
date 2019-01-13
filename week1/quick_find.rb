class QuickFind
  attr_reader :arr

  def initialize(n)
    @arr = Array.new(n, &:to_i)

    self
  end

  def union(p, q)
    old_p = @arr[p]

    @arr.collect! { |i| i == old_p ? @arr[i] = @arr[q] : i  }

    self
  end

  def connected?(p, q)
    @arr[p] == @arr[q]
  end
end
