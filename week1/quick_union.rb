class QuickUnion
  attr_reader :arr

  def initialize(n)
    @arr = Array.new(n, &:to_i)

    self
  end

  def union(p, q)
    @arr[root(p)] = @arr[root(q)]

    self
  end

  def connected?(p, q)
    @arr[root(p)] == @arr[root(q)]
  end

  private

  def root(x)
    loop do
      break x if @arr[x] == x

      x = @arr[x]
    end
  end
end
